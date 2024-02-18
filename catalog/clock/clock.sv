///////////////////////////////////////////////////////////////////////////////
//
// Clock module
//
// A clock module for your Computer Architecture Elements Catalog
//
// module: clock
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef CLOCK
`define CLOCK

module clock
 #(parameter period = 10) // configuring parametrized module;
 //                          after module name but before instance name, with # 
  (output logic clk); 

   
   
   localparam half_period = period/2;
   initial clk = 1'b0;
    

   always 
   #half_period clk = ~clk;
endmodule

`endif // CLOCK