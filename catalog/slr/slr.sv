///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Left module
//
// A shift logical left (sll) module for your Computer Architecture Elements Catalog
//
// module: sll
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef SLR
`define SLR

module slr
#(parameter width = 8)
(input d,
input clk,
input en,
input rst, 
output reg [width-1:0] out);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   always @ (posedge clk)
   begin
      if (!rst) begin
         out <= 0;
      end
      else begin
         if (en)
         out <= {d, out[width-1:1]};
         else begin
            out <= out;
         end
      end


   end


   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

endmodule

`endif // SLR