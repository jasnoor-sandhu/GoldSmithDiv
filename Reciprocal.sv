module reciprocal(
    input [31:0] a,
    output reg [31:0] out
);

always_comb begin : Reciprocal
    casez (a)
        32'b000000001_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 1;
        32'b00000001z_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 3;
        32'b0000001zz_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 5;
        32'b000001zzz_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 7;
        32'b00001zzzz_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 9;
        32'b0001zzzzz_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 11;
        32'b001zzzzzz_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 13;
        32'b01zzzzzzz_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 15;
        32'b1zzzzzzzz_zzzzzzzzzzzzzzzzzzzzzzz : out = a >> 17;
        default: out = a;
    endcase
end

endmodule