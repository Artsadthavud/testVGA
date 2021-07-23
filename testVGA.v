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
    wire [9:0] CounterX;
	 wire [9:0] CounterY;
  //set colour
		wire red = ~sw_r;
		wire green = ~sw_g;
		wire blue = ~sw_b;
		wire [3:0] posDisplay;
		reg [3:0]countPosition = 0;
		
		reg memR [8:0];
		reg memG [8:0];
		reg memB [8:0];
		
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
      .CounterX(CounterX),
      .CounterY(CounterY),
      .inDisplayArea(inDisplayArea),
		.inDisplaySelect(inDisplaySelect),
		.countPos(posDisplay),
    );
 

always @(posedge clk)
    begin
		if(inDisplaySelect)	
			begin
				inDisplay0 <= (CounterX < 160) && (CounterY < 240);
				inDisplay1 <= (CounterX > 159) && (CounterX < 320) && (CounterY < 240);
				inDisplay2 <= (CounterX > 319) && (CounterX < 480) && (CounterY < 240);
				inDisplay3 <= (CounterX > 479) && (CounterX < 640) && (CounterY < 240);
				inDisplay4 <= (CounterX > 479) && (CounterX < 640) && (CounterY < 480) && (CounterY > 239) ;
				inDisplay5 <= (CounterX > 319) && (CounterX < 480) && (CounterY < 480)  && (CounterY > 239);
				inDisplay6 <= (CounterX > 159) && (CounterX < 320) && (CounterY < 480)  && (CounterY > 239);
				inDisplay7 <= (CounterX < 160) && (CounterY < 480)  && (CounterY > 239);
			end
		end
	  //0
	 always @(posedge clk)
		if(inDisplayArea)
			begin
				memR [posDisplay+1] = red;
				memG [posDisplay+1] = green;
				memB [posDisplay+1] = blue;
			end
		
		
	
	  wire area0R = (inDisplay0 & memR[1]);
	  wire area0G = (inDisplay0 & memG[1]);
	  wire area0B = (inDisplay0 & memB[1]);
	 
	  wire area1R = (inDisplay1 & memR[2]);
	  wire area1G = (inDisplay1 & memG[2]);
	  wire area1B = (inDisplay1 & memB[2]);
		
	  wire area2R = (inDisplay2 & memR[3]);
	  wire area2G = (inDisplay2 & memG[3]);
	  wire area2B = (inDisplay2 & memB[3]);

	  wire area3R = (inDisplay3 & memR[4]);
	  wire area3G = (inDisplay3 & memG[4]);
	  wire area3B = (inDisplay3 & memB[4]);
	  
	  wire area4R = (inDisplay4 & memR[5]);
	  wire area4G = (inDisplay4 & memG[5]);
	  wire area4B = (inDisplay4 & memB[5]);
	 
	  wire area5R = (inDisplay5 & memR[6]);
	  wire area5G = (inDisplay5 & memG[6]);
	  wire area5B = (inDisplay5 & memB[6]);
	  
	  wire area6R = (inDisplay6 & memR[7]);
	  wire area6G = (inDisplay6 & memG[7]);
	  wire area6B = (inDisplay6 & memB[7]);
	  
	  wire area7R = (inDisplay7 & memR[8]);
	  wire area7G = (inDisplay7 & memG[8]);
	  wire area7B = (inDisplay7 & memB[8]);
	
	
//		counter countDisplaySelect(.clk(clk), .out(displayBlink));
		
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
								R <= red;
								G <= green;
								B <= blue;
							end
						if (cnt > Blank)
							begin
								R <= 1;
								G <= 1;
								B <= 1;
							end
					
					end
			end  

	wire selectAreaR = R & inDisplayArea;
	wire selectAreaG = G & inDisplayArea;
	wire selectAreaB = B & inDisplayArea;
	
	 wire otherDisplayR = ( area0R | area1R | area2R | area3R | area4R | area5R | area6R | area7R) ^ selectAreaR ; 
	 wire otherDisplayG = ( area0G | area1G | area2G | area3G | area4G | area5G | area6G | area7G) ^ selectAreaG; 
	 wire otherDisplayB = ( area0B | area1B | area2B | area3B | area4B | area5B | area6B | area7B) ^ selectAreaB ;
	 

	 
	  always @(posedge clk)
		begin
			pixel[0] <= otherDisplayG | selectAreaG;
			pixel[1] <= otherDisplayB | selectAreaB;
			pixel[2] <= otherDisplayR | selectAreaR;	
		end
		

endmodule
	 