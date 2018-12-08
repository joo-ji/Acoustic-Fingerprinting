`timescale 1ns / 1ps

module main(
    input clock,
    input mic_sample,
    input reset_BTN, sample_SW1, sample_SW2, compare_SW,
    
    output sampling_signal, 
    output stored_LED1, stored_LED2, compare_LED
    );
    
    wire[19:0] stored_sample_1[49:0];
    wire[19:0] stored_sample_2[49:0];
    
    clock_generator clock_gen(clock, reset_BTN, sampling_signal);
    
    audio_sample_storage audio_storage_1(sample_SW1, sampling_signal, mic_sample, stored_sample_1, stored_LED1);
    audio_sample_storage audio_storage_2(sample_SW2, sampling_signal, mic_sample, stored_sample_2, stored_LED2);
    
    audio_sample_comparator audio_compare(clock, compare_SW, stored_sample_1, stored_sample_2, compare_LED);
    
endmodule
