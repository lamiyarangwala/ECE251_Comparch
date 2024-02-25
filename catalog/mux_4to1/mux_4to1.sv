///////////////////////////////////////////////////////////////////////////////
//
// 4:1 multiplexer module
//
// A 4:1 mux module for your Computer Architecture Elements Catalog
//
// module: mux_4to1
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////



`ifndef MUX_4TO1
`define MUX_4TO1

module mux_4to1
#(parameter n=8)

(q0, q1, q2, q3, en, sel, rst, d);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   input [n-1:0] q0;
   input [n-1:0] q1;
   input [n-1:0] q2;
   input [n-1:0] q3;
   input [1:0] sel;
   input en, rst;
   output reg [n-1:0] d;

   always@*
   begin 
      if (en) begin
         if (!rst)
         d <= 0;
         else begin
            case (sel)
               2'b00 : d <= q0;
               2'b01 : d <= q1;
               2'b10 : d <= q2;
               2'b11 : d <= q3;
               default: begin
               d <= 0;
               end
               
            endcase
         end
   end
   else 
      d <= 'bz;
   
   end
endmodule
`endif // MUX_4TO1


