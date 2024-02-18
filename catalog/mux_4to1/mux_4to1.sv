///////////////////////////////////////////////////////////////////////////////
//
// 4:1 multiplexer module
//
// A 4:1 mux module for your Computer Architecture Elements Catalog
//
// module: mux_4to1
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef MUX_4TO1
`define MUX_4TO1

module mux_4to1(a,b,c);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   input [3:0] a;
   input [1:0] b;
   output reg c;
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   always@ (a, b, c)
   begin 

      case (b)
         2'b00 : c = a[0];
         2'b01 : c = a[1];
         2'b10 : c = a[2];
         2'b11 : c = a[3];
         default: begin
            c = 0;
         end
      endcase
   end

endmodule

`endif // MUX_4TO1