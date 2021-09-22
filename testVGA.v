module testVGA(
    input clk_50,
	 input sw_r,
	 input sw_g,
	 input sw_b,
	 input sw_p1,
	 input sw_p2,
	 input sw_p3,
	 input sw_cc,
	 input sw_cp,
	 output reg clk,
    output reg [2:0] pixel,
    output hsync_out,
    output vsync_out
);	
    wire inDisplayArea;
	 wire inDisplaySelect;
	 reg inDisplay0;
	 reg inDisplay1;
	 reg inDisplay2;
	 reg inDisplay3;
	 reg inDisplay4;
	 reg inDisplay5;
	 reg inDisplay6;
	 reg inDisplay7;
    wire [9:0] CounX;
	 wire [9:0] CounY;
  //set colour
		wire red = ~sw_r;
		wire green = ~sw_g;
		wire blue = ~sw_b;
		wire [3:0] posDisplay;
		reg [3:0]countPosition = 0;
		
		reg memR [8:0];
		reg memG [8:0];
		reg memB [8:0];
		
		wire redalpha;
		wire greenalpha;
		wire bluealpha;
		
		wire c_red = ~sw_p1;
		wire c_blue = ~sw_p2;
		wire c_green = ~sw_p3;
		
	 always @(posedge clk_50)
		begin
			clk <= ~clk;	
		end
	 
    hvsync_generator hvsync(
      .clk(clk),
		.sw_p1(~sw_p1),
		.sw_p2(~sw_p2),
		.sw_p3(~sw_p3),
		.sw_cp(sw_cp),
		.sw_cc(sw_cc),
      .vga_h_sync(hsync_out),
      .vga_v_sync(vsync_out),
      .green(greenalpha),
      .blue(bluealpha),
      .inDisplayArea(inDisplayArea),
		.inDisplaySelect(inDisplaySelect),
		.red(redalpha),
    );
	/* 	
	// blink	
		reg [24:0] cnt;    
		reg [24:0] Blank = 4000000;
		reg [24:0] reset = 8000000;
		reg R = 0, G = 0, B = 0;
	
		always @ (posedge clk) 
			begin  
				if (cnt == reset)  
					begin
						cnt <= 0;  
					end
				else
					begin
						cnt <= cnt + 1; 
						if (cnt < Blank)  
							begin
								R <= 0;
								G <= 0;
								B <= 0;
							end
						if (cnt > Blank)
							begin
								R <= 1;
								G <= 1;
								B <= 1;
							end
					
					end
			end  
	*/
	/*
	// alpha set
	reg [9:0] X;
	reg [9:0] Y;
	reg dis0;
	reg dis1;
	reg dis2;
	reg dis3;
	reg dis4;
	reg dis5;
	reg dis6;
	reg dis7;
	reg dis8;
	reg dis9;
	reg dis10;
	
	always @(posedge clk)
    if ( X==640 )
      X <= 0;
    else
      X <= X + 1;
		
	 always @(posedge clk)
    begin
      if (X == 640)
      begin
        if(Y == 480)
          Y <= 0;
        else
          Y <= Y + 1;
      end
    end
	
		always @(posedge clk)
			begin
				dis0 <= ((X = 0) & 0) & (Y =0); 
				dis1 <= ((X = 1) & 0) & (Y =0); 
				dis2 <= ((X = 2) & 1) & (Y =0); 
				dis3 <= ((X = 3) & 0 ) & (Y =0); 
				dis4 <= ((X = 4) & 0 ) & (Y =0); 
				dis5 <= ((X = 5) & 0 ) & (Y =0); 
				dis6 <= ((X = 6) & 0 ) & (Y =0); 
				dis7 <= ((X = 7) & 0 ) & (Y =0); 
				dis8 <= ((X = 8) & 0 ) & (Y =0); 
				dis9 <= ((X = 9) & 1 ) & (Y =0); 
				dis10 <= ((X = 10) & 0 ) & (Y =0); 
			end
		//& dis0& dis1& dis2& dis3& dis4& dis5& dis6& dis7& dis8& dis9& dis10
	 */
	  always @(posedge clk)
		begin
			pixel[0] <= inDisplayArea & redalpha ;
			pixel[1] <= inDisplayArea & greenalpha;
			pixel[2] <= inDisplayArea & bluealpha ;	
		end
		

endmodule
