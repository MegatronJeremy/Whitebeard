create_clock -period 20 {get_ports sclk}
create_clock -period 100000 {get_ports debounce:inst40|result}