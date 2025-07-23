module Sync_fifo
  #(parameter FIFO_DEPTH = 8,
    parameter DATA_WIDTH = 32)
  // Ports Section
  (input clk,
   input rst,
   input cs,
   input wr_en,
   input rd_en,
   input [DATA_WIDTH-1:0] data_in,
   output reg [DATA_WIDTH-1:0] data_out,
   output empty,
   output full
  );
  
  localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH); // FIFO_DEPTH_LOG = 3( no. of bits required to change to represent8(000 to 111 ))
   
  // declaring a bi-directional array to store the data 
  reg [DATA_WIDTH-1:0] fifo [0:FIFO_DEPTH-1];
  
  // rd/wr pointer has 1 bit extra at MSB
  reg [FIFO_DEPTH_LOG:0] write_pointer;//3:0  4 bits
  reg [FIFO_DEPTH_LOG:0] read_pointer; //3:0  4 bits
  
 // write 
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        write_pointer <=0;
      else if(cs && wr_en && !full) begin
        fifo[write_pointer[FIFO_DEPTH_LOG-1:0]] <= data_in;
      write_pointer <= write_pointer+1'b1;
    end
    end

  
// read
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        read_pointer <=0;
      else if(cs && wr_en && !empty) begin
          data_out <= fifo[read_pointer[FIFO_DEPTH_LOG-1:0]];
      read_pointer <= read_pointer+1'b1;
    end
    end
  
  assign empty = (read_pointer == write_pointer);
    assign full = (read_pointer =={~write_pointer[FIFO_DEPTH_LOG],write_pointer[FIFO_DEPTH_LOG-1:0]});
endmodule

