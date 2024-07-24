module sub_from_2(
    input [31:0] in,
    output [31:0] out
);

assign out = 32'b000000010_00000000000000000000000 - in;

endmodule