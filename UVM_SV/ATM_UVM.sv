import uvm_pkg::*;
`include "uvm_macros.svh"
`include "ATM_IF.sv"
`include "ATM_sequence_item.sv"
`include "ATM_sequence_errors.sv"
`include "ATM_sequence_timeouts.sv"
`include "ATM_sequence_anotherService.sv"
`include "ATM_sequence_operation_toIDLE.sv"
//`include "agent2.sv"
`include "ATM_coverage.sv"
`include "scoreboard.sv"
`include "sequencer.sv"
`include "Driver.sv"
`include "monitor1.sv"
//`include "monitor2.sv"
`include "agent1.sv"
`include "ATM_env.sv"
`include "test.sv"
`include "E:/ProjectVerification_Final/RTL/ATM_TOP.v"

module ATM_UVM;

  ATM_IF ATM_IF_h ();

  ATM_TOP DUT
(
    .clk(ATM_IF_h.clk),
    .rst(ATM_IF_h.rst),
    .card_number(ATM_IF_h.card_number),
    .card_in(ATM_IF_h.card_in),
    .button_0(ATM_IF_h.button_0),
    .button_1(ATM_IF_h.button_1),
    .button_2(ATM_IF_h.button_2),
    .button_3(ATM_IF_h.button_3),
    .button_4(ATM_IF_h.button_4),
    .button_5(ATM_IF_h.button_5),
    .button_6(ATM_IF_h.button_6),
    .button_7(ATM_IF_h.button_7),
    .button_8(ATM_IF_h.button_8),
    .button_9(ATM_IF_h.button_9),
    .enter_button(ATM_IF_h.enter_button),
    .cancel_button(ATM_IF_h.cancel_button),
    //.correct_button(ATM_IF_h.correct_button),
    .withdraw_button(ATM_IF_h.withdraw_button),
    .deposit_button(ATM_IF_h.deposit_button),
    .show_balance(ATM_IF_h.show_balance),
    .another_service(ATM_IF_h.another_service),
    // .touch_100_button(ATM_IF_h.touch_100_button),
    // .touch_300_button(ATM_IF_h.touch_300_button),
    // .touch_500_button(ATM_IF_h.touch_500_button),
    // .touch_700_button(ATM_IF_h.touch_700_button),
    // .touch_1000_button(ATM_IF_h.touch_1000_button),
    .multiple_100_button(ATM_IF_h.multiple_100_button),
    .multiple_1000_button(ATM_IF_h.multiple_1000_button),
    .actual_deposit_value(ATM_IF_h.actual_deposit_value),
    .threshold(ATM_IF_h.threshold),
    .updated_balance(ATM_IF_h.updated_balance),
    .operation_done(ATM_IF_h.operation_done),    
    .error(ATM_IF_h.error),
    .card_out(ATM_IF_h.card_out),
    .Arabic_button(ATM_IF_h.Arabic_button),
    .English_button(ATM_IF_h.English_button),
    .wrong_password(ATM_IF_h.wrong_password)
);


  initial begin
    uvm_config_db#(virtual ATM_IF)::set(null, "", "ATM_IF_h", ATM_IF_h);
    $dumpfile("dump.vcd"); 
    $dumpvars;
    run_test("test");
  end
  
endmodule


  

   


    
    







