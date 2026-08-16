module alu_control (
    input  wire [2:0] alu_op,
    input  wire [5:0] funct,
    output reg  [3:0] alu_ctrl
);

    parameter ALUOP_ADD    = 3'b000, // addi, lw, sw
              ALUOP_SUB    = 3'b001, // beq, bne (compare)
              ALUOP_RTYPE  = 3'b010, // add/sub/and/or/slt - decode funct
              ALUOP_AND    = 3'b011, // andi
              ALUOP_OR     = 3'b100, // ori
              ALUOP_SLT    = 3'b101; // slti
 
    parameter FUNCT_ADD = 6'b100000,
              FUNCT_SUB = 6'b100010,
              FUNCT_AND = 6'b100100,
              FUNCT_OR  = 6'b100101,
              FUNCT_SLT = 6'b101010;
 

 
    always @(*) begin
        case (alu_op)
            ALUOP_ADD: alu_ctrl = 4'b0010;
            ALUOP_SUB: alu_ctrl = 4'b0110;
            ALUOP_AND: alu_ctrl = 4'b0000;
            ALUOP_OR : alu_ctrl = 4'b0001;
            ALUOP_SLT: alu_ctrl = 4'b0111;
            ALUOP_RTYPE: begin
                case (funct)
                    FUNCT_ADD: alu_ctrl = 4'b0010;
                    FUNCT_SUB: alu_ctrl = 4'b0110;
                    FUNCT_AND: alu_ctrl = 4'b0000;
                    FUNCT_OR : alu_ctrl = 4'b0001;
                    FUNCT_SLT: alu_ctrl = 4'b0111;
                    default  : alu_ctrl = 4'bxxxx;
                endcase
            end
            default: alu_ctrl = 4'bxxxx;
        endcase
    end
endmodule