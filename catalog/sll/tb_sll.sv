///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Left (sll) TESTBENCH module
//
// A sll testbench module for your Computer Architecture Elements Catalog

// __________________________________________________________________________________
// ** To test without enable and reset, comment out lines 69 and 70.
// __________________________________________________________________________________

//
// module: tb_sll
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
module tb_sll;
    //
    // ---------------- DECLARATIONS OF PARAMETERS ----------------
    //
    parameter N = 8;
    parameter AMT_N = 3;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
    //inputs are reg for test bench - or use logic
    reg CLK;
    reg RST;
    reg EN;
    reg [N-1:0] D;
    reg [AMT_N-1:0] AMT;
    //outputs are wire for test bench - or use logic
    logic [N-1:0] OUT;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_signals
        CLK <= 1'b0;
        RST <= 1'b1;
        EN <= 1'b0;
        D <= 0;
        AMT <= {AMT_N{1'b0}};
    end



    initial begin: apply_stimulus
      reg[N-1:0] invect;
      reg[AMT_N-1:0] j;
      int break_outer_loop;
      break_outer_loop = 0;
      for (j = 1; j < {AMT_N{1'b1}} && !break_outer_loop; j = j + 1) begin 

        int break_inner_loop;
        break_inner_loop = 0;
        if (AMT == {AMT_N{1'b1}}) begin
                break_outer_loop <= 1;
            end
    
      for (invect = 0; invect < 2*{N{1'b1}} && !break_inner_loop; invect = invect + 1)
      begin
         
        // -------------------- TO TEST WITHOUT ENABLE AND RESET --------------------------------
        // ---------------------- COMMENT OUT FOLLOWING TWO LINES ------------------------------ 
        //EN = $random;
        //RST = $random;

        AMT = j;
         
         if (!CLK) begin
         D = D + 1; 
         end
      
        
         #10 $display("CLK=%b EN=%b RST=%b D=%b, AMT=%d \nOUT=%b",
            CLK, EN, RST, D, AMT, OUT);

            if (D == {N{1'b1}}) begin
                break_inner_loop = 1;
                D <= 0;
            end


      end

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
    // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
    //
    sll #(.n(N), .amt_n(AMT_N)) dut(.clk(CLK), .rst(RST), .en(EN), .d(D), .amt(AMT), .out(OUT));

endmodule
