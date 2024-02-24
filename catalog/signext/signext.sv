/////////////////////////////////////////////////////////////////////////////
//
// Sign Extender module
//
// A sign extension module for your Computer Architecture Elements Catalog
//
// module: signext
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////



`ifndef SIGNEXT
`define SIGNEXT

module signext
#(parameter n  = 8,
  parameter num = 8)
(in,out);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
  input reg [n-1:0]  in;
  output reg [n+num-1:0] out;

   always@*
   begin 
      if (in[n-1] == 1'b1) begin
      out <= {{num{1'b1}}, in};
    end
    else begin
      out <= {{num{1'b0}}, in};
    end
   end
endmodule




   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //




`endif // SIGNEXT



