class ATM_env extends uvm_env;
  `uvm_component_utils(ATM_env)
  ///////////////// declarations of agents and scoreboard /////////////////////
  agent1            agent1_h ;
  //agent2            agent2_h ;
  scoreboard        scoreboard_h ;
  ATM_coverage      ATM_coverage_h;
  ////////////////////////////////////////////////////////////////////////////
  
  
  function new(string name = "ATM_env", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), $sformatf("We are in enviroment build phase"), UVM_LOW) 
    agent1_h        = agent1::type_id::create("agent1_h", this);
    scoreboard_h    = scoreboard::type_id::create("scoreboard_h", this);
    //agent2_h      = agent2::type_id::create("agent2_h", this);
    ATM_coverage_h  = ATM_coverage::type_id::create("ATM_coverage_h", this);
    // set_config_int("agent1", "is_active", UVM_ACTIVE);
    // set_config_int("agent2", "is_active", UVM_ACTIVE);
  endfunction
  
  /////////////////// need to be updated ////////////////////////////
  virtual function void connect_phase(uvm_phase phase);
  `uvm_info(get_type_name(), $sformatf("We are in enviroment connect phase"), UVM_LOW)
  agent1_h.item_agent_port.connect(scoreboard_h.analysis_export);
  agent1_h.item_agent_port.connect(ATM_coverage_h.analysis_export);
  //agent2_h.item_agent2_port.connect(scoreboard_h.analysis_export);
  //agent2_h.item_agent2_port.connect(ATM_coverage_h.analysis_export);
  // agent1_h.monitor1_h.item_collected_port.connect(scoreboard_h.analysis_export);
  // agent1_h.monitor2_h.item_collected_port.connect(ATM_coverage_h.analysis_export);
  endfunction
  
endclass

