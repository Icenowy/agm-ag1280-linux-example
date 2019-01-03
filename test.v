module test(
	input osc_in,
	output osc_out,
	output led
);

assign osc_out = ~osc_in;

wire clk = osc_in;

wire new_clk;

clock_divider #(
	.pFactor(24000000)
) clkdiv(clk, 1, new_clk);

reg led;

always @(posedge new_clk) begin
	led = ~led;
end

endmodule
