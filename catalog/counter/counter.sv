///////////////////////////////////////////////////////////////////////////////
//
// Counter module
//
// A counter module for your Computer Architecture Elements Catalog
//
// module: counter
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef COUNTER
`define COUNTER

module counter 
   #(parameter n = 8)
   (rst, clk, en, up_down, q);

   input rst, clk, en, up_down;
   output reg [n-1:0] q;

   initial begin
      q = 0;
   end

   always @(negedge rst, posedge clk) begin
      if (!en)
         q <= 'bz;
      else if (!rst)
         q <= 0;
      else
         q <= q + (up_down ? 1 : -1);
      
   end


endmodule

`endif // COUNTER