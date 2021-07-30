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

	 
	 wire r0;wire r1;wire r2;wire r3;wire r4;wire r5;wire r6;wire r7;wire r8;wire r9;wire r10;		
	Lookup_Alphabet lookupTB(.s(state_sw ),.a(00110000),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10));
	
		reg[6:0] curx = 0;
		reg[4:0] cury = 1;
	
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
	 //count position		
	always @(posedge state_sw1)
		begin
			if (curx == 80 && cury < 30 )
				begin
					curx <= 0;
					cury <= cury +1;
				end
			else if (curx == 80 && cury == 30 )
				begin
					cury <= 1;
					curx <= 0;
				end
			else 
				begin
					curx <= curx +1;
					cury <= cury;
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
	reg curser;
// cur
always @(posedge clk)
	begin
		inDisplayArea <= inDisplaySelect & (CounterX < (curx * 8) & CounterX > ((curx-1) * 8)) & (CounterY == (cury*15)); 
	end
	
   

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
