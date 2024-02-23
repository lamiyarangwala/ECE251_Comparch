///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Left module
//
// A shift logical left (sll) module for your Computer Architecture Elements Catalog
//
// module: sll
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef SLL
`define SLL

module sll
#(parameter n = 8)
(
input [n-1:0] d,
input amt, clk, en, rst,
output reg [n-1:0] out);



   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   always @ (posedge clk)
   begin
      
      
      if (!rst) begin
         out = 0;
      end

      else begin
         if (en) begin
         reg i;
         reg [n-1:0] temp;
            
         temp = d;
            
         for (i = 0; i < amt; i = i + 1);
         begin
            temp = {temp[n-2:0], 1'b0};
         end
         out = temp;
         end

         else begin
            out = 'bz;
         end
      end


   end


   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

endmodule

`endif // SLL