create_clock -period 20 {get_ports clk}
create_clock -period 100000 {get_ports b2v_inst7|debounce:b2v_inst40|result}