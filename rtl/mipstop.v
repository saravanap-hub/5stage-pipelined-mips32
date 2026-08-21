
module mips_top (
    
    input wire clk,
    input wire reset
);
 
    reg  [31:0] PC;
 
    wire        id_is_jtype     = (IF_ID_IR[31:26] == 6'b000010) || (IF_ID_IR[31:26] == 6'b000011);
    wire [31:0] id_jump_target  = {IF_ID_NPC[31:26], IF_ID_IR[25:0]};
 

    wire branch_taken_now =
        EX_MEM_Branch && ((EX_MEM_BranchType == 1'b0 &&  EX_MEM_Zero) || (EX_MEM_BranchType == 1'b1 && !EX_MEM_Zero));    // BNE, not equal
 
    wire [31:0] fetch_addr_j;
    mux2 #(.WIDTH(32)) fetch_mux_jump (
        .in0 (PC),
        .in1 (id_jump_target),
        .sel (id_is_jtype),
        .out (fetch_addr_j)
    );
 
    wire [31:0] fetch_addr;
    mux2 #(.WIDTH(32)) fetch_mux_branch (
        .in0 (fetch_addr_j),
        .in1 (EX_MEM_BranchTarget),
        .sel (branch_taken_now),
        .out (fetch_addr)
    );
 
    always @(posedge clk) begin
        if (reset)
            PC <= 32'b0;
        else
            PC <= fetch_addr + 1;
    end