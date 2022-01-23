module testVGA(
    input clk_50,
	 input sw_r,
	 input sw_g,
	 input sw_b,
	 input sw_p1,
	 input sw_p2,
	 input sw_p3,
	 input sw_p4,
	 input sw_p5,
	 input sw_p6,
	 input sw_p7,
	 input sw_p8,
	 input sw_cc,
	 input sw_cp,
	 
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
	 reg clk;
    wire [9:0] CounX;
	 wire [9:0] CounY;
  //set colour
		wire red = ~sw_r;
		wire green = ~sw_g;
		wire blue = ~sw_b;
		wire [3:0] posDisplay;
		reg [3:0]countPosition = 0;
		
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
		.sw_p4(~sw_p4),
		.sw_p5(~sw_p5),
		.sw_p6(~sw_p6),
		.sw_p7(~sw_p7),
		.sw_p8(~sw_p8),
		.sw_cp(sw_cp),
		.sw_cc(sw_cc),
      .vga_h_sync(hsync_out),
      .vga_v_sync(vsync_out),
      .CounterX(CounX),
      .CounterY(CounY),
      .inDisplayArea(inDisplayArea),
		.inDisplaySelect(inDisplaySelect),
		.countPos(posDisplay),
    );
	 
	  always @(posedge clk)
		begin
			pixel[0] <= inDisplayArea ;
			pixel[1] <= inDisplayArea ;
			pixel[2] <= inDisplayArea ;	
		end
		

endmodule
