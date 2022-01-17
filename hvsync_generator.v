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
	
		reg[6:0] curx = 0;
		reg[4:0] cury = 1;
	
    wire CounterXmaxed = (CounterX == 800); // 16 + 48 + 96 + 640
    wire CounterYmaxed = (CounterY == 525); // 10 + 2 + 33 + 480
		
	 wire state_sw;
	 wire sw_down;
	 wire sw_up;
	 
/*	 wire state_sw1;
	 wire sw_down1;
	 wire sw_up1;*/
	 
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
	//Debouncer Deboun1(.clk(clk),.PB(sw_cc), .PB_state(state_sw1), .PB_down(sw_down1), .PB_up(sw_up1) );
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

	
	reg dis0x1;
	reg dis1x1;
	reg dis2x1;
	reg dis3x1;
	reg dis4x1;
	reg dis5x1;
	reg dis6x1;
	reg dis7x1;
	
	reg dis0x2;
	reg dis1x2;
	reg dis2x2;
	reg dis3x2;
	reg dis4x2;
	reg dis5x2;
	reg dis6x2;
	reg dis7x2;
	
	reg dis0x3;
	reg dis1x3;
	reg dis2x3;
	reg dis3x3;
	reg dis4x3;
	reg dis5x3;
	reg dis6x3;
	reg dis7x3;
	
	reg dis0x4;
	reg dis1x4;
	reg dis2x4;
	reg dis3x4;
	reg dis4x4;
	reg dis5x4;
	reg dis6x4;
	reg dis7x4;
	
	reg dis0x5;
	reg dis1x5;
	reg dis2x5;
	reg dis3x5;
	reg dis4x5;
	reg dis5x5;
	reg dis6x5;
	reg dis7x5;
	
	reg dis0x6;
	reg dis1x6;
	reg dis2x6;
	reg dis3x6;
	reg dis4x6;
	reg dis5x6;
	reg dis6x6;
	reg dis7x6;
	
	reg dis0x7;
	reg dis1x7;
	reg dis2x7;
	reg dis3x7;
	reg dis4x7;
	reg dis5x7;
	reg dis6x7;
	reg dis7x7;
	
	reg dis0x8;
	reg dis1x8;
	reg dis2x8;
	reg dis3x8;
	reg dis4x8;
	reg dis5x8;
	reg dis6x8;
	reg dis7x8;
	
	reg dis0x9;
	reg dis1x9;
	reg dis2x9;
	reg dis3x9;
	reg dis4x9;
	reg dis5x9;
	reg dis6x9;
	reg dis7x9;
	
	reg dis0x10;
	reg dis1x10;
	reg dis2x10;
	reg dis3x10;
	reg dis4x10;
	reg dis5x10;
	reg dis6x10;
	reg dis7x10;
	
	reg dis0x11;
	reg dis1x11;
	reg dis2x11;
	reg dis3x11;
	reg dis4x11;
	reg dis5x11;
	reg dis6x11;
	reg dis7x11;
	
	reg dis0x12;
	reg dis1x12;
	reg dis2x12;
	reg dis3x12;
	reg dis4x12;
	reg dis5x12;
	reg dis6x12;
	reg dis7x12;
	
	reg dis0x13;
	reg dis1x13;
	reg dis2x13;
	reg dis3x13;
	reg dis4x13;
	reg dis5x13;
	reg dis6x13;
	reg dis7x13;
	
	reg dis0x14;
	reg dis1x14;
	reg dis2x14;
	reg dis3x14;
	reg dis4x14;
	reg dis5x14;
	reg dis6x14;
	reg dis7x14;
	
	reg dis0x15;
	reg dis1x15;
	reg dis2x15;
	reg dis3x15;
	reg dis4x15;
	reg dis5x15;
	reg dis6x15;
	reg dis7x15;
	
	reg disall0;
	reg disall1;
	reg disall2;
	reg disall3;
	reg disall4;
	reg disall5;
	reg disall6;
	reg disall7;
	reg disall8;
	reg disall9;
	reg disall10;
	reg disall11;
	reg disall12;
	reg disall13;
	reg disall14;
	reg disall15;
	
	reg mem[15:0][7:0];
	wire [7:0] LTA [15:0];
	
