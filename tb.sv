module tb;

logic clk;
logic reset;
logic request_valid;
logic [2:0] request_floor;

logic [2:0] floor_e1;
logic [2:0] floor_e2;
logic busy_e1,busy_e2;
logic door_e1,door_e2;
logic selected;

top DUT(
    clk,reset,
    request_valid,
    request_floor,

    floor_e1,floor_e2,
    busy_e1,busy_e2,
    door_e1,door_e2,
    selected
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    request_valid = 0;
    request_floor = 0;

    #10 reset = 0;

    // Floor 5
    #10 request_floor = 3'd5; request_valid = 1;
    #10 request_valid = 0;

    // Floor 2
    #50 request_floor = 3'd2; request_valid = 1;
    #10 request_valid = 0;

    // Floor 7
    #50 request_floor = 3'd7; request_valid = 1;
    #10 request_valid = 0;

    // Floor 1
    #50 request_floor = 3'd1; request_valid = 1;
    #10 request_valid = 0;

    #200 $finish;
end

endmodule
