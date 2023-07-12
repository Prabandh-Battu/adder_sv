`include "environment.sv"

program test(intf vif);
  
  class tr extends transaction;
    
    function void pre_randomize();
      
      a.rand_mode(0);
      b.rand_mode(0);
      a = 4;
      b = 5;
      
    endfunction
    
  endclass
  
  environment env;
  
  tr tr1;
  
  initial begin
    
    env = new(vif);
    
    tr1 = new();
    
    env.gen.gen_count = 2;
    
    env.gen.trans = tr1;
    
    env.run();
    
  end
  
endprogram
