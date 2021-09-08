module Lookup_Alphabet_array0(s,a,r0,r1,r2,r3,r4,r5,r6,r7);
	input s ;
	input a ;
  output reg r0 ;
  output reg r1 ;
  output reg r2 ;
  output reg r3 ;
  output reg r4 ;
  output reg r5 ;
  output reg r6 ;
  output reg r7 ;

    always @(posedge s) begin
		if(a == 0)//0
			begin
            r0 = 0; 
            r1 = 0; 
				r2 = 0; 
            r3 = 0; 
				r4 = 0; 
            r5 = 0; 
				r6 = 0; 
            r7 = 0; 
          end
		end
endmodule
