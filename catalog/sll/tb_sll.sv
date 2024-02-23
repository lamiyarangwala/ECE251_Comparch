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
module tb_sll;
    //
    // ---------------- DECLARATIONS OF PARAMETERS ----------------
    //
    parameter N = 8;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
    //inputs are reg for test bench - or use logic
    reg CLK;
    reg RST;
    reg EN;
    reg [N-1:0] D;
    reg AMT;
    //outputs are wire for test bench - or use logic
    logic [N-1:0] OUT;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_signals
        CLK <= 1'b0;
        RST <= 1'b1;
        EN <= 1'b1;
        D <= 0;
        AMT <= 2'b10;
    end

    initial begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abciN = %b, cout = %b, sum = %b", {a, b, ciN}, cout, sum);
         
         {CLK} = invect [0];
         //{EN} = invect [1];
         //{RST} = invect [2];
         
         if(invect[2])
         {D} = invect;

         //#10 $display("CLK=%b EN=%b RST=%b D=%b, AMT=%b \nOUT=%b",
            //CLK, EN, RST, D, AMT, OUT);
         #10 $display("CLK=%b D=%b, \n\tOUT=%b\n",
            CLK, D, OUT);
      end
      $finish;
   end
    
    initial begin
        $dumpfile("tb_sll.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, dut);
    end
  
    // a simple clock with 50% duty cycle
    always begin: clock
        #10 CLK = ~CLK; // every 10 timescale units, the clock inverts
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //

    

    //
    // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
    //
    sll #(.n(N)) dut(.clk(CLK), .rst(RST), .en(EN), .d(D), .amt(AMT), .out(OUT));

endmodule
