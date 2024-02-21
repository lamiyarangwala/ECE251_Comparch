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
   (r, clr, clk, en, load, up_down, q);

   input [n-1:0] r;
   input clr, clk, en, load, up_down;
   output reg [n-1:0] q;

   always @(negedge clr, posedge clk) begin
      if (!clr)
         q <= 0;
      else if (load)
         q <= r;
      else if (en)
         q <= q + (up_down ? 1 : -1);

   end

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

endmodule

`endif // COUNTER