class ATM_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(ATM_sequence_item)

  parameter  P_WIDTH = 16,
             B_WIDTH = 20, 
             C_WIDTH = 6 ;
/////////////////////////rand///////////////////////////////////
    rand     int            mode                  ;
    rand      int           entry_int           ;
  	rand bit               clk                    ;
    rand bit               rst                    ;
    rand bit [C_WIDTH-1:0] card_number            ;          
    bit                    card_in                ;               
    rand bit               button_0               ;                       
    rand bit               button_1               ;                       
    rand bit               button_2               ;                       
    rand bit               button_3               ;                       
    rand bit               button_4               ;                       
    rand bit               button_5               ;                       
    rand bit               button_6               ;                       
    rand bit               button_7               ;                       
    rand bit               button_8               ;
    rand bit               button_9               ;
    rand bit               enter_button           ;
    rand bit               cancel_button          ;
    // rand bit               correct_button         ;
    rand bit               Arabic_button          ;
    rand bit               English_button         ;
    rand bit               withdraw_button        ;
    rand bit               deposit_button         ;
    rand bit               show_balance           ;
    rand bit               another_service        ;
    // rand bit               touch_100_button       ;
    // rand bit               touch_300_button       ;
    // rand bit               touch_500_button       ;
    // rand bit               touch_700_button       ;
    // rand bit               touch_1000_button      ;
    rand bit               multiple_100_button    ;
    rand bit               multiple_1000_button   ;
    rand bit [B_WIDTH-1:0] actual_deposit_value   ;
    bit      [31:0]        threshold              ;
    rand bit [B_WIDTH-1:0] updated_balance        ;
    bit                    operation_done         ;                      
    bit                    error                  ;               
    bit                    wrong_password         ;
    bit                    card_out               ;

//constraints

constraint deposit_int_c {entry_int inside {[1:9]};}

  function new(string name = "ATM_sequence_item");
    super.new(name);
  endfunction

endclass

