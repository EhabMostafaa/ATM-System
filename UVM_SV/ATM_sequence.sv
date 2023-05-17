class ATM_sequence extends uvm_sequence#(ATM_sequence_item);
  `uvm_object_utils(ATM_sequence)
  ATM_sequence_item cmd;
  
  function new(string name = "ATM_sequence");
    super.new(name);
  endfunction


  
  virtual task body();
    `uvm_info(get_type_name(), $sformatf("We are in body of sequence"), UVM_LOW)

      cmd = ATM_sequence_item::type_id::create("cmd");
      start_item(cmd);
      cmd.mode= 1 ;
      finish_item(cmd);

  endtask
  
endclass