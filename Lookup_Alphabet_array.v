module Lookup_Alphabet_array(s,a,result0,result1,result2,result3,result4,result5,result6,result7,result8,result9,result10,result11,result12,result13,result14,result15);
	input s ;
	input a ;
	output reg [7:0]result0;
   output reg [7:0]result1;
	output reg [7:0]result2;
   output reg [7:0]result3;
	output reg [7:0]result4;
   output reg [7:0]result5;
	output reg [7:0]result6;
   output reg [7:0]result7;
	output reg [7:0]result8;
   output reg [7:0]result9;
	output reg [7:0]result10;
   output reg [7:0]result11;
	output reg [7:0]result12;
   output reg [7:0]result13;
	output reg [7:0]result14;
   output reg [7:0]result15;

    always @(posedge s) begin
		if(a == 0)//0
			begin
				result0 <= 0; 
				result1 <= 0; 
				result2 <= 0; 
				result3 <= 0; 
				result4 <= 0; 
				result5 <= 0; 
				result6 <= 0; 
				result7 <= 0; 
				result8 <= 0; 
				result9 <= 0; 
				result10 <= 0; 
				result11 <= 0; 
				result12 <= 0; 
				result13 <= 0; 
				result14 <= 0; 
				result15 <= 0; 
          end
		end
		
		
		
		
		
endmodule
