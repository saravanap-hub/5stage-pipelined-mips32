
module mem_wb_reg (
    
    input  wire        clk,
    input  wire        reset,
 
    input  wire [31:0] mem_ir,
    input  wire [31:0] mem_alu_out,
    input  wire [31:0] mem_read_data,
    input  wire [4:0]  mem_write_reg,
 
    input  wire        mem_reg_write,
    input  wire        mem_to_reg_in,
 
    output reg  [31:0] MEM_WB_IR,
    output reg  [31:0] MEM_WB_ALUOut,
    output reg  [31:0] MEM_WB_LMD,
    output reg  [4:0]  MEM_WB_WriteReg,
 
    output reg          MEM_WB_RegWrite,
    output reg          MEM_WB_MemtoReg
);


    always @(posedge clk) begin
        if (reset) begin
            MEM_WB_IR       <= 32'b0;
            MEM_WB_ALUOut   <= 32'b0;
            MEM_WB_LMD      <= 32'b0;
            MEM_WB_WriteReg <= 5'b0;
            MEM_WB_RegWrite <= 1'b0;
            MEM_WB_MemtoReg <= 1'b0;
        end 
        else begin
            MEM_WB_IR       <= mem_ir;
            MEM_WB_ALUOut   <= mem_alu_out;
            MEM_WB_LMD      <= mem_read_data;
            MEM_WB_WriteReg <= mem_write_reg;
            MEM_WB_RegWrite <= mem_reg_write;
            MEM_WB_MemtoReg <= mem_to_reg_in;
        end
    end
endmodule