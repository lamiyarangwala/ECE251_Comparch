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

module dff
    # (
        parameter n = 8
    )(
  input  logic [n-1:0] d, 
  input clk, rst, en,
  output logic [n-1:0] q, 
  output logic [n-1:0] qn
);
  always_ff @(posedge clk, posedge rst) begin
    if (en) begin
    if (rst) begin
      q  <= 0;
      qn <= ~0;
    end else begin
      q  <= d;
      qn <= ~d;
    end
    end
    else begin
    q <= 'bz;
    qn <= 'bz;
    end
    
  end
endmodule