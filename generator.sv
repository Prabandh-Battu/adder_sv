class generator;
  
  transaction trans; // class declaration of transaction
  
  int gen_count; // no.of transactions to be generated
  
  mailbox gen2driv; // to drive the transactions to driver from generator using mailbox handle
  
  event g2d; // after trans put in to driver we can trigger using this 
  
  function new (mailbox gen2driv); // generator method 
  
    this.gen2driv = gen2driv;
    
  endfunction
  
  task main; // main task functionality of generator
    
           
      repeat(gen_count)
        
        begin  // we can track gen_count in test_env
        
        
          trans = new();
        
        
          if(!trans.randomize()) $fatal("[%0t]|Randomization failed",$time);
        
        
          trans.display("[GENERATOR]"); // calling display of trans
        
        
          gen2driv.put(trans); // sending trans to mail box by operation .put
        
      
        end
     
    
    -> g2d; // calling after generating and installing into mailbox
    
    
  endtask 
  
endclass 
        
        
        