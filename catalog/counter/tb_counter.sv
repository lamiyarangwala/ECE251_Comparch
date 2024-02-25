///////////////////////////////////////////////////////////////////////////////
//
// Counter TESTBENCH module
//
// A counter testbench module for your Computer Architecture Elements Catalog
//


//  ** To test without enable and reset, comment out lines 78 and 79.


// module: tb_counter
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module tb_counter;
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
    reg UP_DOWN;
    //outputs are wire for test bench - or use logic
    wire [N-1:0] Q;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_signals
        CLK = 1'b0;
        RST = 1'b1;
        EN = 1'b1;
        UP_DOWN = 1'b0;
    end

//     initial begin
// //        $monitor ($time,"\tCLK=%b EN=%b RST=%b Z1=%b", CLK, RST, EN, Z1);
//         $monitor ($time,"\tCLK=%b EN=%b RST=%b UP_DOWN=%b, Q=%d", CLK, EN, RST, UP_DOWN, Q);
// //        $display("0x%04h_%04h_%04h_%04h", d[63:48], d[47:32], d[31:16], d[15:0]);
//     end

    initial begin
        $dumpfile("tb_counter.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, dut);
    end
  
    // a simple clock with 50% duty cycle
    always begin: clock
        #10 CLK = ~CLK;
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //


   initial
   begin: apply_stimulus
  
      reg[N:0] invect; 
      int break_inner_loop;
      break_inner_loop = 0;
      
      for (UP_DOWN = 0; UP_DOWN <= 'd1; UP_DOWN++) begin
      for (invect = 0; invect < 2*{N{1'b1}}; invect = invect + 1)
      begin
        // -------------------- TO TEST WITHOUT ENABLE, RESET--------------------------------
        // ---------------------- COMMENT OUT FOLLOWING TWO LINES ------------------------------ 
        // RST=$random;
        // EN=$random;
         #10 $display("CLK=%b EN=%b RST=%b UP_DOWN=%b, Q=%d", CLK, EN, RST, UP_DOWN, Q);
         
         
      
      end
      end
      $finish;
   end


    //
    // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
    //
    counter #(.n(N)) dut(
        .rst(RST), .clk(CLK), .en(EN), .up_down(UP_DOWN), .q(Q)
    );

endmodule
