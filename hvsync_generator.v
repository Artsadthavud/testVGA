module hvsync_generator(
    input clk,
	 input sw_p1,
	 input sw_p2,
	 input sw_p3,
	 input sw_p4,
	 input sw_p5,
	 input sw_p6,
	 input sw_p7,
	 input sw_p8,
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
	
	wire [7:0]apl ;
		assign  apl = { sw_p8,sw_p7,sw_p6,sw_p5, sw_p4, sw_p3, sw_p2, sw_p1};
		
	wire [7:0] LTA [15:0];	
	
		wire [7:0]check;
		
	Lookup_Alphabet LUT_A( .sw(state_sw), .a(8'b01000001), .r0(LTA[0]), .r1(LTA[1]), .r2(LTA[2]), .r3(LTA[3]), .r4(LTA[4]), .r5(LTA[5]), .r6(LTA[6]), .r7(LTA[7]), .r8(LTA[8]), .r9(LTA[9]), .r10(LTA[10]), .r11(LTA[11]), .r12(LTA[12]), .r13(LTA[13]), .r14(LTA[14]), .r15(LTA[15]),.check(check));
		

			
//////////////////////////////////////////////////////set buffer	
		//reg [7:0] framebuffer [20:0][15:0];
		
	/*	always @(posedge check)
			begin
				integer j;
					begin
						for(j = 0 ; j < 16; j = j+1)
							begin
								framebuffer[curx][j] = LTA[j];
							end
							
					end
			end
			*/
				
	reg[6:0] curx = 0;
	reg[4:0] cury = 0;	
	////////////////////////////////////////////////////////////////////count buffer	
		always @(posedge state_sw)
			begin
			if (curx == 2 && cury < 29 )
				begin
					curx <= 0;
					cury <= cury +1;
				end
			else if (curx == 2 && cury == 29 )
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
		reg[9:0] cx = 0;
		//reg[6:0] cxmax = 0;
		reg[6:0] cy = 0;
		//reg[4:0] cymax = 0;
	
	reg framebuffer [479:0][639:0];
	reg [9:0]k;
	reg [9:0]c;
		//reg [8:0] framebuffer [79:0][15:0];
		always @(posedge state_sw)		
			begin
			integer i, j;
				cx = (curx*7);
				cy = (cury*15);
				//	cxmax = (cx+7);
				//	cymax = (cy+15);
				if(curx < 5)
					begin
						for(i = 0 ; i <= 15; i = i+1)
							begin
								for(j = 0; j <= 7; j = j+1)
									begin
										k = cx+j;
										c = cy+i;
										framebuffer[i][k] = LTA[c][7-j];
									end
							end
					end
			end
			
			
	
		// cur
	/*	always @(posedge clk)
			begin
				inDisplayArea <= inDisplaySelect ;// & (CounterX < (curx * 8) & CounterX > ((curx-1) * 8)) & (CounterY < (cury*16)); 
			end
			*/
	/*	always @(posedge check)
			begin
				dis1x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][0][7-CounterX]) & (CounterY == (0))); 
				dis1x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][1][7-CounterX]) & (CounterY == (1))); 
				dis2x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][2][7-CounterX]) & (CounterY == (2))); 
				dis3x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][3][7-CounterX]) & (CounterY == (3))); 
				dis4x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][4][7-CounterX]) & (CounterY == (4))); 
				dis5x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][5][7-CounterX]) & (CounterY == (5))); 
				dis6x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][6][7-CounterX]) & (CounterY == (6))); 
				dis7x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][7][7-CounterX]) & (CounterY == (7))); 
				dis8x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][8][7-CounterX]) & (CounterY == (8))); 
				dis9x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][9][7-CounterX]) & (CounterY == (9))); 
				dis10x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][10][7-CounterX]) & (CounterY == (10))); 
				dis11x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][11][7-CounterX]) & (CounterY == (11))); 
				dis12x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][12][7-CounterX]) & (CounterY == (12))); 
				dis13x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][13][7-CounterX]) & (CounterY == (13))); 
				dis14x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][14][7-CounterX]) & (CounterY == (14))); 
				dis15x0 <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][15][7-CounterX]) & (CounterY == (15))); 
	 		end	
			*/
		reg dis;
		always @(posedge clk)
			begin
			dis <= framebuffer[CounterY][CounterX] ;
			//	disall0 <=(dis0x0 | dis1x0 | dis2x0 | dis3x0 | dis4x0 | dis5x0 | dis6x0 | dis7x0 | dis8x0 | dis9x0 | dis10x0 | dis11x0 | dis12x0 | dis13x0 | dis14x0 | dis15x0);
	
				inDisplayArea <= inDisplaySelect & dis;
			end
		
	

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
