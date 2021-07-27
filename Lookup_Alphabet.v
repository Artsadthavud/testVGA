module Lookup_Alphabet(input [7:0] a, output reg [7:0] r0 );
  
    always @(a) begin
        case (a)
            8'b00000000: r0 = 8'b00000000; // 0 * 0 = 0
            8'b00000001: r0 = 8'b00000000; // 0 * 1 = 0
           
           // default: z <= 0;
        endcase
    end
endmodule
