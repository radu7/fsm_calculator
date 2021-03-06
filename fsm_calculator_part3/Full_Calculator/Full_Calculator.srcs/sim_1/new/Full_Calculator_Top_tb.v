`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2018 03:45:28 PM
// Design Name: 
// Module Name: Full_Calculator_Top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_Calculator_Top_tb;

reg [3:0] X_tb, Y_tb;
reg go_tb, clk_tb, rst_tb;
reg [2:0] F_tb;
wire [3:0] Out_H_tb, Out_L_tb;
wire done_tb;
wire [3:0] cs;

Full_Calculator_Top FCALC (
    .X(X_tb), .Y(Y_tb),
    .F(F_tb),
    .clk(clk_tb), .Go(go_tb), .rst(rst_tb),
    .Out_H(Out_H_tb), .Out_L(Out_L_tb),
    .done(done_tb),
    .cs(cs) 
    );
    
    
task automatic tick;
    begin
        clk_tb = 1'b1;
        #50;
        clk_tb = 1'b0;
        #50;
    end
endtask

task automatic display;
    begin
        $display("Out_H_tb = %0d", Out_H_tb);
        $display("Out_L_tb = %0d", Out_L_tb);
        $display("Current State = %0d", cs);
    end
endtask

integer i = 0;
initial
    begin
        X_tb = 4'd3;
        Y_tb = 4'd2;
        clk_tb = 1'b0;
        go_tb = 1'b0;
        clk_tb = 1'b0;
        rst_tb = 1'b0;
        
        
        F_tb = 3'b000;
        go_tb = 1'b1;
        
        tick;
        tick;
        tick;
        $display("Add");
        while (done_tb == 1'b0)
            begin
                tick;
                //display;
            end
            display;
            
        go_tb = 1'b0;
        tick;
        go_tb = 1'b1;
        F_tb = 3'b001;
        $display("Subtract");
        while (done_tb == 1'b0)
            begin
                tick;
                //display;
            end
            
            display;
            
        go_tb = 1'b0;
        tick;
        go_tb = 1'b1;
        F_tb = 3'b010;
        $display("Mult");
        while (done_tb == 1'b0)
            begin
                tick;
                //display;
            end
            display;
            
        go_tb = 1'b0;
        tick;
        go_tb = 1'b1;
        F_tb = 3'b011;
        $display("Divide");
        while (done_tb == 1'b0)
            begin
                tick;
                //display;
            end
        display;
            
            
        go_tb = 1'b0;
        tick;
        go_tb = 1'b1;
        F_tb = 3'b100;
        $display("Increment");
        while (done_tb == 1'b0)
            begin
                tick;
                //display;
            end
        display;
        
        go_tb = 1'b0;
        tick;
        go_tb = 1'b1;
        F_tb = 3'b101;
        $display("Decrement");
        while (done_tb == 1'b0)
            begin
                tick;
                //display;
            end
        display;
            
        go_tb = 1'b0;
        tick;
        go_tb = 1'b1;
        F_tb = 3'b110;            
        $display("Square");
        while (done_tb == 1'b0)
            begin
                tick;
                //display;
            end
            display;
        
        
            

        //tick;
//        for (i = 0; i < 100; i = i + 1)
//            begin
//                tick;
//                display;
//            end
        
        
    
    $finish;
    end
endmodule
