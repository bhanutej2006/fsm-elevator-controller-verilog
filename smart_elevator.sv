module elevator(
    input logic clk,
    input logic reset,
    input logic start,
    input logic [2:0] target_floor,

    output logic [2:0] current_floor,
    output logic busy,
    output logic door
);

logic [2:0] target;

always_ff @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        current_floor <= 3'd0;
        target <= 3'd0;
        busy <= 0;
        door <= 0;
    end

    else
    begin
        if(start && !busy)
        begin
            target <= target_floor;
            busy <= 1;
            door <= 0;
        end

        else if(busy)
        begin
            if(current_floor < target)
                current_floor <= current_floor + 1;

            else if(current_floor > target)
                current_floor <= current_floor - 1;

            else
            begin
                busy <= 0;
                door <= 1;
            end
        end

        else
            door <= 0;
    end
end

endmodule
