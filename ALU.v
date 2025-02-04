module alu(
    input  [7:0] a,
    input  [7:0] b,
    input [2:0] opcode,
    output [15:0] OUT,
    output COUT
    );
    reg [7:0]t1,t2;
    reg [15:0]out;
    reg cout, y1, y2; 
    always@(*)
    begin
    case (opcode)
    3'b000 : {cout,out[15:0]}= a+b;
    3'b001 : {cout,out[15:0]}= a-b;
    3'b010 : {cout,out[15:0]}= a*b;
    3'b011 : begin t1 = a>>1 ; t2 = b>>1 ; out[15:0] = {t2[7:0],t1[7:0]}; end
    3'b100 : begin t1 = a<<1 ; t2 = b<<1 ; out[15:0] = {t2[7:0],t1[7:0]}; end
    3'b101 : begin y1 = &a; y2 = &b; cout = y1 & y2; out[15:0] = 16'b0000000000000000; end
    3'b110 : begin y1= |a; y2 = |b; cout = y1 | y2;  out[15:0] = 16'b0000000000000000; end
    3'b111 : begin y1 = ^a; y2 = ^b; cout = y1 ^ y2; out[15:0] = 16'b0000000000000000;end
    endcase
    end
    assign OUT[15:0] = out[15:0];
    assign COUT = cout;

endmodule