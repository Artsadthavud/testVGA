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
	 output reg  red,
    output reg  green,
    output reg  blue
  );
    reg vga_HS, vga_VS;
	 reg [2:0]sw_mode;
		reg [9:0] CounterX;
		reg [9:0] CounterY;
	 
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
	
/*	reg dis0x0[29:0];
	reg dis1x0[29:0];
	reg dis2x0[29:0];
	reg dis3x0[29:0];
	reg dis4x0[29:0];
	reg dis5x0[29:0];
	reg dis6x0[29:0];
	reg dis7x0[29:0];
	reg dis8x0[29:0];
	reg dis9x0[29:0];
	reg dis10x0[29:0];
	reg dis11x0[29:0];
	reg dis12x0[29:0];
	reg dis13x0[29:0];
	reg dis14x0[29:0];
	reg dis15x0[29:0];
	
	reg disall0;
*/
	wire [7:0] LTA [15:0];
	
	//reg [7:0]X = 8'b01000000;
//num	reg [7:0]X = 8'b00110000;
	/*
		always @(posedge state_sw1)
			begin
				if (X == 8'b01011010)
					begin
						X <= 8'b01000000;
					end
				else 
					begin
						X <= X + 1;
					end
			end
	*/
				////////////////////////// apha
					/*	if (X == 8'b01011010)
							begin
								X <= 8'b01000000;
							end
				///////////////////////// num
						if (X == 8'b00111001)
						
								X <= 8'b00110000;
				*/
		wire [7:0]check;
	Lookup_Alphabet LUT_A( .a(8'b01000001), .r0(LTA[0]), .r1(LTA[1]), .r2(LTA[2]), .r3(LTA[3]), .r4(LTA[4]), .r5(LTA[5]), .r6(LTA[6]), .r7(LTA[7]), .r8(LTA[8]), .r9(LTA[9]), .r10(LTA[10]), .r11(LTA[11]), .r12(LTA[12]), .r13(LTA[13]), .r14(LTA[14]), .r15(LTA[15]),.check(check));

	reg[9:0] curx = 0;
	reg[9:0] cury = 0;
			reg[6:0] cx = 0;
		//reg[6:0] cxmax = 0;
		reg[6:0] cy = 0;
		//reg[4:0] cymax = 0;
	////////////////////////////////////////////////////////////////////count buffer		
	always @(posedge state_sw)
		begin
			if (curx == 79 && cury < 29 )
				begin
					curx <= 0;
					cury <= cury +1;
				end
			else if (curx == 79 && cury == 29 )
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
	//	reg mem[15:0][7:0];	
	
		reg framebuffer [479:0][639:0];
		reg [9:0]k;
		//reg [8:0] framebuffer [79:0][15:0];
		reg redbuffer [79:0][1:0];
		reg greenbuffer [79:0][1:0];
		reg bluebuffer [79:0][1:0];
		always @(posedge state_sw)		
			begin
			integer i, j;
				cx = (curx*7);
				cy = (cury*15);
				//	cxmax = (cx+7);
				//	cymax = (cy+15);
				for(i = 0 ; i <= 15; i = i+1)
					begin
						for(j = 0; j <= 7; j = j+1)
							begin
								k = cx+j;
								framebuffer[i][k] = LTA[i][j];
								
								redbuffer[k][cy] = sw_p1;
								greenbuffer[k][cy] = sw_p2;
								bluebuffer[k][cy] = sw_p3;
							end
					end
			end
	////////////////////////////////////////////////////////////////////count buffer		
		// cur
	/*	always @(posedge clk)
			begin
				inDisplayArea <= inDisplaySelect ;// & (CounterX < (curx * 8) & CounterX > ((curx-1) * 8)) & (CounterY < (cury*16)); 
			end
			*/
		/*	always @(posedge curx)
			begin
				integer i, j;
					begin
						for(j = 0 ; j < 16; j = j+1)
							begin
								framebuffer[curx][j] = LTA[j];
								redbuffer[cx][cy] = sw_p1;
								greenbuffer[cx][cy] = sw_p2;
								bluebuffer[cx][cy] = sw_p3;
							end
					end
			end*/
	/*	always @(posedge clk)
			begin
				dis1x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+0][7-CounterX]) & (CounterY == ((cury*15)+0))); 
				dis1x0[cury] <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+1][7-CounterX]) & (CounterY == ((cury*15)+1)); 
				dis2x0[cury] <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+2][7-CounterX]) & (CounterY == ((cury*15)+2)); 
				dis3x0[cury] <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+3][7-CounterX]) & (CounterY == ((cury*15)+3)); 
				dis4x0[cury] <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+4][7-CounterX]) & (CounterY == ((cury*15)+4)); 
				dis5x0[cury] <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+5][7-CounterX]) & (CounterY == ((cury*15)+5)); 
				dis6x0[cury] <= ((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+6][7-CounterX]) & (CounterY == ((cury*15)+6)); 
				dis7x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+7][7-CounterX]) & (CounterY == ((cury*15)+7))); 
				dis8x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+8][7-CounterX]) & (CounterY == ((cury*15)+8))); 
				dis9x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+9][7-CounterX]) & (CounterY == ((cury*15)+9))); 
				dis10x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+10][7-CounterX]) & (CounterY == ((cury*15)+10))); 
				dis11x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+11][7-CounterX]) & (CounterY == ((cury*15)+11))); 
				dis12x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+12][7-CounterX]) & (CounterY == ((cury*15)+12))); 
				dis13x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+13][7-CounterX]) & (CounterY == ((cury*15)+13))); 
				dis14x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+14][7-CounterX]) & (CounterY == ((cury*15)+14))); 
				dis15x0[cury] <= (((CounterX < 8 + (curx*8)) & framebuffer[curx][(cury*15)+15][7-CounterX]) & (CounterY == ((cury*15)+15))); 
			end*/
			reg dis;
		always @(posedge clk)
			begin
			dis <=  framebuffer[CounterY][CounterX];
			inDisplayArea <= inDisplaySelect & dis;
			
		/*	disall0 <=(dis0x0[0] | dis1x0[0] | dis2x0[0] | dis3x0[0] | dis4x0[0] | dis5x0[0] | dis6x0[0] | dis7x0[0] | dis8x0[0] | dis9x0[0] | dis10x0[0] | dis11x0[0] | dis12x0[0] | dis13x0[0] | dis14x0[0] | dis15x0[0]);
	
				inDisplayArea <= inDisplaySelect & disall0 ;*/
				red <= redbuffer[CounterX][0];
				green <= greenbuffer[CounterX][0];
				blue <= bluebuffer[CounterX][0];
			end
    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule