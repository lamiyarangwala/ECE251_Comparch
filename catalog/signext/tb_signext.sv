///////////////////////////////////////////////////////////////////////////////
//
// EXAMPLE TESTBENCH module
//
// An example testbench module for your Computer Architecture Elements Catalog
//
// module: tb_example_module
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./signext.sv"

module signext;

    parameter N = 8;
    parameter NUM = 8;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
    //inputs are reg for test bench - or use logic
    reg [N-1:0] IN;
    reg [NUM+N-1:0] OUT;
    
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("signext.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abciN = %b, cout = %b, sum = %b", {a, b, ciN}, cout, sum);
         {IN} = invect;
         #10 $display("IN=%b, OUT=%b", IN, OUT);
      end
      $finish;
   end
    

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   signext #(.n(N), .num(NUM)) uut(.in(IN), .out(OUT));

endmodule