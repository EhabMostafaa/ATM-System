class agent1 extends uvm_agent;
  `uvm_component_utils(agent1)
  uvm_analysis_port #(ATM_sequence_item) item_agent_port;
  sequencer       sequencer_h;
  Driver          Driver_h;
  monitor1        monitor1_h;
  
  function new(string name = "agent1", uvm_component parent);
    super.new(name, parent);
    item_agent_port=new("item_agent_port", this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("We are in agent1 build phase"), UVM_LOW) 
    super.build_phase(phase);
    sequencer_h   = sequencer::type_id::create("sequencer_h", this);
    Driver_h      = Driver::type_id::create("Driver_h", this);
    monitor1_h    = monitor1::type_id::create("monitor1_h", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
    if(get_is_active() == UVM_ACTIVE) begin
        Driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
        monitor1_h.item_collected_port.connect(item_agent_port);
    end

  endfunction
  
endclass