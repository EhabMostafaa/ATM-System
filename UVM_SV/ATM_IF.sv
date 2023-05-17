`timescale 1ns/1ns
interface ATM_IF #(parameter    P_WIDTH = 16,
                                B_WIDTH = 20, 
							    C_WIDTH = 6);
   //////////////////clock ///////////////////

bit                       clk ;
bit                       rst ;

bit      [31:0]           threshold ;

bit     [C_WIDTH-1:0]     card_number ;
bit                       card_in ;

bit                       button_0 ;
bit                       button_1 ;
bit                       button_2 ;
bit                       button_3 ;
bit                       button_4 ;
bit                       button_5 ;
bit                       button_6 ;
bit                       button_7 ;
bit                       button_8 ;
bit                       button_9 ;

bit                       enter_button   ;
bit                       cancel_button  ;
// bit                       correct_button ;

bit                       withdraw_button ;
bit                       deposit_button  ;
bit                       show_balance    ;

bit                       another_service ;

bit                       English_button  ;
bit                       Arabic_button   ;
//bit                       language ;

// bit                       touch_100_button;
// bit                       touch_300_button;
// bit                       touch_500_button;
// bit                       touch_700_button;
// bit                       touch_1000_button;
bit                       multiple_100_button;
bit                       multiple_1000_button;

//bit     [B_WIDTH-1:0]     withdraw_value       ;
bit     [B_WIDTH-1:0]     actual_deposit_value ;
//bit     [B_WIDTH-1:0]     chosen_deposit_value ;


wire  [B_WIDTH-1:0]       updated_balance; //output from ATM_FSM and also transmitted to card_handling to update user data

wire                      wrong_password ;

wire                      operation_done ;

wire                      error ;

wire                      card_out ;
   
   always #5  clk= !clk ;  

   task Reset_ATM();
        @(negedge clk);
            rst = 1'b1 ;
        @(negedge clk);
            rst = 1'b0 ;
        @(negedge clk);
            rst = 1'b1 ;
            
   endtask : Reset_ATM

  task initialize();
    begin
        clk   = 1'b0 ;

        threshold = 32'd15 ;

        button_0 = 1'b0 ;
        button_1 = 1'b0 ;
        button_2 = 1'b0 ;
        button_3 = 1'b0 ;
        button_4 = 1'b0 ;
        button_5 = 1'b0 ;
        button_6 = 1'b0 ;
        button_7 = 1'b0 ;
        button_8 = 1'b0 ;
        button_9 = 1'b0 ;

        enter_button   = 1'b0 ;
        cancel_button  = 1'b0 ;
        // correct_button = 1'b0 ;

        withdraw_button = 1'b0 ;
        deposit_button  = 1'b0 ;
        show_balance    = 1'b0 ;

        another_service = 1'b0 ;
        //withdraw_value       = 'd0;
        actual_deposit_value = 'd0;
        //chosen_deposit_value = 'd0;
    end
    endtask : initialize

    task press_button;
    input [3:0] button;
    begin
        button_0 = 1'b0 ;
        button_1 = 1'b0 ;
        button_2 = 1'b0 ;
        button_3 = 1'b0 ;
        button_4 = 1'b0 ;
        button_5 = 1'b0 ;
        button_6 = 1'b0 ;
        button_7 = 1'b0 ;
        button_8 = 1'b0 ;
        button_9 = 1'b0 ;

        case(button)
        4'd0 : button_0 = 1'b1 ;
        4'd1 : button_1 = 1'b1 ;
        4'd2 : button_2 = 1'b1 ;
        4'd3 : button_3 = 1'b1 ;
        4'd4 : button_4 = 1'b1 ;
        4'd5 : button_5 = 1'b1 ;
        4'd6 : button_6 = 1'b1 ;
        4'd7 : button_7 = 1'b1 ;
        4'd8 : button_8 = 1'b1 ;
        4'd9 : button_9 = 1'b1 ;
        default : begin
            button_0 = 1'b0 ;
            button_1 = 1'b0 ;
            button_2 = 1'b0 ;
            button_3 = 1'b0 ;
            button_4 = 1'b0 ;
            button_5 = 1'b0 ;
            button_6 = 1'b0 ;
            button_7 = 1'b0 ;
            button_8 = 1'b0 ;
            button_9 = 1'b0 ;
        end
        endcase
    end
    endtask : press_button

    task enter();
    begin
        enter_button = 1'b1 ;
        #10
        enter_button = 1'b0 ;
    end
    endtask :enter



    /////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// sequences ///////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////

sequence cancel_cardout;
    (cancel_button & card_out) || (cancel_button & !card_out&(ATM_UVM.DUT.U0_ATM_FSM.next_state == 4'b0000));
endsequence

sequence timeout_cardout;
    ATM_UVM.DUT.U0_ATM_FSM.time_out & card_out;
endsequence

sequence cancel_starttimer;
    cancel_button ##1 !ATM_UVM.DUT.U0_ATM_FSM.start_timer;
endsequence

sequence timeout_starttimer;
    ATM_UVM.DUT.U0_ATM_FSM.time_out ##1 !ATM_UVM.DUT.U0_ATM_FSM.start_timer;
endsequence

// sequence pass_checkpass; // checks that states goes from idle to check pass

//     ATM_UVM.DUT.U0_ATM_FSM.pass_en ##1 (ATM_UVM.DUT.U0_ATM_FSM.start_timer&!cancel_button) ##[0:15] ((ATM_UVM.DUT.U0_user_interface.Arabic_button|ATM_UVM.DUT.U0_user_interface.English_button) &ATM_UVM.DUT.U0_ATM_FSM.start_timer & !cancel_button) ##0 (ATM_UVM.DUT.U0_ATM_FSM.start_timer & !cancel_button)[*3] ##[1:12](ATM_UVM.DUT.U0_ATM_FSM.enter_button &ATM_UVM.DUT.U0_ATM_FSM.start_timer & !cancel_button) ##1 !ATM_UVM.DUT.U0_ATM_FSM.start_timer;
// endsequence

sequence pass_checkpass; // checks that states goes from idle to check pass
ATM_UVM.DUT.U0_ATM_FSM.pass_en ##[1:$] (ATM_UVM.DUT.U0_user_interface.Arabic_button|ATM_UVM.DUT.U0_user_interface.English_button) || cancel_button || ATM_UVM.DUT.U0_ATM_FSM.time_out ##[1:$] ATM_UVM.DUT.U0_ATM_FSM.enter_button || cancel_button || ATM_UVM.DUT.U0_ATM_FSM.time_out ##1 !ATM_UVM.DUT.U0_ATM_FSM.start_timer;
endsequence

sequence withdraw_seq;
    (!cancel_button & !ATM_UVM.DUT.U0_ATM_FSM.time_out  & ATM_UVM.DUT.U0_ATM_FSM.enter_button) || cancel_button ||ATM_UVM.DUT.U0_ATM_FSM.time_out;
endsequence

sequence deposit_seq;
    (!cancel_button & !ATM_UVM.DUT.U0_ATM_FSM.time_out  & ATM_UVM.DUT.U0_ATM_FSM.enter_button )  || cancel_button ||ATM_UVM.DUT.U0_ATM_FSM.time_out;
endsequence
sequence showbalance_seq;
    !cancel_button & !ATM_UVM.DUT.U0_ATM_FSM.time_out & (ATM_UVM.DUT.U0_user_interface.show_balance);
endsequence
sequence another_service_seq;
    !cancel_button & !ATM_UVM.DUT.U0_ATM_FSM.time_out & (ATM_UVM.DUT.U0_ATM_FSM.another_service);
endsequence
sequence operation_done_seq;
    !cancel_button & !ATM_UVM.DUT.U0_ATM_FSM.time_out & (ATM_UVM.DUT.U0_ATM_FSM.operation_done && !error);
endsequence
sequence error_idle;
    (!cancel_button & !ATM_UVM.DUT.U0_ATM_FSM.time_out & (ATM_UVM.DUT.U0_ATM_FSM.error_count_reg == 2)) ##[1:$] $rose(error&&(ATM_UVM.DUT.U0_ATM_FSM.error_count_reg == 2));
endsequence

sequence balance_equal_seq;
    (updated_balance == ATM_UVM.DUT.U0_card_handling.balance_memory[card_number]);
endsequence

sequence wrong_password_seq;
    (ATM_UVM.DUT.U0_ATM_FSM.in_password != ATM_UVM.DUT.U0_ATM_FSM.user_password);
endsequence

    /////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// properties ///////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////

property cancel_cardout_property;
    @(posedge clk) disable iff(!rst) $rose(cancel_button) |-> cancel_cardout;
endproperty

property timeout_cardout_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_ATM_FSM.time_out) |-> timeout_cardout;
endproperty

property timeout_starttimer_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_ATM_FSM.time_out) |-> timeout_starttimer;
endproperty

property cancel_starttimer_property;
    @(posedge clk) disable iff(!rst) $rose(cancel_button) |->  cancel_starttimer;
endproperty

property pass_checkpass_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_ATM_FSM.pass_en) |->  pass_checkpass;
endproperty

 property error_idle_property;
    @(posedge clk) disable iff(!rst) $rose((ATM_UVM.DUT.U0_ATM_FSM.error_count_reg == 1)) |-> ##[0:$] error_idle  ##[0:$] (ATM_UVM.DUT.U0_ATM_FSM.current_state == 0);
endproperty

 property withdraw_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.withdraw_button) |-> ##[1:$] withdraw_seq ;
endproperty
 property deposit_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.deposit_button) |-> ##[1:$] deposit_seq ;
endproperty
 property showbalance_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.show_balance) |-> showbalance_seq ;
endproperty
 property withdraw_another;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.withdraw_button) |-> ##[1:$] withdraw_seq ##[0:$] $rose(ATM_UVM.DUT.U0_ATM_FSM.another_service && (ATM_UVM.DUT.U0_ATM_FSM.next_state == 'b0100) && !error) ||$rose(cancel_button) ||$rose(ATM_UVM.DUT.U0_ATM_FSM.time_out);
endproperty

 property deposit_another;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.deposit_button) |-> ##[1:$] deposit_seq ##[0:$] $rose(ATM_UVM.DUT.U0_ATM_FSM.another_service && (ATM_UVM.DUT.U0_ATM_FSM.next_state == 'b0100) && !error) || $rose(cancel_button) || $rose(ATM_UVM.DUT.U0_ATM_FSM.time_out);
endproperty
 property showbalance_another;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.show_balance) |-> showbalance_seq ##[0:$] $rose(ATM_UVM.DUT.U0_ATM_FSM.another_service && (ATM_UVM.DUT.U0_ATM_FSM.next_state == 'b0100) &!error) || $rose(cancel_button) || $rose(ATM_UVM.DUT.U0_ATM_FSM.time_out);
endproperty

 property balance_equal_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_ATM_FSM.operation_done || card_out) |=> ##1 balance_equal_seq;
endproperty

 property withdraw_done;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.withdraw_button) |-> ##[1:$] withdraw_seq ##[0:$] $rose(ATM_UVM.DUT.U0_ATM_FSM.operation_done && !error || (ATM_UVM.DUT.U0_ATM_FSM.error_count_reg == 2)&error) || $rose(cancel_button) || $rose(ATM_UVM.DUT.U0_ATM_FSM.time_out);
endproperty

 property deposit_done;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.deposit_button) |-> ##[1:$] deposit_seq ##[0:20] $rose(ATM_UVM.DUT.U0_ATM_FSM.operation_done && !error || (ATM_UVM.DUT.U0_ATM_FSM.error_count_reg == 2)&error) || $rose(cancel_button) || $rose(ATM_UVM.DUT.U0_ATM_FSM.time_out);
endproperty

 property showbalance_done;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_user_interface.show_balance) |-> showbalance_seq |=> $rose(ATM_UVM.DUT.U0_ATM_FSM.operation_done && !error );
endproperty

property wrong_password_property;
    @(posedge clk) disable iff(!rst) $rose(ATM_UVM.DUT.U0_ATM_FSM.current_state == 3) |-> wrong_password_seq |-> wrong_password;
endproperty

    /////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// assertions ///////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////


cancel_cardout_assert: assert property(cancel_cardout_property) $display("Cancel_Cardout Assertion Succeeded"); else $error("Cancel_Cardout Assertion Failed"); //checking cancel_button
timeout_cardout_assert: assert property(timeout_cardout_property) $display("Timeout_Cardout Assertion Succeeded"); else $error("Timeout_Cardout Assertion Failed");//cheacking timer
cancel_starttimer_assert: assert property(cancel_starttimer_property) $display("Cancel_Starttimer Assertion Succeeded"); else $error("Cancel_Starttimer Assertion Failed");
timeout_starttimer_assert: assert property(timeout_starttimer_property) $display("Timeout_Starttimer Assertion Succeeded"); else $error("Timeout_Starttimer Assertion Failed");
pass_checkpass_assert: assert property(pass_checkpass_property) $display("Pass_CheckPass Assertion Succeeded"); else $error("Pass_CheckPass Assertion Failed"); //checking transition IDLE > Language > Write_Password > Check_Password
error_idle_assert: assert property(error_idle_property) $display("Error_IDLE Assertion Succeeded"); else $error("Error_IDLE Assertion Failed"); //cheacking that when 3 tries happens it returns to IDLE state
withdraw_assert: assert property(withdraw_property) $display("Withdraw Assertion Succeeded"); else $error("Withdraw Assertion Failed"); // checking withdraw operation untill enter button
deposit_assert: assert property(deposit_property) $display("Deposit Assertion Succeeded"); else $error("Deposit Assertion Failed");
showbalance_assert: assert property(showbalance_property) $display("ShowBalance Assertion Succeeded"); else $error("ShowBalance Assertion Failed");
withdraw_another_assert: assert property(withdraw_another) $display("Withdraw_Another Assertion Succeeded"); else $error("Withdraw_Another Assertion Failed"); //cheacking withdraw operation with another service
deposit_another_assert: assert property(deposit_another) $display("Deposit_Another Assertion Succeeded"); else $error("Deposit_Another Assertion Failed");
showbalance_another_assert: assert property(showbalance_another) $display("ShowBalance_Another Assertion Succeeded"); else $error("ShowBalance_Another Assertion Failed");
withdraw_done_assert: assert property(withdraw_done) $display("Withdraw_Done Assertion Succeeded"); else $error("Withdraw_Done Assertion Failed");  //checking that withdraw operation is done successfully 
deposit_done_assert: assert property(deposit_done) $display("Deposit_Done Assertion Succeeded"); else $error("Deposit_Done Assertion Failed");
showbalance_done_assert: assert property(showbalance_done) $display("ShowBalance_Done Assertion Succeeded"); else $error("ShowBalance_Done Assertion Failed");
balance_equal_assert: assert property(balance_equal_property) $display("Balance_Equal Assertion Succeeded"); else $error("Balance_Equal Assertion Failed"); //checking that balance gets updated after every deposit and withdraw
wrong_password_assert: assert property(wrong_password_property) $display("Wrong_Password Assertion Succeeded"); else $error("Wrong_Password Assertion Failed"); // cheacking wrong password sequence





endinterface : ATM_IF