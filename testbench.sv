`include "rand_test.sv"
//`include "test_direct.sv"

`include "interface.sv"

module tb_top;
  
  bit reset,clk;
  
  always #5 clk = ~clk;
  
  initial begin
    
    reset = 1;
    
    #5 reset =0;
  end
  
  intf intf_1(clk,reset);
  
  test t1(intf_1);

  adder DUT (.clk(intf_1.clk),.reset(intf_1.reset),.a(intf_1.a),.b(intf_1.b),.c(intf_1.c),.valid(intf_1.valid));
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule
  
  
  