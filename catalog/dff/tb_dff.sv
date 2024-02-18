///////////////////////////////////////////////////////////////////////////////
//
// D Flip Flop TESTBENCH module
//
// A DFF testbench module for your Computer Architecture Elements Catalog
//
// module: tb_dff
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "dff.sv"

module tb_dff;

   reg CLK, EN, RST;
   logic D, Q, QN;

   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin 
        $dumpfile("tb_dff.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, dut);
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
         {D} = invect [1];
         {CLK} = invect[0];
         {EN} = invect[2];
         {RST} = [3];
         #10 $display("D=%b, CLK=%b, RESET=%b, Q=%b, Qn=%b", D, CLK, RESET, Q, QN);
      end
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   dff #dut(.d(D), .rst(RST), .en(EN), .clk(CLK), .q(Q), .qn(QN));

endmodule

