`timescale 1ns / 1ps

module audio_sample_comparator(
    input clk,
    input compare_SW,
    input [19:0] stored_sample_1[49:0],
    input [19:0] stored_sample_2[49:0],
    
    output reg compare_sample
    );
    
    reg compare;
    reg [5:0] counter;
    reg [5:0] same_sample;
    
    always @(posedge clk) begin
        if(compare_SW) begin
            if(counter < 50) begin
                if(stored_sample_1[counter] - stored_sample_2[counter] <= 5 && stored_sample_1[counter] - stored_sample_2[counter] >= -5)
                    same_sample <= same_sample + 1;
                counter <= counter + 1;
            end
        end
        else
            counter <= 0;
    end
    
    assign compare_sample = (same_sample >= 25);
    
endmodule
