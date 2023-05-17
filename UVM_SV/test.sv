class test extends uvm_test;
 `uvm_component_utils(test)
  ATM_sequence_operation_toIDLE ATM_sequence_operation_toIDLE_h ;
  ATM_sequence_anotherService ATM_sequence_anotherService_h ;
  ATM_sequence_errors ATM_sequence_errors_h ;
  ATM_sequence_timeouts ATM_sequence_timeouts_h; 
  ATM_env ATM_env_h;
  // virtual ATM_IF ATM_IF_h;
 
  function new(string name = "test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
// virtual function void end_of_elaboration_phase(uvm_phase phase);
//         //ATM_UVM.print_topology();
//     endfunction : end_of_elaboration_phase

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     ATM_sequence_operation_toIDLE_h = ATM_sequence_operation_toIDLE::type_id::create("ATM_sequence_operation_toIDLE_h", this);
     ATM_sequence_anotherService_h = ATM_sequence_anotherService::type_id::create("ATM_sequence_anotherService_h", this);
     ATM_sequence_errors_h = ATM_sequence_errors::type_id::create("ATM_sequence_errors_h", this);
     ATM_sequence_timeouts_h = ATM_sequence_timeouts::type_id::create("ATM_sequence_timeouts_h", this);
     ATM_env_h = ATM_env::type_id::create("ATM_env_h", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info(get_type_name(), $sformatf("We are in test run_phase"), UVM_LOW)
    ATM_sequence_operation_toIDLE_h.start(ATM_env_h.agent1_h.sequencer_h);
    repeat(70) ATM_sequence_anotherService_h.start(ATM_env_h.agent1_h.sequencer_h);
    repeat(40) ATM_sequence_errors_h.start(ATM_env_h.agent1_h.sequencer_h);
    ATM_sequence_timeouts_h.start(ATM_env_h.agent1_h.sequencer_h);
    phase.drop_objection(this);
    
  endtask
  


endclass
