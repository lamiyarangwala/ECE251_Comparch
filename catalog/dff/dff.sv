///////////////////////////////////////////////////////////////////////////////
//
// D Flip Flow (DFF) module
//
// A DFF module for your Computer Architecture Elements Catalog
//
// module: dff
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef DFF
`define DFF

module dff(input d, input rst, input en, input clk, output logic q, output logic qn);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   always @ (posedge clk or negedge rst)
   begin
      if (!rst) begin
         q = 0;
         qn = ~q;
      end
      else begin
         q = d;
         qn = ~q;
      end
   end


endmodule

`endif // DFF