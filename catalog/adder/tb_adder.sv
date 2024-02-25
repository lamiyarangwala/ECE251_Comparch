///////////////////////////////////////////////////////////////////////////////
//
// Full Adder TESTBENCH module
//
// An adder testbench module for your Computer Architecture Elements Catalog
//
// module: tb_adder
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./adder.sv"

module tb_adder;
   
   reg [N-1:0] A;
   reg [N-1:0] B;  
   reg CIN, EN, RST;  //inputs are reg for test bench
   logic [N-1:0] SUM;
   logic COUT;
   parameter N = 8;
       //outputs are wire for test bench
   
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("adder.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial
   begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abcin = %b, cout = %b, sum = %b", {a, b, cin}, cout, sum);
         {A} = invect [N-1:0];
         {B} =$random;
         
         EN = $random;
         RST = $random;


         {CIN} = invect[0];
         #10 $display("A=%b, B=%b, CIN=%b, EN=%b, RST=%b, SUM=%b, COUT=%b", A, B, CIN, EN, RST, SUM, COUT);
      end
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   adder #(.n(N)) uut(.a(A), .b(B), .cin(CIN), .sum(SUM), .en(EN), .rst(RST), .cout(COUT));

endmodule