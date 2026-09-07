module top(
    input logic clk,
    input logic reset,
    input logic request_valid,
    input logic [2:0] request_floor,

    output logic [2:0] floor_e1,
    output logic [2:0] floor_e2,
    output logic busy_e1,
    output logic busy_e2,
    output logic door_e1,
    output logic door_e2,
    output logic selected
);

logic start1,start2;

scheduler SCH(
    floor_e1,
    floor_e2,
    busy_e1,
    busy_e2,
    request_floor,
    selected
);

always_comb
begin
    start1 = 0;
    start2 = 0;

    if(request_valid)
    begin
        if(selected==0 && !busy_e1)
            start1 = 1;

        else if(selected==1 && !busy_e2)
            start2 = 1;
    end
end

elevator E1(
    clk,reset,start1,request_floor,
    floor_e1,busy_e1,door_e1
);

elevator E2(
    clk,reset,start2,request_floor,
    floor_e2,busy_e2,door_e2
);

endmodule
