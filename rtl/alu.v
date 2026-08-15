module alu (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_ctrl,
    output reg  [31:0] result,
    output wire        zero
);

    parameter ALU_AND = 4'b0000,
              ALU_OR  = 4'b0001,
              ALU_ADD = 4'b0010,
              ALU_SUB = 4'b0110,
              ALU_SLT = 4'b0111;
 
    always @(*) begin
        case (alu_ctrl)
            ALU_AND: result = a & b;
            ALU_OR : result = a | b;
            ALU_ADD: result = a + b;
            ALU_SUB: result = a - b;
            ALU_SLT: result = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
            default: result = 32'bx;
        endcase
    end
 
    assign zero = (result == 32'b0);
 
endmodule