//alpha	reg [7:0]X = 8'b01000000;
/*	reg [7:0]X = 8'b00110000;
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
		/*				if (X == 8'b00111001)
							begin
								X <= 8'b00110000;
							end
					
					end
			end */ 
		wire [7:0]apl ;
		assign  apl = {sw_p8, sw_p7, sw_p6, sw_p5, sw_p4, sw_p3, sw_p2, sw_p1};
		
	Lookup_Alphabet LUT_A(.clk(state_sw), .a(apl), .r0(LTA[0]), .r1(LTA[1]), .r2(LTA[2]), .r3(LTA[3]), .r4(LTA[4]), .r5(LTA[5]), .r6(LTA[6]), .r7(LTA[7]), .r8(LTA[8]), .r9(LTA[9]), .r10(LTA[10]), .r11(LTA[11]), .r12(LTA[12]), .r13(LTA[13]), .r14(LTA[14]), .r15(LTA[15]));

		reg [8:0] framebuffer [80][480];
		always @(posedge clk)
			begin
				integer i, j;
					begin
						for (i = 0 ; i < 16;i = i+1)
							begin
								for(j = 0 ; j < 8; j = j+1)
									begin
										mem[i][j] = LTA[i][j];
										
									end
							end
						
					end
			end
			
	reg [9:0] posx = 0;
	reg [8:0] posy = 0;
	
    always @(posedge clk)
    if (curx == 640)
      curx <= 0;
    else
      curx <= curx + 1;

    always @(posedge clk)
    begin
      if (curx == 640)
      begin
        if(cury == 480)
          cury <= 0;
        else
          cury <= cury + 1;
      end
    end
		
			
		// cur
	/*	always @(posedge clk)
			begin
				inDisplayArea <= inDisplaySelect ;// & (CounterX < (curx * 8) & CounterX > ((curx-1) * 8)) & (CounterY < (cury*16)); 
			end
			*/
				
				
		always @(posedge clk)
			begin
				dis1x0 <= (((CounterX < 8) & mem[0][7-CounterX]) & (CounterY == (0))); 
				dis1x0 <= ((CounterX < 8) & mem[1][7-CounterX]) & (CounterY == (1)); 
				dis2x0 <= ((CounterX < 8) & mem[2][7-CounterX]) & (CounterY == (2)); 
				dis3x0 <= ((CounterX < 8) & mem[3][7-CounterX]) & (CounterY == (3)); 
				dis4x0 <= ((CounterX < 8) & mem[4][7-CounterX]) & (CounterY == (4)); 
				dis5x0 <= ((CounterX < 8) & mem[5][7-CounterX]) & (CounterY == (5)); 
				dis6x0 <= ((CounterX < 8) & mem[6][7-CounterX]) & (CounterY == (6)); 
				dis7x0 <= (((CounterX < 8) & mem[7][7-CounterX]) & (CounterY == (7))); 
				dis8x0 <= (((CounterX < 8) & mem[8][7-CounterX]) & (CounterY == (8))); 
				dis9x0 <= (((CounterX < 8) & mem[9][7-CounterX]) & (CounterY == (9))); 
				dis10x0 <= (((CounterX < 8) & mem[10][7-CounterX]) & (CounterY == (10))); 
				dis11x0 <= (((CounterX < 8) & mem[11][7-CounterX]) & (CounterY == (11))); 
				dis12x0 <= (((CounterX < 8) & mem[12][7-CounterX]) & (CounterY == (12))); 
				dis13x0 <= (((CounterX < 8) & mem[13][7-CounterX]) & (CounterY == (13))); 
				dis14x0 <= (((CounterX < 8) & mem[14][7-CounterX]) & (CounterY == (14))); 
				dis15x0 <= (((CounterX < 8) & mem[15][7-CounterX]) & (CounterY == (15))); 
	 		end	
			
		always @(posedge clk)
			begin
				disall0 <=(dis0x0 | dis1x0 | dis2x0 | dis3x0 | dis4x0 | dis5x0 | dis6x0 | dis7x0 | dis8x0 | dis9x0 | dis10x0 | dis11x0 | dis12x0 | dis13x0 | dis14x0 | dis15x0);

				
				inDisplayArea <= inDisplaySelect & disall0 ;
			end
		
	

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
