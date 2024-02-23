`timescale 1ns/100ps
module tb_dff;
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
    
    //outputs are wire for test bench - or use logic
    logic [N-1:0] D;
    logic [N-1:0] Q;
    logic [N-1:0] Qn;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_signals
        CLK <= 1'b0;
        RST <= 1'b0;
        EN <= 1'b1;
        D <= 0;
    end

    initial begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 256; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abciN = %b, cout = %b, sum = %b", {a, b, ciN}, cout, sum);
         {CLK} = invect [0];
         {EN} = invect [1];
         {RST} = invect [2];
         {D} = invect;
         #10 $display("CLK=%b EN=%b RST=%b \nD=%b \nQ==%b \nQn=%b",
            CLK, EN, RST, D, Q, Qn);
      end
      $finish;
   end
    
    initial begin
        $dumpfile("tb_dff.vcd"); // for Makefile, make dump file same as module name
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
    dff #(.n(N)) dut(
        .d(D), .clk(CLK), .rst(RST), .en(EN), .q(Q), .qn(Qn)
    );

endmodule
