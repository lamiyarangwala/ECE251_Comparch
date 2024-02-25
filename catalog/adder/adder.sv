///////////////////////////////////////////////////////////////////////////////
//
// Full Adder module
//
// Full adder module for your Computer Architecture Elements Catalog
//
// module: adder
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef ADDER
`define ADDER

module adder
#(parameter n = 8)
   (a, b, cin, sum, en, rst, cout);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   input [n-1:0] a;
   input [n-1:0] b;
   input cin, en, rst;
   output reg cout;
   output reg [n-1:0] sum;



   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   always @* begin
      begin 
      if (en)
         sum = 'bz;
      else
         if (rst)
            {cout,sum} = a + b + cin;
         else
            sum = 0;
   end
   end


endmodule

`endif // ADDER