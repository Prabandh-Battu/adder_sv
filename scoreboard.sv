class scoreboard;
  
  mailbox mon2scb;
  
  int scb_tranx;
  
  function new(mailbox mon2scb);
    
    this.mon2scb = mon2scb;
    
  endfunction
  
  task main;
    
    forever begin
      
      transaction trans;
      
      mon2scb.get(trans);
      
      if((trans.a + trans.b) == trans.c)
        begin
          $display("::::RESULT AS EXPECTED::::");
        end
      
      else 
        begin
          $error("::::RESULT IS INVALID::::");
        end
      
      scb_tranx++;
      
      trans.display("::::[SCOREBOARD]::::");
      
    end
    
  endtask
  
endclass
      
      
  
  
  