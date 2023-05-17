class ATM_coverage extends uvm_subscriber#(ATM_sequence_item);
 `uvm_component_utils(ATM_coverage)
 uvm_analysis_imp #(ATM_sequence_item,ATM_coverage) analysis_export;
 ATM_sequence_item cmd;


   covergroup Number_Buttons_cg     ; 
      button_0                : coverpoint cmd.button_0                 ;
      button_1                : coverpoint cmd.button_1                 ;
      button_2                : coverpoint cmd.button_2                 ;
      button_3                : coverpoint cmd.button_3                 ;
      button_4                : coverpoint cmd.button_4                 ;
      button_5                : coverpoint cmd.button_5                 ;
      button_6                : coverpoint cmd.button_6                 ;
      button_7                : coverpoint cmd.button_7                 ;
      button_8                : coverpoint cmd.button_8                 ;
      button_9                : coverpoint cmd.button_9                 ;
   endgroup       

   covergroup Functional_Buttons_cg ;
      enter_button            : coverpoint     cmd.enter_button         ; 
      cancel_button           : coverpoint     cmd.cancel_button        ;
      //correct_button        : coverpoint     cmd.correct_button     ;
      Arabic_button           : coverpoint     cmd.Arabic_button        ;
      English_button          : coverpoint     cmd.English_button       ;
      withdraw_button         : coverpoint     cmd.withdraw_button      ;
      deposit_button          : coverpoint     cmd.deposit_button       ;
      show_balance            : coverpoint     cmd.show_balance         ;
      another_service         : coverpoint     cmd.another_service      ;
   endgroup

   covergroup money_button_cg       ;
      // touch_100_button        : coverpoint   cmd.touch_100_button       ;
      // touch_300_button        : coverpoint   cmd.touch_100_button       ;
      // touch_500_button        : coverpoint   cmd.touch_100_button       ;
      // touch_700_button        : coverpoint   cmd.touch_100_button       ;
      // touch_1000_button       : coverpoint   cmd.touch_100_button       ;
      multiple_100_button     : coverpoint   cmd.multiple_100_button    ;
      multiple_1000_button    : coverpoint   cmd.multiple_1000_button   ;
      //actual_deposit_value    : coverpoint   cmd.actual_deposit_value   ;
   endgroup

   covergroup  flags_cg             ;
      operation_done          : coverpoint   cmd.operation_done         ;
      error                   : coverpoint   cmd.error                  ;
      wrong_password          : coverpoint   cmd.wrong_password         ;
      card_in                 : coverpoint   cmd.card_in                ;
      card_out                 : coverpoint  cmd.card_out               ;
   endgroup
   


   function void build_phase (uvm_phase phase);
      `uvm_info(get_type_name(), $sformatf("We are in ATM_coverage build phase"), UVM_LOW)
      super.build_phase(phase);
      cmd= ATM_sequence_item::type_id::create("cmd");
   endfunction

   

   function new (string name = "ATM_coverage", uvm_component parent);
      super.new(name, parent);
      //G1 = new();
      Number_Buttons_cg = new();
      Functional_Buttons_cg = new();
      money_button_cg = new();
      flags_cg = new();
      analysis_export = new("READ",this);
   endfunction : new



 

   function void write(ATM_sequence_item t);
      cmd=t;
      // card_in=t.card_in;
       //G1.sample();
      Number_Buttons_cg.sample();
      Functional_Buttons_cg.sample();
      money_button_cg.sample();
      flags_cg.sample();
   endfunction : write

endclass : ATM_coverage