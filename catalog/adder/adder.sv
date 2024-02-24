///////////////////////////////////////////////////////////////////////////////
//
// Full Adder module
//
// Full adder module for your Computer Architecture Elements Catalog
//
// module: adder
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef ADDER
`define ADDER

module adder
#(parameter n = 8)
   (a, b, cin, sum, cout);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   input [n-1:0] a;
   input [n-1:0] b;
   input cin;
   output reg cout;
   output reg [n-1:0] sum;



   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   always @* begin
      {cout,sum} = a + b + cin;
   end


endmodule

`endif // ADDER