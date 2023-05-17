class monitor2 extends uvm_monitor;
  `uvm_component_utils(monitor2)
  virtual ATM_IF  ATM_IF_h;
  ATM_sequence_item cmd;
  uvm_analysis_port #(ATM_sequence_item) item_collected_port2;
    

  function new(string name = "monitor2", uvm_component parent);
    super.new(name, parent);
     item_collected_port2 = new("item_collected_port2", this);
  endfunction
  

  virtual function void build_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("We are in monitor2 build phase"), UVM_LOW)
    super.build_phase(phase);
    if(uvm_config_db#(virtual  ATM_IF)::get(this, "", " ATM_IF_h",  ATM_IF_h))
      `uvm_fatal("monitor2: ", "No vif is found!")
    cmd = ATM_sequence_item::type_id::create("cmd1",this);
  endfunction
  

virtual task run_phase (uvm_phase phase);
  `uvm_info(get_type_name(), $sformatf("We are in monitor2 run_phase"), UVM_LOW)
  forever begin
    @(posedge ATM_IF_h.clk);

//         //monitoring
      cmd.actual_deposit_value = ATM_IF_h.actual_deposit_value ;
      cmd.updated_balance = ATM_IF_h.updated_balance ;
      cmd.operation_done = ATM_IF_h.operation_done ;
//         // write into port
      item_collected_port2.write(cmd);


   end
endtask : run_phase

endclass
