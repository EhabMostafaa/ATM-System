class sequencer extends uvm_sequencer#(ATM_sequence_item);
  `uvm_component_utils(sequencer)
  
  function new(string name = "sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction
  
endclass