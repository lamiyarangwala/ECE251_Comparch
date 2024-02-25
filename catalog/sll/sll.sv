///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Left module
//
// A shift logical left (sll) module for your Computer Architecture Elements Catalog
//
// module: sll
// hdl: Verilog
//
// author: Lamiya Rangwala <lamiya.rangwala@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef SLL
`define SLL

module sll
#(parameter n = 8,
  parameter amt_n = 1)
(
input [n-1:0] d,
input clk, en, rst,
input [amt_n-1:0] amt,
output reg [n-1:0] out);



   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   always @ (posedge clk)
   begin
      
      
      if (en) begin
         out = 'bz;
      end

      else begin
         if (rst) begin
            out <= d << amt;
         // reg i;
         // reg [n-1:0] temp;
            
         // temp = d;
            
         // for (i = 0; i < amt; i = i + 1);
         // begin
         //    temp = {temp[n-2:0], 1'b0};
         // end
         // out = temp;
         end

         else begin
            out = 'b0;
         end
      end


   end


   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

endmodule

`endif // SLL