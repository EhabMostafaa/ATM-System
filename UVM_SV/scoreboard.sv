class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
   uvm_analysis_imp #(ATM_sequence_item,scoreboard) analysis_export;
   ATM_sequence_item cmd;
  
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), $sformatf("We are in scoreboard build phase"), UVM_LOW)
     cmd= ATM_sequence_item::type_id::create("cmd");
  endfunction
  
  function new (string name = "scoreboard" , uvm_component parent = null);
    super.new(name,parent);
    analysis_export = new("READ",this);
  endfunction

  function void write(ATM_sequence_item t);
    // `uvm_info(get_type_name(), $sformatf("We are in write function in  scoreboard"), UVM_LOW)
    cmd = t;
    //  Reference Model
    /////////////////////////////////Withdraw Mode operation checking///////////////////////////////////////////////////
    ///////////////////////////////////////Deposit Mode operation checking//////////////////////////////////////////////////////////////////////
  //   if (cmd.card_out)begin

  //     if (cmd.updated_balance == (ATM_UVM.DUT.U0_card_handling.balance_memory[cmd.card_number])) 
  //             `uvm_info(get_type_name(), $sformatf("ScoreBoard_Passed"), UVM_LOW)
  //     else   
  //             `uvm_error("SCOREBOARD_ERROR", $sformatf("ScoreBoard_Error"))
  //   end
  /////////////////////////////////Withdraw Mode operation checking///////////////////////////////////////////////////

  endfunction : write




endclass