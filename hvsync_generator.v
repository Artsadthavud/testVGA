module hvsync_generator(
    input clk,
	 input sw_cc,
    output vga_h_sync,
    output vga_v_sync,
    output reg inDisplayArea,
	 output reg inDisplaySelect,
	 output reg [3:0] countPos,
    output reg [9:0] CounterX,
    output reg [9:0] CounterY
  );
    reg vga_HS, vga_VS;
	 
	 reg [2:0]sw_mode;

	 
	 wire r0;wire r1;wire r2;wire r3;wire r4;wire r5;wire r6;wire r7;wire r8;wire r9;wire r10;		
	
		
	
    wire CounterXmaxed = (CounterX == 800); // 16 + 48 + 96 + 640
    wire CounterYmaxed = (CounterY == 525); // 10 + 2 + 33 + 480
	
	 wire c_finish;
	 wire [7:0]dataset;
	 
	 rx rxmodule(.i_Clock(clk),.i_Rx_Serial(sw_cc),.o_Rx_DV(c_finish),.o_Rx_Byte(dataset));
	 
	 wire [7:0] LTA [15:0];	
	
		wire [7:0]check;
		
	 Lookup_Alphabet LUT_A( .a(dataset), .r0(LTA[0]), .r1(LTA[1]), .r2(LTA[2]), .r3(LTA[3]), .r4(LTA[4]), .r5(LTA[5]), .r6(LTA[6]), .r7(LTA[7]), .r8(LTA[8]), .r9(LTA[9]), .r10(LTA[10]), .r11(LTA[11]), .r12(LTA[12]), .r13(LTA[13]), .r14(LTA[14]), .r15(LTA[15]),.check(check));
	 
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
	
		reg [8:0] framebuffer [80][30];
		always @(posedge check)
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
			
	reg [9:0] curx = 0;
	reg [8:0] cury = 0;
	
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
	reg mem[15:0][7:0];		
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
		always @(posedge clk)
			begin
				dis0x0 <= (((CounterX < 8) & mem[0][7-CounterX]) & (CounterY == (0))); 
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
			reg disall0 ;
		always @(posedge clk)
			begin
				disall0 <=(dis0x0 | dis1x0 | dis2x0 | dis3x0 | dis4x0 | dis5x0 | dis6x0 | dis7x0 | dis8x0 | dis9x0 | dis10x0 | dis11x0 | dis12x0 | dis13x0 | dis14x0 | dis15x0);

				
				inDisplayArea <= inDisplaySelect & disall0 ;
			end
		
	

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
