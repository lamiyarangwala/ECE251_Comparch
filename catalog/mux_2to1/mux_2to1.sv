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

module mux_2to1(a, b, c);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   input [1:0] a;
   input b;
   output reg c;

   always@ (a, b, c)
   begin 

      case (b)
         1'b0 : c = a[0];
         1'b1 : c = a[1];
         default: begin
            c = 0;
         end
      endcase
   end
endmodule




   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //




`endif // MUX_2TO1