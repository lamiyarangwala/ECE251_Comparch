/////////////////////////////////////////////////////////////////////////////
//
// Sign Extender module
//
// A sign extension module for your Computer Architecture Elements Catalog
//
// module: signext
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////



`ifndef SIGNEXT
`define SIGNEXT

module signext
#(parameter n  = 8,
  parameter num = 8)
(in, en, rst, out);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
  input [n-1:0] in;
  input en, rst;
  output reg [n+num-1:0] out;

   always@*
   begin 

    if (en)
         out = 'bz;
      
    else begin

      if (rst) begin
        if (in[n-1] == 1'b1) begin
          out <= {{num{1'b1}}, in};
        end
        else begin
          out <= {{num{1'b0}}, in};
        end
      end

      else
          out = 0;
    end

  
   end
endmodule




   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //




`endif // SIGNEXT



