module Lookup_Alphabet(a, r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15);
    input [7:0] a;
    output reg [7:0] r0;
	 output reg [7:0] r1;
	 output reg [7:0] r2;
	 output reg [7:0] r3;
	 output reg [7:0] r4;
	 output reg [7:0] r5;
	 output reg [7:0] r6;
	 output reg [7:0] r7;
	 output reg [7:0] r8;
	 output reg [7:0] r9;
	 output reg [7:0] r10;
	 output reg [7:0] r11;
	 output reg [7:0] r12;
	 output reg [7:0] r13;
	 output reg [7:0] r14;
	 output reg [7:0] r15;

    always @(a) begin
        if (a == 01000001)
				begin
				////////////////////////////////////////////////A
            r0 <= 8'b00000000; //A
            r1 <= 8'b00000000; //A
            r2 <= 8'b00001000; //A 
            r3 <= 8'b00010100; //A 
            r4 <= 8'b00100010; //A 
            r5 <= 8'b00100010; //A 
				r6 <= 8'b00100010; //A
            r7 <= 8'b00111110; //A 
            r8 <= 8'b00100010; //A 
            r9 <= 8'b00100010; //A 
            r10 <= 8'b00100010; //A 
            r11 <= 8'b00100010; //A 
				r12 <= 8'b00100010; //A 
            r13 <= 8'b00000000; //A
				r14 <= 8'b00000000; //A 
            r15 <= 8'b00000000; //A
				end
			else if (a == 01000010)
				begin
				/////////////////////////////////////////////////B
            r0 <= 8'b00000000; 
            r1 <= 8'b00000000; 
            r2 <= 8'b00111000; 
            r3 <= 8'b00100100; 
            r4 <= 8'b00100010; 
            r5 <= 8'b00100010; 
				r6 <= 8'b00111100; 
            r7 <= 8'b00100010; 
            r8 <= 8'b00100010; 
            r9 <= 8'b00100010; 
            r10 <= 8'b00100010; 
            r11 <= 8'b00100100; 
				r12 <= 8'b00111000; 
            r13 <= 8'b00000000; 
				r14 <= 8'b00000000; 
            r15 <= 8'b00000000; 
				end
    end
endmodule
