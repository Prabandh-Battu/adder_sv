`include "environment.sv"

program test(intf vif);
  
  environment env;
  
  initial begin
  
    env = new(vif);
  
    env.gen.gen_count = 2;
  
    env.run();
    
  end
  
endprogram