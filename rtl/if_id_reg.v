
module if_id_reg (
    input  wire        clk,
    input  wire        reset,
    input  wire        stall,   // hold current contents (freeze this stage)
    input  wire [31:0] if_instr,
    input  wire [31:0] if_npc,
    output reg  [31:0] IF_ID_IR,
    output reg  [31:0] IF_ID_NPC
);

    always @(posedge clk) begin
        if (reset) begin
            IF_ID_IR  <= 32'b0;
            IF_ID_NPC <= 32'b0;
        end 
        else if (!stall) begin
            IF_ID_IR  <= if_instr;
            IF_ID_NPC <= if_npc;
        end
    end
endmodule