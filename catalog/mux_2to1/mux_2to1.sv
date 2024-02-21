///////////////////////////////////////////////////////////////////////////////
//
// 2:1 multiplexer module
//
// A 2:1 mux module for your Computer Architecture Elements Catalog
//
// module: mux_2to1
// hdl: Verilog
//
// author: Lamiya Rangwala <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef MUX_2TO1
`define MUX_2TO1

module mux_2to1
#(parameter n=8)
(q0, q1, en, sel, d);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   input [n-1:0] q0;
   input [n-1:0] q1;
   input sel, en;
   output reg [n-1:0] d;

   always@ (q0, q1, sel, d, en)
   begin 
      if (en) begin
      case (sel)
         1'b0 : d <= q0;
         1'b1 : d <= q1;
         default: begin
           d <= 0;
         end
      endcase
   end
   else begin
      d <= 'bz;
   end
   end
endmodule




   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //




`endif // MUX_2TO1