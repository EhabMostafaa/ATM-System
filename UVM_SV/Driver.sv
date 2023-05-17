`timescale 1ns/100ps
class Driver extends uvm_driver#(ATM_sequence_item);
  `uvm_component_utils(Driver)
  virtual ATM_IF ATM_IF_h;
  ATM_sequence_item cmd;
 
  function new(string name = "Driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual ATM_IF)::get(this, "", "ATM_IF_h", ATM_IF_h))
      `uvm_fatal("Driver: ", "No vif is found!")
    `uvm_info(get_type_name(), $sformatf("We are in Driver build phase"), UVM_LOW)
  endfunction

  virtual task run_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("We are in Driver run_phase"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("We are in run phase of driver after seq item port ") , UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("before initialize from UVM"), UVM_LOW)
    ATM_IF_h.initialize();
    `uvm_info(get_type_name(), $sformatf("after initialize from UVM"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("before reset from UVM"), UVM_LOW)
    ATM_IF_h.Reset_ATM();
    `uvm_info(get_type_name(), $sformatf("after reset from UVM"), UVM_LOW)
    forever begin  
      seq_item_port.get_next_item(cmd);
      if(cmd.mode == 1)
        begin
          `uvm_info(get_type_name(), $sformatf("enter mode started , mode =%d",cmd.mode) , UVM_LOW)
          @(posedge ATM_IF_h.clk)
          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          #10ns;

              
          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;

          #10ns;
          //withdraw_value = 'd1000 ;
          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button('d4);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;

          ATM_IF_h.cancel_button = 1'b1;
          #10ns;
          ATM_IF_h.cancel_button = 1'b0;
          #30ns;

          ATM_IF_h.card_number = 6'd1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.English_button = 1'b1 ;
          #10ns;
          ATM_IF_h.English_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd5);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd6);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;
          #10ns;
          ATM_IF_h.deposit_button = 1'b1 ;
          #10ns;
          ATM_IF_h.deposit_button = 1'b0 ;
          #10ns;

          ATM_IF_h.actual_deposit_value = 'd700 ;

          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button('d7);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;

          ATM_IF_h.cancel_button = 1'b1;
          #10ns;
          ATM_IF_h.cancel_button = 1'b0;
          #10ns;
          ATM_IF_h.card_number = 6'd2 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.English_button = 1'b1 ;
          #10ns;
          ATM_IF_h.English_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd4);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd6);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          #10ns;
          ATM_IF_h.show_balance = 1'b1 ;
          #10ns;
          ATM_IF_h.show_balance = 1'b0 ;
          #10ns;

          #300ns;

                            #5ns;
          ATM_IF_h.card_number = 6'd10;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd5);
          #10ns;
          ATM_IF_h.press_button(4'd2);
          #10ns;
          ATM_IF_h.press_button(4'd9);
          #10ns;
          ATM_IF_h.press_button(4'd8);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

                    #5ns;
          ATM_IF_h.card_number = 6'd4 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd5);
          #10ns;
          ATM_IF_h.press_button(4'd2);
          #10ns;
          ATM_IF_h.press_button(4'd9);
          #10ns;
          ATM_IF_h.press_button(4'd8);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

        end
      else if(cmd.mode == 2) begin
        `uvm_info(get_type_name(), $sformatf("balance mode started , mode =%d",cmd.mode) , UVM_LOW)
        @(posedge ATM_IF_h.clk)
                //**********   SHOW BALANCE   ****************
                                    //**********   WITHDRAW OPERATION *************
          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;

          #10ns;
          //withdraw_value = 'd1000 ;

          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button('d2);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;

          ATM_IF_h.another_service = 1'b1;
          #10ns;
          ATM_IF_h.another_service = 1'b0;
          #30ns;
 
          ATM_IF_h.deposit_button = 1'b1 ;
          #10ns;
          ATM_IF_h.deposit_button = 1'b0 ;
          #10ns;

          ATM_IF_h.actual_deposit_value = cmd.entry_int*100 ;

          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;

          ATM_IF_h.another_service = 1'b1;
          #10ns;
          ATM_IF_h.another_service = 1'b0;
          #30ns;

             ATM_IF_h.deposit_button = 1'b1 ;
          #10ns;
          ATM_IF_h.deposit_button = 1'b0 ;
          #10ns;

          ATM_IF_h.actual_deposit_value = cmd.entry_int*1000 ;

          ATM_IF_h.multiple_1000_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_1000_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;

          ATM_IF_h.another_service = 1'b1;
          #10ns;
          ATM_IF_h.another_service = 1'b0;
          #30ns;


          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;
          #10ns;

          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;

          ATM_IF_h.another_service = 1'b1;
          #10ns;
          ATM_IF_h.another_service = 1'b0;
          #30ns;
          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;
          #10ns;

          ATM_IF_h.multiple_1000_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_1000_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;

          ATM_IF_h.another_service = 1'b1;
          #10ns;
          ATM_IF_h.another_service = 1'b0;
          #30ns;

          ATM_IF_h.show_balance = 1'b1 ;
          #10ns;
          ATM_IF_h.show_balance = 1'b0 ;
          #10ns;

          ATM_IF_h.another_service = 1'b1;
          #10ns;
          ATM_IF_h.another_service = 1'b0;
          #30ns;

          //#300ns;
      end

      else if(cmd.mode == 3) begin
        `uvm_info(get_type_name(), $sformatf("deposit mode started , mode =%d",cmd.mode) , UVM_LOW)
        @(posedge ATM_IF_h.clk)
          ATM_IF_h.cancel_button = 1'b1;
          #10ns;
          ATM_IF_h.cancel_button = 1'b0;
          #30ns;
          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;
                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;
                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;
              
          ATM_IF_h.deposit_button = 1'b1 ;
          #10ns;
          ATM_IF_h.deposit_button = 1'b0 ;
          #20ns;
        ATM_IF_h.actual_deposit_value = 'd700 ;

        repeat(3) begin 
          ATM_IF_h.multiple_1000_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_1000_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button('d9);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;
        end

          ATM_IF_h.cancel_button = 1'b1;
          #10ns;
          ATM_IF_h.cancel_button = 1'b0;
          #30ns;

          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          repeat(3) begin
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          end

          ATM_IF_h.cancel_button = 1'b1;
          #10ns;
          ATM_IF_h.cancel_button = 1'b0;
          #30ns;

        #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;


              
          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;

        #10ns;
          ATM_IF_h.multiple_1000_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_1000_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button('d3);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;


      #10ns;
          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button('d2);
          #10ns; 
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;
          ATM_IF_h.cancel_button = 1'b1;
          #10ns;
          ATM_IF_h.cancel_button = 1'b0;
          #30ns;


          #5ns;
          ATM_IF_h.card_number = 6'd5 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd6);
          #10ns;
          ATM_IF_h.press_button(4'd6);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd9);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;


              
          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;
repeat(3) begin
          #10ns;
          ATM_IF_h.multiple_1000_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_1000_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button('d9);
          #10ns;
          ATM_IF_h.press_button('d11);

          
          ATM_IF_h.enter();
          #30ns;
end
          ATM_IF_h.cancel_button = 1'b1;
          #10ns;
          ATM_IF_h.cancel_button = 1'b0;
          #30ns;



      end

      else if(cmd.mode == 4) begin
        `uvm_info(get_type_name(), $sformatf("deposit mode started , mode =%d",cmd.mode) , UVM_LOW)
        @(posedge ATM_IF_h.clk)
        #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          #300ns;

#5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;
          #300ns;
          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #10ns;
          ATM_IF_h.press_button(cmd.entry_int);
          #300ns;

          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          #300ns;
          
          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;

          #300ns;

                    
          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          ATM_IF_h.deposit_button = 1'b1 ;
          #10ns;
          ATM_IF_h.deposit_button = 1'b0 ;

          #300ns;

          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          ATM_IF_h.withdraw_button = 1'b1 ;
          #10ns;
          ATM_IF_h.withdraw_button = 1'b0 ;
          #10ns;

          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button(1'd1);
          #10ns;
          ATM_IF_h.press_button('d11);
          #300ns;

                    #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          ATM_IF_h.deposit_button = 1'b1 ;
          #10ns;
          ATM_IF_h.deposit_button = 1'b0 ;
          #10ns;

ATM_IF_h.actual_deposit_value = 'd100 ;

          ATM_IF_h.multiple_100_button = 1'b1 ;
          #10ns;
          ATM_IF_h.multiple_100_button = 1'b0 ;
          
          #10ns;
          ATM_IF_h.press_button(1'd1);
          #10ns;
          ATM_IF_h.press_button('d11);
          #300ns;

          #5ns;
          ATM_IF_h.card_number = 6'b0 ;
          #10ns;
          ATM_IF_h.card_in = 1'b1 ;
          #10ns;
          ATM_IF_h.card_in = 1'b0 ;

                          //************** CHOOSE LANGUAGE ****************
          #20ns;
          ATM_IF_h.Arabic_button = 1'b1 ;
          #10ns;
          ATM_IF_h.Arabic_button = 1'b0 ;

                          //********** ENTER PASSWORD ****************
          #20ns;
          //in_password  = 'b0011_0011_0111_0000 ;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd3);
          #10ns;
          ATM_IF_h.press_button(4'd7);
          #10ns;
          ATM_IF_h.press_button(4'd0);
          #10ns;
          ATM_IF_h.press_button(4'd11);

          ATM_IF_h.enter();

          #20ns;

          ATM_IF_h.show_balance = 1'b1 ;
          #10ns;
          ATM_IF_h.show_balance = 1'b0 ;

          #300ns;



          


      end

      else 
        `uvm_info(get_type_name(), $sformatf("invalid operation mode , mode= %d",cmd.mode) , UVM_LOW)  
        seq_item_port.item_done();
    end

  endtask
  
endclass
  