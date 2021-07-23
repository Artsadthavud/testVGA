module hvsync_generator(
    input clk,
	 input sw_p1,
	 input sw_p2,
	 input sw_p3,
	 input [2:0]sw_cp,
	 input [2:0]sw_cc,
    output vga_h_sync,
    output vga_v_sync,
    output reg inDisplayArea,
	 output reg inDisplaySelect,
	 output reg [3:0] countPos,
    output reg [9:0] CounterX,
    output reg [9:0] CounterY
  );
    reg vga_HS, vga_VS;
	 reg [3:0]countPosition;
	 reg [2:0]sw_mode;

    wire CounterXmaxed = (CounterX == 800); // 16 + 48 + 96 + 640
    wire CounterYmaxed = (CounterY == 525); // 10 + 2 + 33 + 480
		
	 wire state_sw;
	 wire sw_down;
	 wire sw_up;
	 
	 wire state_sw1;
	 wire sw_down1;
	 wire sw_up1;
	 
    always @(posedge clk)
    if (CounterXmaxed)
      CounterX <= 0;
    else
      CounterX <= CounterX + 1;

    always @(posedge clk)
    begin
      if (CounterXmaxed)
      begin
        if(CounterYmaxed)
          CounterY <= 0;
        else
          CounterY <= CounterY + 1;
      end
    end

	Debouncer Deboun(.clk(clk),.PB(sw_cp), .PB_state(state_sw), .PB_down(sw_down), .PB_up(sw_up) );
	Debouncer Deboun1(.clk(clk),.PB(sw_cc), .PB_state(state_sw1), .PB_down(sw_down1), .PB_up(sw_up1) );
	 		
	always @(posedge state_sw1)
		begin
			if (sw_mode == 1)
				begin
				sw_mode <= 0;
				end
			else 
				begin
				sw_mode <= sw_mode + 1 ;
				end
		end
		
	 always @(posedge state_sw )
		begin
			if(sw_mode == 0)
				countPosition <= 0;
			else if(sw_mode == 1 && countPosition == 0)
				begin
				countPosition <= 1 ;
				countPos = countPosition; 	
				end
			else if (countPosition == 8 && sw_mode == 1)
				begin
				countPosition <= 1;
				countPos = countPosition; 	
				end
			else if(sw_mode == 1 && countPosition > 0)
				begin
				countPosition <= countPosition + 1 ;
				countPos = countPosition; 	
				end
			
		end

	 
    always @(posedge clk)
    begin
      vga_HS <= (CounterX > (640 + 16) && (CounterX < (640 + 16 + 96)));   // active for 96 clocks
      vga_VS <= (CounterY > (480 + 10) && (CounterY < (480 + 10 + 2)));   // active for 2 clocks
    end
	  

	  always @(posedge clk)
			begin
				inDisplaySelect <= (CounterX < 640) && (CounterY < 480);
			end
			
    always @(posedge clk)
    begin
	 
		if(countPosition == 1)			//0
			begin
				 inDisplayArea <= (CounterX < 160) && (CounterY < 240);
			
			end
			
		else if(countPosition == 2) 	//1
			begin
				 inDisplayArea <= (CounterX > 159) && (CounterX < 320) && (CounterY < 240);
			
			end
			
		else if(countPosition == 3)	//2
			begin
				 inDisplayArea <= (CounterX > 319) && (CounterX < 480) && (CounterY < 240);
			 	
			end
			
		else if(countPosition == 4)	//3
			begin
				 inDisplayArea <= (CounterX > 479) && (CounterX < 640) && (CounterY < 240);
				
			end	
			
			if(countPosition == 8)		//7
			begin
				 inDisplayArea <= (CounterX < 160) && (CounterY < 480)  && (CounterY > 239);
				
			end
			
		else if(countPosition == 7)	//6
			begin
				 inDisplayArea <= (CounterX > 159) && (CounterX < 320) && (CounterY < 480)  && (CounterY > 239);
				
			end
			
		else if(countPosition == 6)	//5
			begin
				 inDisplayArea <= (CounterX > 319) && (CounterX < 480) && (CounterY < 480)  && (CounterY > 239);
				 
			end
			
		else if(countPosition == 5)	//4
			begin
				 inDisplayArea <= (CounterX > 479) && (CounterX < 640) && (CounterY < 480) && (CounterY > 239) ;
				 
			end		
    end

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule