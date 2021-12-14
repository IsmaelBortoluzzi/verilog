`include "contador.v"

module testbench;

    reg rst;
    reg clk;
    reg w;

    wire y0;
    wire y1;
    wire y2;

    contador cnt(rst, clk, w, y0, y1, y2);

    always #6 clk <= ~clk;
    always #6 w <= ~w;

    initial begin

        $dumpvars;

            clk <= 1'b0;
            rst <= 1'b1;
            w <= 1'b1;
            #1
            rst <= 1'b0;
            
            #99

        $finish;
    
    end

endmodule
