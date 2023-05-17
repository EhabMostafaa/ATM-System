class monitor1 extends uvm_monitor;
  `uvm_component_utils(monitor1)
  virtual ATM_IF  ATM_IF_h;
  uvm_analysis_port #(ATM_sequence_item) item_collected_port;
  ATM_sequence_item cmd;
  
  
  function new(string name = "monitor1", uvm_component parent);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
  endfunction
  

  virtual function void build_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("We are in monitor1 build phase"), UVM_LOW)
    super.build_phase(phase);
    // item_got = f_sequence_item::type_id::create("item_got");
      
    if(!uvm_config_db#(virtual ATM_IF)::get(this, "", "ATM_IF_h", ATM_IF_h))
      `uvm_fatal("monitor1: ", "No vif is found!")
    cmd = ATM_sequence_item::type_id::create("cmd",this);
  endfunction
      
  virtual task run_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("We are in monitor1 run_phase"), UVM_LOW)
    forever begin
      @(negedge ATM_IF_h.clk);
      //monitoring
        cmd.card_in                 =         ATM_IF_h.card_in                            ;
        cmd.card_number             =         ATM_IF_h.card_number                        ;      
        cmd.button_0                =         ATM_IF_h.button_0                           ;
        cmd.button_1                =         ATM_IF_h.button_1                           ; 
        cmd.button_2                =         ATM_IF_h.button_2                           ;
        cmd.button_3                =         ATM_IF_h.button_3                           ;
        cmd.button_4                =         ATM_IF_h.button_4                           ;                                             
        cmd.button_5                =         ATM_IF_h.button_5                           ;                    
        cmd.button_6                =         ATM_IF_h.button_6                           ;
        cmd.button_7                =         ATM_IF_h.button_7                           ;
        cmd.button_8                =         ATM_IF_h.button_8                           ;
        cmd.button_9                =         ATM_IF_h.button_9                           ;
        cmd.enter_button            =         ATM_IF_h.enter_button                       ;
        cmd.cancel_button           =         ATM_IF_h.cancel_button                      ; 
        // cmd.correct_button          =         ATM_IF_h.correct_button                     ;
        cmd.Arabic_button           =         ATM_IF_h.Arabic_button                      ;
        cmd.English_button          =         ATM_IF_h.English_button                     ;
        cmd.withdraw_button         =         ATM_IF_h.withdraw_button                    ;
        cmd.deposit_button          =         ATM_IF_h.deposit_button                     ;
        cmd.show_balance            =         ATM_IF_h.show_balance                       ;
        cmd.another_service         =         ATM_IF_h.another_service                    ;
        // cmd.touch_100_button        =         ATM_IF_h.touch_100_button                   ;
        // cmd.touch_300_button        =         ATM_IF_h.touch_300_button                   ;
        // cmd.touch_500_button        =         ATM_IF_h.touch_500_button                   ;
        // cmd.touch_700_button        =         ATM_IF_h.touch_700_button                   ;
        // cmd.touch_1000_button       =         ATM_IF_h.touch_1000_button                  ;
        cmd.multiple_100_button     =         ATM_IF_h.multiple_100_button                ;
        cmd.multiple_1000_button    =         ATM_IF_h.multiple_1000_button               ;
        cmd.actual_deposit_value    =         ATM_IF_h.actual_deposit_value               ;
        cmd.threshold               =         ATM_IF_h.threshold                          ;
        cmd.updated_balance         =         ATM_IF_h.updated_balance                    ;
        cmd.operation_done          =         ATM_IF_h.operation_done                     ;
        cmd.error                   =         ATM_IF_h.error                              ;
        cmd.wrong_password          =         ATM_IF_h.wrong_password                     ; 
        cmd.card_out                =         ATM_IF_h.card_out                           ;     
        // write into port
        item_collected_port.write(cmd);
    end
      endtask
endclass
