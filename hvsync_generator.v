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
	  
		// display 640*480
	  always @(posedge clk)
			begin
				inDisplaySelect <= (CounterX < 640) && (CounterY < 480);
			end
	reg curser;
	
// cur
	/*	always @(posedge clk)
			begin
				inDisplayArea <= inDisplaySelect ;// & (CounterX < (curx * 8) & CounterX > ((curx-1) * 8)) & (CounterY == (cury*15)); 
			end
			*/
			
// alpha set
	reg [9:0] x;
	reg [8:0] y;
	
	reg dis0x0;
	reg dis1x0;
	reg dis2x0;
	reg dis3x0;
	reg dis4x0;
	reg dis5x0;
	reg dis6x0;
	reg dis7x0;
	
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
	
	
		always @(posedge clk)
			begin
				dis0x0 <= (((CounterX == 0) & 1) & (CounterY == (0))); 
				dis1x0 <= ((CounterX == 1) & 1) & (CounterY == (0)); 
				dis2x0 <= ((CounterX == 2) & 0) & (CounterY == (0)); 
				dis3x0 <= ((CounterX == 3) & 0) & (CounterY == (0)); 
				dis4x0 <= ((CounterX == 4) & 0) & (CounterY == (0)); 
				dis5x0 <= ((CounterX == 6) & 0) & (CounterY == (0)); 
				dis6x0 <= ((CounterX == 5) & 0) & (CounterY == (0)); 
				dis7x0 <= (((CounterX == 7) & 1) & (CounterY == (0))); 
	 		end	
			always @(posedge clk)
			begin
				dis0x1 <= ((CounterX == 0) & 1) & (CounterY == (1)); 
				dis1x1 <= ((CounterX == 1) & 1) & (CounterY == (1)); 
				dis2x1 <= ((CounterX == 2) & 0) & (CounterY == (1)); 
				dis3x1 <= ((CounterX == 3) & 0) & (CounterY == (1)); 
				dis4x1 <= ((CounterX == 4) & 0) & (CounterY == (1)); 
				dis5x1 <= ((CounterX == 6) & 0) & (CounterY == (1)); 
				dis6x1 <= ((CounterX == 5) & 0) & (CounterY == (1)); 
				dis7x1 <= ((CounterX == 7) & 0) & (CounterY == (1)); 
			
					end	
			always @(posedge clk)
			begin
				dis0x2 <= ((CounterX == 0) & 1) & (CounterY == (2)); 
				dis1x2 <= ((CounterX == 1) & 1) & (CounterY == (2)); 
				dis2x2 <= ((CounterX == 2) & 0) & (CounterY == (2)); 
				dis3x2 <= ((CounterX == 3) & 0) & (CounterY == (2)); 
				dis4x2 <= ((CounterX == 4) & 0) & (CounterY == (2)); 
				dis5x2 <= ((CounterX == 6) & 0) & (CounterY == (2)); 
				dis6x2 <= ((CounterX == 5) & 0) & (CounterY == (2)); 
				dis7x2 <= ((CounterX == 7) & 0) & (CounterY == (2)); 
	
					end	
			always @(posedge clk)
			begin
				dis0x3 <= ((CounterX == 0) & 1) & (CounterY == (3)); 
				dis1x3 <= ((CounterX == 1) & 1) & (CounterY == (3)); 
				dis2x3 <= ((CounterX == 2) & 0) & (CounterY == (3)); 
				dis3x3 <= ((CounterX == 3) & 0) & (CounterY == (3)); 
				dis4x3 <= ((CounterX == 4) & 0) & (CounterY == (3)); 
				dis5x3 <= ((CounterX == 6) & 0) & (CounterY == (3)); 
				dis6x3 <= ((CounterX == 5) & 0) & (CounterY == (3)); 
				dis7x3 <= ((CounterX == 7) & 0) & (CounterY == (3)); 
					end	
			always @(posedge clk)
			begin
				dis0x4 <= ((CounterX == 0) & 1) & (CounterY == (4)); 
				dis1x4 <= ((CounterX == 1) & 1) & (CounterY == (4)); 
				dis2x4 <= ((CounterX == 2) & 0) & (CounterY == (4)); 
				dis3x4 <= ((CounterX == 3) & 0) & (CounterY == (4)); 
				dis4x4 <= ((CounterX == 4) & 0) & (CounterY == (4)); 
				dis5x4 <= ((CounterX == 6) & 0) & (CounterY == (4)); 
				dis6x4 <= ((CounterX == 5) & 0) & (CounterY == (4)); 
				dis7x4 <= ((CounterX == 7) & 0) & (CounterY == (4)); 
					end	
			always @(posedge clk)
			begin
				dis0x5 <= ((CounterX == 0) & 1) & (CounterY == (5)); 
				dis1x5 <= ((CounterX == 1) & 1) & (CounterY == (5)); 
				dis2x5 <= ((CounterX == 2) & 0) & (CounterY == (5)); 
				dis3x5 <= ((CounterX == 3) & 0) & (CounterY == (5)); 
				dis4x5 <= ((CounterX == 4) & 0) & (CounterY == (5)); 
				dis5x5 <= ((CounterX == 6) & 0) & (CounterY == (5)); 
				dis6x5 <= ((CounterX == 5) & 0) & (CounterY == (5)); 
				dis7x5 <= ((CounterX == 7) & 0) & (CounterY == (5)); 
					end	
			always @(posedge clk)
			begin
				dis0x6 <= ((CounterX == 0) & 1) & (CounterY == (6)); 
				dis1x6 <= ((CounterX == 1) & 1) & (CounterY == (6)); 
				dis2x6 <= ((CounterX == 2) & 0) & (CounterY == (6)); 
				dis3x6 <= ((CounterX == 3) & 0) & (CounterY == (6)); 
				dis4x6 <= ((CounterX == 4) & 0) & (CounterY == (6)); 
				dis5x6 <= ((CounterX == 6) & 0) & (CounterY == (6)); 
				dis6x6 <= ((CounterX == 5) & 0) & (CounterY == (6)); 
				dis7x6 <= ((CounterX == 7) & 0) & (CounterY == (6)); 
					end	
			always @(posedge clk)
			begin
				dis0x7 <= ((CounterX == 0) & 1) & (CounterY == (7)); 
				dis1x7 <= ((CounterX == 1) & 1) & (CounterY == (7)); 
				dis2x7 <= ((CounterX == 2) & 0) & (CounterY == (7)); 
				dis3x7 <= ((CounterX == 3) & 0) & (CounterY == (7)); 
				dis4x7 <= ((CounterX == 4) & 0) & (CounterY == (7)); 
				dis5x7 <= ((CounterX == 6) & 0) & (CounterY == (7)); 
				dis6x7 <= ((CounterX == 5) & 0) & (CounterY == (7)); 
				dis7x7 <= ((CounterX == 7) & 0) & (CounterY == (7)); 
					end	
			always @(posedge clk)
			begin
				dis0x8 <= ((CounterX == 0) & 1) & (CounterY == (8)); 
				dis1x8 <= ((CounterX == 1) & 1) & (CounterY == (8)); 
				dis2x8 <= ((CounterX == 2) & 0) & (CounterY == (8)); 
				dis3x8 <= ((CounterX == 3) & 0) & (CounterY == (8)); 
				dis4x8 <= ((CounterX == 4) & 0) & (CounterY == (8)); 
				dis5x8 <= ((CounterX == 6) & 0) & (CounterY == (8)); 
				dis6x8 <= ((CounterX == 5) & 0) & (CounterY == (8)); 
				dis7x8 <= ((CounterX == 7) & 0) & (CounterY == (8)); 
					end	
			always @(posedge clk)
			begin
				dis0x9 <= ((CounterX == 0) & 1) & (CounterY == (9)); 
				dis1x9 <= ((CounterX == 1) & 1) & (CounterY == (9)); 
				dis2x9 <= ((CounterX == 2) & 0) & (CounterY == (9)); 
				dis3x9 <= ((CounterX == 3) & 0) & (CounterY == (9)); 
				dis4x9 <= ((CounterX == 4) & 0) & (CounterY == (9)); 
				dis5x9 <= ((CounterX == 6) & 0) & (CounterY == (9)); 
				dis6x9 <= ((CounterX == 5) & 0) & (CounterY == (9)); 
				dis7x9 <= ((CounterX == 7) & 0) & (CounterY == (9)); 
					end	
			always @(posedge clk)
			begin
				dis0x10 <= ((CounterX == 0) & 1) & (CounterY == (10)); 
				dis1x10 <= ((CounterX == 1) & 1) & (CounterY == (10)); 
				dis2x10 <= ((CounterX == 2) & 0) & (CounterY == (10)); 
				dis3x10 <= ((CounterX == 3) & 0) & (CounterY == (10)); 
				dis4x10 <= ((CounterX == 4) & 0) & (CounterY == (10)); 
				dis5x10 <= ((CounterX == 6) & 0) & (CounterY == (10)); 
				dis6x10 <= ((CounterX == 5) & 0) & (CounterY == (10)); 
				dis7x10 <= ((CounterX == 7) & 0) & (CounterY == (10)); 
					end	
			always @(posedge clk)
			begin
				dis0x11 <= ((CounterX == 0) & 1) & (CounterY == (11)); 
				dis1x11 <= ((CounterX == 1) & 1) & (CounterY == (11)); 
				dis2x11 <= ((CounterX == 2) & 0) & (CounterY == (11)); 
				dis3x11 <= ((CounterX == 3) & 0) & (CounterY == (11)); 
				dis4x11 <= ((CounterX == 4) & 0) & (CounterY == (11)); 
				dis5x11 <= ((CounterX == 6) & 0) & (CounterY == (11)); 
				dis6x11 <= ((CounterX == 5) & 0) & (CounterY == (11)); 
				dis7x11 <= ((CounterX == 7) & 0) & (CounterY == (11)); 
				end	
			always @(posedge clk)
			begin
				
				dis0x12 <= ((CounterX == 0) & 1) & (CounterY == (12)); 
				dis1x12 <= ((CounterX == 1) & 1) & (CounterY == (12)); 
				dis2x12 <= ((CounterX == 2) & 0) & (CounterY == (12)); 
				dis3x12 <= ((CounterX == 3) & 0) & (CounterY == (12)); 
				dis4x12 <= ((CounterX == 4) & 0) & (CounterY == (12)); 
				dis5x12 <= ((CounterX == 6) & 0) & (CounterY == (12)); 
				dis6x12 <= ((CounterX == 5) & 0) & (CounterY == (12)); 
				dis7x12 <= ((CounterX == 7) & 0) & (CounterY == (12)); 
					end	
			always @(posedge clk)
			begin
				dis0x13 <= ((CounterX == 0) & 1) & (CounterY == (13)); 
				dis1x13 <= ((CounterX == 1) & 1) & (CounterY == (13)); 
				dis2x13 <= ((CounterX == 2) & 0) & (CounterY == (13)); 
				dis3x13 <= ((CounterX == 3) & 0) & (CounterY == (13)); 
				dis4x13 <= ((CounterX == 4) & 0) & (CounterY == (13)); 
				dis5x13 <= ((CounterX == 6) & 0) & (CounterY == (13)); 
				dis6x13 <= ((CounterX == 5) & 0) & (CounterY == (13)); 
				dis7x13 <= ((CounterX == 7) & 0) & (CounterY == (13)); 
					end	
			always @(posedge clk)
			begin
				dis0x14 <= ((CounterX == 0) & 1) & (CounterY == (14)); 
				dis1x14 <= ((CounterX == 1) & 1) & (CounterY == (14)); 
				dis2x14 <= ((CounterX == 2) & 1) & (CounterY == (14)); 
				dis3x14 <= ((CounterX == 3) & 1) & (CounterY == (14)); 
				dis4x14 <= ((CounterX == 4) & 1) & (CounterY == (14)); 
				dis5x14 <= ((CounterX == 6) & 1) & (CounterY == (14)); 
				dis6x14 <= ((CounterX == 5) & 1) & (CounterY == (14)); 
				dis7x14 <= ((CounterX == 7) & 1) & (CounterY == (14)); 
					end	
			always @(posedge clk)
			begin
				dis0x15 <= ((CounterX == 0) & 1) & (CounterY == (15)); 
				dis1x15 <= ((CounterX == 1) & 1) & (CounterY == (15)); 
				dis2x15 <= ((CounterX == 2) & 1) & (CounterY == (15)); 
				dis3x15 <= ((CounterX == 3) & 1) & (CounterY == (15)); 
				dis4x15 <= ((CounterX == 4) & 1) & (CounterY == (15)); 
				dis5x15 <= ((CounterX == 6) & 1) & (CounterY == (15)); 
				dis6x15 <= ((CounterX == 5) & 1) & (CounterY == (15)); 
				dis7x15 <= ((CounterX == 7) & 1) & (CounterY == (15)); 
			end
			
			
			
		always @(posedge clk)
			begin
				disall0 <=(dis0x0 | dis1x0 | dis2x0 | dis3x0 | dis4x0 | dis5x0 | dis6x0 | dis7x0 );
				disall1 <=(dis0x1 | dis1x1 | dis2x1 | dis3x1 | dis4x1 | dis5x1 | dis6x1 | dis7x1 );
				disall2 <=(dis0x2 | dis1x2 | dis2x2 | dis3x2 | dis4x2 | dis5x2 | dis6x2 | dis7x2 );
				disall3 <=(dis0x3 | dis1x3 | dis2x3 | dis3x3 | dis4x3 | dis5x3 | dis6x3 | dis7x3 );
				disall4 <=(dis0x4 | dis1x4 | dis2x4 | dis3x4 | dis4x4 | dis5x4 | dis6x4 | dis7x4 );
				disall5 <=(dis0x5 | dis1x5 | dis2x5 | dis3x5 | dis4x5 | dis5x5 | dis6x5 | dis7x5 );
				disall6 <=(dis0x6 | dis1x6 | dis2x6 | dis3x6 | dis4x6 | dis5x6 | dis6x6 | dis7x6 );
				disall7 <=(dis0x7 | dis1x7 | dis2x7 | dis3x7 | dis4x7 | dis5x7 | dis6x7 | dis7x7 );
				disall8 <=(dis0x8 | dis1x8 | dis2x8 | dis3x8 | dis4x8 | dis5x8 | dis6x8 | dis7x8 );
				disall9 <=(dis0x9 | dis1x9 | dis2x9 | dis3x9 | dis4x9 | dis5x9 | dis6x9 | dis7x9 );
				disall10 <=(dis0x10 | dis1x10 | dis2x10 | dis3x10 | dis4x10 | dis5x10 | dis6x10 | dis7x10 );
				disall11 <=(dis0x11 | dis1x11 | dis2x11 | dis3x11 | dis4x11 | dis5x11 | dis6x11 | dis7x11 );
				disall12 <=(dis0x12 | dis1x12 | dis2x12 | dis3x12 | dis4x12 | dis5x12 | dis6x12 | dis7x12 );
				disall13 <=(dis0x13 | dis1x13 | dis2x13 | dis3x13 | dis4x13 | dis5x13 | dis6x13 | dis7x13 );
				disall14 <=(dis0x14 | dis1x14 | dis2x14 | dis3x14 | dis4x14 | dis5x14 | dis6x14 | dis7x14 );
				disall15 <=(dis0x15 | dis1x15 | dis2x15 | dis3x15 | dis4x15 | dis5x15 | dis6x15 | dis7x15 );
				
				inDisplayArea <= inDisplaySelect & disall0 & disall1 & disall2 & disall3 & disall4 & disall5 & disall6 & disall7 & disall8 & disall9 & disall10 & disall11 & disall12 & disall13 & disall14 & disall15;
			end
		
	

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
