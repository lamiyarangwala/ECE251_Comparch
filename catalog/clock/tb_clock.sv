///////////////////////////////////////////////////////////////////////////////
//
// Clock TESTBENCH module
//
// A clock testbench module for your Computer Architecture Elements Catalog
//
// module: tb_clock
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_clock;
    //
    // ---------------- DECLARATIONS OF PARAMETERS ----------------
    //
    localparam P = 60;

    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
    //inputs are reg for test bench - or use logic

    //outputs are wire for test bench - or use logic
    reg CLK;
    // reg RST;
    // reg EN;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    
    initial begin
        // $monitor ($time,"\tCLK=%b, EN=%b, RST=%b", CLK, EN, RST);
        $monitor ($time,"\tCLK=%b", CLK);
    end

    initial begin
        $dumpfile("tb_clock.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, dut);
    end

    // initial begin : initialize_signals   
    //     RST <= 1'b1;
    //     EN <= 1'b0;
    // end

    

  
    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //

    initial begin: prog_apply_stimuli
    #0
    #10	//RST = 1'b1;
    #10 //RST = 1'b0;
    #10 //EN = 1'b1;
    #10
    #10 
    #10
    #10
    #10
    #100 // EN = 1'b0;
    #10
    #10
    #10
    $finish;
    end

    //
    // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
    //
    // clock #(.period(P)) dut(
    //     .en(EN), .rst(RST), .clk(CLK)
    // );

    clock #(.period(P)) dut(
        .clk(CLK)
    );
endmodule