module goldSmithDiv(
    input clk,
    input reset,
    input start,
    input stop,
    input [31:0] dividend, //9interger bits, 23decimal bits
    input [31:0] divisor, //9interger bits, 23decimal bits
    //input accuracy -> to be added
    output [31:0] out
);

reg flag_on;
reg [31:0] F1,N1,D1;
wire [31:0] WF0,WN1,WD1,WF1;

reciprocal rcpl(divisor, WF0);
mul32_32 calcN2(N1,F1,WN1);
mul32_32 calcD2(D1,F1,WD1);
sub_from_2 subtractor(WD1,WF1); 

assign out = WN1;

always@ (posedge clk) begin
    if (reset != 1) begin
    
    if (stop == 1) begin
        flag_on = 0;
    end

    if (start == 1) begin
        N1 <= dividend;
        D1 <= divisor;
        F1 <= WF0;
        flag_on <= 1;
    end

    else if (flag_on) begin
        N1 <= WN1;
        D1 <= WD1;
        F1 <= WF1;
    end
    
    end
    if (reset == 1) begin
        N1 <= 0;
        D1 <= 0;
        F1 <= 0;
        flag_on <= 0;
    end

end
endmodule