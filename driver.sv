class driver;
  
  virtual intf vif;
  
  mailbox gen2driv; // calling this from env later on i will include it in my environment
  
  int trans_rx;
  
  function new (virtual intf vif,mailbox gen2driv); //my method with arguments for caliing in environment using driver class
    
    this.vif = vif;
    this.gen2driv = gen2driv;
    
  endfunction
  
  task reset(); // reset before pass gen trans to driver
    
    wait(vif.reset);
    $display("RESET STARTED");
    vif.a <= 0;
    vif.b <= 0;
    vif.valid <= 0;
    wait(!vif.reset);
    $display("RESET ENDED");
    
  endtask
  
  task main; // functionality of driver class and also need to look at RTL for the defining diection of the signal
    
    forever  // forever loop so that we can keep a track on trans_x
      
      begin
      
      transaction trans;
      
      gen2driv.get(trans); // calling transaction using mailbox handle to show direction for received transactions
      
      @(posedge vif.clk);
      vif.valid <= 1; // so that i can drive a and b as per the RTL
      vif.a <= trans.a;
      vif.b <= trans.b;
      
      @(posedge vif.clk);
      
      vif.valid <= 0;
      
      trans.c = vif.c; // as c is an output it will get its direction from interface
      
      @(posedge vif.clk);
      
      trans.display("::[DRIVER]::");
      
      trans_rx ++; // watch out this we can releate this with gen_count and control the transaction flow b/w driver and generator
      
    end
     
  endtask
  
  
endclass
      
  
  

  
  