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

		
    always @(posedge clk)
    begin
      vga_HS <= (CounterX > (640 + 16) && (CounterX < (640 + 16 + 96)));   // active for 96 clocks
      vga_VS <= (CounterY > (480 + 10) && (CounterY < (480 + 10 + 2)));   // active for 2 clocks
    end
	  
		// display 640*480
	  always @(posedge clk)
			begin
				inDisplaySelect <= (CounterX < 640) && (CounterY < 480);
			end
	reg curser;
	

		
			
// alpha set
	reg [9:0] x;
	reg [8:0] y;
	
	reg [7:0]dis0x0;
	reg [7:0]dis1x0;
	reg [7:0]dis2x0;
	reg [7:0]dis3x0;
	reg [7:0]dis4x0;
	reg [7:0]dis5x0;
	reg [7:0]dis6x0;
	reg [7:0]dis7x0;
	reg [7:0]dis8x0;
	reg [7:0]dis9x0;
	reg [7:0]dis10x0;
	reg [7:0]dis11x0;
	reg [7:0]dis12x0;
	reg [7:0]dis13x0;
	reg [7:0]dis14x0;
	reg [7:0]dis15x0;
	
	reg disall0;

	

	wire [7:0] LTA [15:0];
	
//alpha	reg [7:0]X = 8'b01000000;
	reg [7:0]X = 8'b00110000;
		reg [24:0] cnt;    
		reg [24:0] Blank = 4000000;
		reg [24:0] reset = 8000000;

		always @ (posedge clk) 
			begin  
				if (cnt == reset)  
					begin
						cnt <= 0;  
					end
				else
					begin
						cnt <= cnt + 1; 
						if (cnt == Blank)  
							begin
								X <= X + 1;
							end
				////////////////////////// apha
					/*	if (X == 8'b01011010)
							begin
								X <= 8'b01000000;
							end*/
				///////////////////////// num
						if (X == 8'b00111001)
							begin
								X <= 8'b00110000;
							end
					
					end
			end  
		wire [7:0]check;
	Lookup_Alphabet LUT_A( .a(8'b01000001), .r0(LTA[0]), .r1(LTA[1]), .r2(LTA[2]), .r3(LTA[3]), .r4(LTA[4]), .r5(LTA[5]), .r6(LTA[6]), .r7(LTA[7]), .r8(LTA[8]), .r9(LTA[9]), .r10(LTA[10]), .r11(LTA[11]), .r12(LTA[12]), .r13(LTA[13]), .r14(LTA[14]), .r15(LTA[15]),.check(check));

	
	reg[6:0] curx = ;
	reg[4:0] cury = 0;
	
	////////////////////////////////////////////////////////////////////count buffer		
	always @(posedge state_sw)
		begin
			if (curx == 80 && cury < 30 )
				begin
					curx <= 0;
					cury <= cury +1;
				end
			else if (curx == 80 && cury == 30 )
				begin
					cury <= 0;
					curx <= 0;
				end
			else 
				begin
					curx <= curx +1;
					cury <= cury;
				end
		end
			
//////////////////////////////////////////////////////set buffer	
		reg mem[15:0][7:0];	
		reg [8:0] framebuffer [79:0][15:0];
	
		always @(posedge curx)
			begin
				integer i, j;
					begin
						for(j = 0 ; j < 16; j = j+1)
							begin
								framebuffer[curx][j] = LTA[j];
							end
					end
			end
			
	reg [9:0] posx = 0;
	reg [8:0] posy = 0;
	
		// cur
	/*	always @(posedge clk)
			begin
				inDisplayArea <= inDisplaySelect ;// & (CounterX < (curx * 8) & CounterX > ((curx-1) * 8)) & (CounterY < (cury*16)); 
			end
			*/
		always @(posedge check)
			begin
				dis1x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+0][7-CounterX]) & (CounterY == ((cury*15)+0))); 
				dis1x0 <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+1][7-CounterX]) & (CounterY == ((cury*15)+1)); 
				dis2x0 <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+2][7-CounterX]) & (CounterY == ((cury*15)+2)); 
				dis3x0 <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+3][7-CounterX]) & (CounterY == ((cury*15)+3)); 
				dis4x0 <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+4][7-CounterX]) & (CounterY == ((cury*15)+4)); 
				dis5x0 <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+5][7-CounterX]) & (CounterY == ((cury*15)+5)); 
				dis6x0 <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+6][7-CounterX]) & (CounterY == ((cury*15)+6)); 
				dis7x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+7][7-CounterX]) & (CounterY == ((cury*15)+7))); 
				dis8x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+8][7-CounterX]) & (CounterY == ((cury*15)+8))); 
				dis9x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+9][7-CounterX]) & (CounterY == ((cury*15)+9))); 
				dis10x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+10][7-CounterX]) & (CounterY == ((cury*15)+10))); 
				dis11x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+11][7-CounterX]) & (CounterY == ((cury*15)+11))); 
				dis12x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+12][7-CounterX]) & (CounterY == ((cury*15)+12))); 
				dis13x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+13][7-CounterX]) & (CounterY == ((cury*15)+13))); 
				dis14x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+14][7-CounterX]) & (CounterY == ((cury*15)+14))); 
				dis15x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+15][7-CounterX]) & (CounterY == ((cury*15)+15))); 
	 		end	
			
		always @(posedge clk)
			begin
				disall0 <=(dis0x0 | dis1x0 | dis2x0 | dis3x0 | dis4x0 | dis5x0 | dis6x0 | dis7x0 | dis8x0 | dis9x0 | dis10x0 | dis11x0 | dis12x0 | dis13x0 | dis14x0 | dis15x0);
	
				inDisplayArea <= inDisplaySelect & disall0 ;
			end
		
	

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
