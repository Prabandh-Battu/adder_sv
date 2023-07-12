class transaction;
  
  rand logic [3:0] a;
  
  rand logic [3:0] b; // do not repeat
    
  logic [6:0] c;
 
  
  function void display(string name);
    
    $display("-----%s------",name);
    
    $display("A = %0d | B = %0d",a,b);
    
    $display("C = %0d",c);
    
  endfunction
   
endclass
  
  
  