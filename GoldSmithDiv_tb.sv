module tb();

reg reset,start,clk;
reg [31:0] dividend,divisor,out;

goldSmithDiv dut(
    .clk(clk),
    .reset(reset),
    .start(start),
    .dividend(dividend),
    .divisor(divisor),
    .out(out)
);

initial begin
    $monitor("time:%t, reset: %b, start:%b\n\t dividend: %b_%b, divisor: %b_%b, output: %b_%b",$time,reset, start,dividend[31:23],dividend[22:0], divisor[31:23],divisor[22:0], out[31:23],out[22:0]);
end

initial begin
    dividend = 32'b000100000_11100101101010000110000;
    divisor =  32'b000000101_00110000011011110111000;
    clk = 0;
    reset = 1;
    start = 0;
end

initial begin
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
  $dumpfile("dump.vcd"); $dumpvars;
    #102 $finish;
end

initial begin
    #10 reset = 0;
    start = 1;
    #10 start = 0;
end
  

endmodule