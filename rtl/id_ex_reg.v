
module id_ex_reg (
    input  wire        clk,
    input  wire        reset,
    input  wire        flush,
 
    input  wire [31:0] id_ir,
    input  wire [31:0] id_npc,
    input  wire [31:0] id_a,
    input  wire [31:0] id_b,
    input  wire [31:0] id_imm,
    input  wire [4:0]  id_write_reg,
 
    input  wire        id_reg_write,
    input  wire        id_alu_src,
    input  wire        id_mem_read,
    input  wire        id_mem_write,
    input  wire        id_mem_to_reg,
    input  wire        id_branch,
    input  wire        id_branch_type,
    input  wire        id_link,
    input  wire [2:0]  id_alu_op,
    input  wire [5:0]  id_funct,
 
    output reg  [31:0] ID_EX_IR,
    output reg  [31:0] ID_EX_NPC,
    output reg  [31:0] ID_EX_A,
    output reg  [31:0] ID_EX_B,
    output reg  [31:0] ID_EX_Imm,
    output reg  [4:0]  ID_EX_WriteReg,
 
    output reg         ID_EX_RegWrite,
    output reg         ID_EX_ALUSrc,
    output reg         ID_EX_MemRead,
    output reg         ID_EX_MemWrite,
    output reg         ID_EX_MemtoReg,
    output reg         ID_EX_Branch,
    output reg         ID_EX_BranchType,
    output reg         ID_EX_Link,
    output reg  [2:0]  ID_EX_ALUOp,
    output reg  [5:0]  ID_EX_Funct
);

 always @(posedge clk) begin
        if (reset || flush) begin
            ID_EX_IR         <= 32'b0;
            ID_EX_NPC        <= 32'b0;
            ID_EX_A          <= 32'b0;
            ID_EX_B          <= 32'b0;
            ID_EX_Imm        <= 32'b0;
            ID_EX_WriteReg   <= 5'b0;
            ID_EX_RegWrite   <= 1'b0;
            ID_EX_ALUSrc     <= 1'b0;
            ID_EX_MemRead    <= 1'b0;
            ID_EX_MemWrite   <= 1'b0;
            ID_EX_MemtoReg   <= 1'b0;
            ID_EX_Branch     <= 1'b0;
            ID_EX_BranchType <= 1'b0;
            ID_EX_Link       <= 1'b0;
            ID_EX_ALUOp      <= 3'b0;
            ID_EX_Funct      <= 6'b0;
        end 
        else begin
            ID_EX_IR         <= id_ir;
            ID_EX_NPC        <= id_npc;
            ID_EX_A          <= id_a;
            ID_EX_B          <= id_b;
            ID_EX_Imm        <= id_imm;
            ID_EX_WriteReg   <= id_write_reg;
            ID_EX_RegWrite   <= id_reg_write;
            ID_EX_ALUSrc     <= id_alu_src;
            ID_EX_MemRead    <= id_mem_read;
            ID_EX_MemWrite   <= id_mem_write;
            ID_EX_MemtoReg   <= id_mem_to_reg;
            ID_EX_Branch     <= id_branch;
            ID_EX_BranchType <= id_branch_type;
            ID_EX_Link       <= id_link;
            ID_EX_ALUOp      <= id_alu_op;
            ID_EX_Funct      <= id_funct;
        end
    end
endmodule