class ATM_sequence_operation_toIDLE extends uvm_sequence#(ATM_sequence_item);
  `uvm_object_utils(ATM_sequence_operation_toIDLE)
  ATM_sequence_item cmd;
  function new(string name = "ATM_sequence_operation_toIDLE");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info(get_type_name(), $sformatf("We are in body of enter sequence"), UVM_LOW)
    cmd = ATM_sequence_item::type_id::create("cmd");
    start_item(cmd);
    cmd.mode.rand_mode(0);
    cmd.mode  = 1;
    finish_item(cmd);
  endtask

endclass

