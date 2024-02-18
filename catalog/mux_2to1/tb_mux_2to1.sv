///////////////////////////////////////////////////////////////////////////////
//
// 2:1 multiplexer TESTBENCH module
//
// A 2:1 mux testbench module for your Computer Architecture Elements Catalog
//
// module: tb_mux_2to1
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./mux_2to1.sv"

module tb_mux_2to1;

   reg [1:0] A;
   reg B;   //inputs are reg for test bench
   wire C;     //outputs are wire for test bench
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("tb_mux_2to1.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial
   begin: apply_stimulus
      reg[3:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 8; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abcin = %b, cout = %b, sum = %b", {a, b, cin}, cout, sum);
         {A} = invect [1:0];
         {B} = ~invect [0];
         #10 $display("a=%b, b=%b, c=%b", A, B, C);
      end
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   mux_2to1 uut(.a(A), .b(B), .c(C));

endmodule