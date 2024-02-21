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

   reg [N-1:0] Q0;
   reg [N-1:0] Q1;
   reg SEL, EN;   //iNputs are reg for test beNch
   wire [N-1:0] D;     //outputs are wire for test beNch
   parameter N = 8;
   
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
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abciN = %b, cout = %b, sum = %b", {a, b, ciN}, cout, sum);
         {Q0} = invect [N-1:0];
         {Q1} = ~invect [N-1:0];
         {SEL} = ~invect [0];
         {EN} = invect[1];
         #10 $display("Q0=%b, Q1=%b, en=%b, sel=%b, d=%b",Q0, Q1, EN, SEL, D);
      end
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   mux_2to1 #(.n(N)) uut(.q0(Q0), .q1(Q1), .en(EN), .sel(SEL), .d(D));

endmodule