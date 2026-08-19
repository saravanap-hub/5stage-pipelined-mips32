
module ex_mem_reg (
    input  wire        clk,
    input  wire        reset,
    input  wire        flush,
 
    input  wire [31:0] ex_ir,
    input  wire [31:0] ex_alu_out,
    input  wire [31:0] ex_b,
    input  wire [4:0]  ex_write_reg,
    input  wire        ex_zero,
    input  wire [31:0] ex_branch_target,
 
    input  wire        ex_reg_write,
    input  wire        ex_mem_read,
    input  wire        ex_mem_write,
    input  wire        ex_mem_to_reg,
    input  wire        ex_branch,
    input  wire        ex_branch_type,
 
    output reg  [31:0] EX_MEM_IR,
    output reg  [31:0] EX_MEM_ALUOut,
    output reg  [31:0] EX_MEM_B,
    output reg  [4:0]  EX_MEM_WriteReg,
    output reg          EX_MEM_Zero,
    output reg  [31:0] EX_MEM_BranchTarget,
 
    output reg          EX_MEM_RegWrite,
    output reg          EX_MEM_MemRead,
    output reg          EX_MEM_MemWrite,
    output reg          EX_MEM_MemtoReg,
    output reg          EX_MEM_Branch,
    output reg          EX_MEM_BranchType
);

    always @(posedge clk) begin
        if (reset || flush) begin
            EX_MEM_IR           <= 32'b0;
            EX_MEM_ALUOut        <= 32'b0;
            EX_MEM_B             <= 32'b0;
            EX_MEM_WriteReg      <= 5'b0;
            EX_MEM_Zero          <= 1'b0;
            EX_MEM_BranchTarget  <= 32'b0;
            EX_MEM_RegWrite      <= 1'b0;
            EX_MEM_MemRead       <= 1'b0;
            EX_MEM_MemWrite      <= 1'b0;
            EX_MEM_MemtoReg      <= 1'b0;
            EX_MEM_Branch        <= 1'b0;
            EX_MEM_BranchType    <= 1'b0;
        end 
        else begin
            EX_MEM_IR           <= ex_ir;
            EX_MEM_ALUOut        <= ex_alu_out;
            EX_MEM_B             <= ex_b;
            EX_MEM_WriteReg      <= ex_write_reg;
            EX_MEM_Zero          <= ex_zero;
            EX_MEM_BranchTarget  <= ex_branch_target;
            EX_MEM_RegWrite      <= ex_reg_write;
            EX_MEM_MemRead       <= ex_mem_read;
            EX_MEM_MemWrite      <= ex_mem_write;
            EX_MEM_MemtoReg      <= ex_mem_to_reg;
            EX_MEM_Branch        <= ex_branch;
            EX_MEM_BranchType    <= ex_branch_type;
        end
    end
endmodule