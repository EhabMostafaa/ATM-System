class agent2 extends uvm_agent;
  `uvm_component_utils(agent2)
  uvm_analysis_port #(ATM_sequence_item) item_agent2_port;
  monitor2        monitor2_h;
  
  function new(string name = "agent2", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   `uvm_info(get_type_name(), $sformatf("We are in agent2 build phase"), UVM_LOW) 
    monitor2_h    = monitor2::type_id::create("monitor2_h", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
    // if(get_is_active() == UVM_ACTIVE) begin
        monitor2_h.item_collected_port2.connect(item_agent2_port);
    // end

  endfunction
  
endclass