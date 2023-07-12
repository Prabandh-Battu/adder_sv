`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  generator gen;
  
  monitor mon;
  
  driver driv;
  
  scoreboard scb;
  
  virtual intf vif;
  
  mailbox gen2driv;
  
  mailbox mon2scb;
  
  function new (virtual intf vif);
    
    this.vif = vif;
    gen2driv = new();
    mon2scb = new();
    gen = new(gen2driv);
    driv = new(vif,gen2driv);
    mon = new(vif,mon2scb);
    scb = new(mon2scb);
  
    
  endfunction
  
  task pre_test;
    
    driv.reset();
    
  endtask
  
  task test;
    
    fork
    
      gen.main();
    
      driv.main();
    
      mon.main();
    
      scb.main();
      
    join_any // cause all are not required in every test case this could be the reason
    
  endtask
  
  
  task post_test;
    
    wait(gen.g2d.triggered);
    wait(gen.gen_count == driv.trans_rx);
    wait(gen.gen_count == scb.scb_tranx);
    
  endtask
  
  
  task run;
    
    pre_test();
    test();
    post_test();
    
    $finish;
    
  endtask
  
endclass
    
    