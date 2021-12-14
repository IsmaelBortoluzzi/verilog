module contador (
    input rst,
    input clk,
    input w,
    output y0,
    output y1,
    output y2
);

    reg[2:0] A;
    wire Y0; 
    wire Y1;
    wire Y2;

    assign y0 = A[0];
    assign y1 = A[1];
    assign y2 = A[2];

    assign Y0 <= (!w && A[0]) || (!w && !A[0]);
    assign Y1 <= (!w && A[1]) || (A[1] && !A[0]) || (!w && A[0] && !A[1]);
    assign Y2 <= (!w && A[2]) || (A[2] && !A[0] && A[2]) || (w && A[0] && A[1] && !A[2]) || (!y1 && y2);

    always @(posedge clk or rst) begin
        
        if (rst == 1) begin
            A[0] <= 1'b0;
            A[1] <= 1'b0;
            A[2] <= 1'b0;
        end
        else begin 
            A[0] <= Y0;
            A[1] <= Y1;
            A[2] <= Y2;
        end
    end
endmodule