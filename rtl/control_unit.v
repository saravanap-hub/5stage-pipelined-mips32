module control_unit(
    input  [5:0] opcode,
    output       reg_write,
    output [1:0] reg_dst,     // 00 = rt, 01 = rd, 10 = $31 (JAL)
    output       alu_src,     // 0 = reg B, 1 = sign-extended immediate
    output       mem_read,
    output       mem_write,
    output       mem_to_reg,
    output       branch,
    output       branch_type, // 0 = BEQ, 1 = BNE
    output       jump,
    output       link,        // JAL: write return address into $31
    output [2:0] alu_op
);
    reg [13:0] controls;

 
    assign {reg_write, reg_dst, alu_src, mem_read, mem_write, mem_to_reg,
            branch, branch_type, jump, link, alu_op} = controls;
 

    parameter R_TYPE = 6'b000000,
              ADDI    = 6'b001000,
              ANDI    = 6'b001100,
              ORI     = 6'b001101,
              SLTI    = 6'b001010,
              LW      = 6'b100011,
              SW      = 6'b101011,
              BEQ     = 6'b000100,
              BNE     = 6'b000101,
              J       = 6'b000010,
              JAL     = 6'b000011;
 
    always @(*)
        case (opcode)
            R_TYPE : controls = 14'b1_01_0_0_0_0_0_0_0_0_010;
            ADDI   : controls = 14'b1_00_1_0_0_0_0_0_0_0_000;
            ANDI   : controls = 14'b1_00_1_0_0_0_0_0_0_0_011;
            ORI    : controls = 14'b1_00_1_0_0_0_0_0_0_0_100;
            SLTI   : controls = 14'b1_00_1_0_0_0_0_0_0_0_101;
            LW     : controls = 14'b1_00_1_1_0_1_0_0_0_0_000;
            SW     : controls = 14'b0_00_1_0_1_0_0_0_0_0_000;
            BEQ    : controls = 14'b0_00_0_0_0_0_1_0_0_0_001;
            BNE    : controls = 14'b0_00_0_0_0_0_1_1_0_0_001;
            J      : controls = 14'b0_00_0_0_0_0_0_0_1_0_000;
            JAL    : controls = 14'b1_10_0_0_0_0_0_0_1_1_000;
            default: controls = 14'bx_xx_x_x_x_x_x_x_x_x_xxx; // NOP / unknown
        endcase
endmodule