
module data_mem (

    input  wire        clk,
    input  wire [31:0] addr,
    input  wire [31:0] write_data,
    input  wire        mem_read,
    input  wire        mem_write,
    output wire [31:0] read_data
    
);
    reg [31:0] mem [0:1023];
 
    assign read_data = mem[addr];
 
    always @(posedge clk) begin
        if (mem_write)
            mem[addr] <= write_data;
    end
endmodule
 