module alu #(
    parameter WIDTH = 4
)(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [3:0] Opcode,

    output reg [WIDTH-1:0] Result
);

wire [WIDTH-1:0] BMaybeNegative = Opcode[1]? ~B + 1: B;
wire [WIDTH-1:0] sum = A + BMaybeNegative;

always @(*) begin
    case(Opcode)
        4'b0000: Result = sum;
        4'b0001: Result = {B[WIDTH-2:0], 1'b0};
        4'b0010: Result = sum;
        4'b0011: Result = {1'b0, B[WIDTH-1:1]};
        default: Result = {WIDTH{1'b0}};
    endcase
end

endmodule
