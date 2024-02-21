///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Left (sll) TESTBENCH module
//
// A sll testbench module for your Computer Architecture Elements Catalog
//
// module: tb_sll
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./sll.sv"

module tb_sll;

   reg D;   //inputs are reg for test bench
   reg CLK;
   reg EN;
   reg RST;
   wire [width-1:0] OUT;
   
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("tb_sll.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   always #10 clk = ~clk;

   inital begin
   CLK <= 0;
   EN <= 0;
   RST <= 0;
   D <= 'h1;
   end

   inital begin
   RST <= 0;
   #20 RST <= 1;
   EN <= 1;

   repeat (7) @ (posedge clk)
      data <= ~data;

   #10 dir <= 1;
   repeat (7) @ (posedge clk)
      data <= ~data;

   repeat (7) @ (posedge clk);

   $finish;
   end

   initial 
   $monitor ("RST=%0b D=%0b EN=%0b OUT=%b," RST, D, EN, OUT)
   

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   sll #(width) uut(.d(D), .clk(CLK),.en(EN),.rst(RST),.out(OUT));

endmodule
