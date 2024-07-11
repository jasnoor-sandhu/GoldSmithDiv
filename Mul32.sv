module mul32_32(
    input [31:0] a,
    input [31:0] b,
    output [31:0] out
);

wire [63:0] c;
assign c = a * b;
assign out = c[54:23] ;

endmodule