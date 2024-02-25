///////////////////////////////////////////////////////////////////////////////
//
// 2:1 multiplexer TESTBENCH module
//
// A 2:1 mux testbench module for your Computer Architecture Elements Catalog
//
// module: tb_signext
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./signext.sv"

module tb_signext;

   parameter N = 8;
   parameter NUM = 4;
   reg [N-1:0] IN;
   wire [N+NUM-1:0] OUT;
   reg EN, RST;   //iNputs are reg for test beNch

   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("tb_signext.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);

     end

   //apply input vectors
   initial
   begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         {IN} = {invect};
         {EN} = invect[1];
         {RST} = ~invect [0];
         #10 $display("IN=%b, EN=%b, RST=%b, OUT=%b", IN, EN, RST, OUT);
         // #10 $display("IN=%b, OUT=%b", IN, OUT);
      end
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   // signext #(.n(N), .num(NUM)) uut(.in(IN), .out(OUT));
   signext #(.n(N), .num(NUM)) uut(.in(IN), .en(EN), .rst(RST), .out(OUT)); 

endmodule