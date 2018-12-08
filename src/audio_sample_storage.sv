`timescale 1ns / 1ps

module audio_sample_storage(
    input sample_SW,
    input sampling_signal,
    input mic_sample,
    
    output reg[19:0] stored_sample[49:0],
    output reg stored_data
    );
    
    reg [5:0] consecutive_cntr;
    
    always @(posedge sampling_signal) begin
        if(sample_SW) begin
            if(mic_sample == 0) begin
                stored_sample[consecutive_cntr] <= stored_sample[consecutive_cntr] + 1; 
                consecutive_cntr <= 0;
            end
            else if(mic_sample == 1) begin
                consecutive_cntr <= consecutive_cntr + 1;
            end
            
            stored_data <= 0;
        end
        else
            stored_data <= 1;
        
    end
    
endmodule
