module alu #(
    parameter WIDTH = 4
)(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [1:0] Opcode,

    output reg [WIDTH-1:0] Result
);

wire [WIDTH-1:0] BMaybeNegative = Opcode[1]? ~B + 1: B;
wire [WIDTH-1:0] sum = A + BMaybeNegative;

always @(*) begin
    case(Opcode)
        2'b00: Result = sum;
        2'b01: Result = {B[WIDTH-2:0], 1'b0};
        2'b10: Result = sum;
        2'b11: Result = {1'b0, B[WIDTH-1:1]};
        default: Result = {WIDTH{1'b0}};
    endcase
end

endmodule
