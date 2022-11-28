
//longterm data storage 
module data_memory  
 (  
      input                         clk,  
      // address input, shared by read and write port  
      input     [15:0]               mem_access_addr,  
      // write port  
      input     [15:0]               mem_write_data,  
      input                         mem_write_en,  
      input mem_read,  
      // read port  
      output     [15:0]               mem_read_data  
 );  
      integer i;  
      reg [15:0] ram [255:0];  //256 ram registers of 16bit size 
      wire [7 : 0] ram_addr = mem_access_addr[8 : 1];  
      initial begin  
           for(i=0;i<256;i=i+1)  
                ram[i] <= 16'd2;  //initialize all memory cells in ram to 2
      end  
      always @(posedge clk) begin  
           if (mem_write_en)  
                ram[ram_addr] <= mem_write_data;  
      end  
      assign mem_read_data = (mem_read==1'b1) ? ram[ram_addr]: 16'd0;   
 endmodule  