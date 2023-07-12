interface intf (input logic clk,reset);
  
  logic [3:0] a; 
  logic [3:0] b;
  
  logic valid;
  logic [6:0] c; // turn off valid to drive a+b to c
  
endinterface

