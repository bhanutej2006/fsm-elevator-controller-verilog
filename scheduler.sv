module scheduler(
    input logic [2:0] floor1,
    input logic [2:0] floor2,
    input logic busy1,
    input logic busy2,
    input logic [2:0] request_floor,

    output logic select
);

logic [2:0] d1,d2;

always_comb
begin
    d1 = (floor1 > request_floor) ? floor1-request_floor : request_floor-floor1;
    d2 = (floor2 > request_floor) ? floor2-request_floor : request_floor-floor2;

    if(!busy1 && busy2)
        select = 0;

    else if(!busy2 && busy1)
        select = 1;

    else if(d1 <= d2)
        select = 0;

    else
        select = 1;
end

endmodule
