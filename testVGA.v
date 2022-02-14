module testVGA(
    input clk_50,
	 input sw_cc,
    output reg [2:0] pixel,
    output hsync_out,
    output vsync_out
);	
    wire inDisplayArea;
	 wire inDisplaySelect;
	 reg clk;
    wire [9:0] CounX;
	 wire [9:0] CounY;
  //set colour
		
	 always @(posedge clk_50)
		begin
			clk <= ~clk;	
		end
	 
    hvsync_generator hvsync(
      .clk(clk),
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
