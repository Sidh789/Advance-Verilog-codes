/*Write a Verilog module to safely transfer a 1-bit signal (in_src) from a source clock domain to a destination clock domain (clk_dst) using a 2-flip-flop synchronizer.
Assume the signal is level-based (not a one-cycle pulse), and it may change asynchronously with respect to clk_dst. Your synchronizer must prevent metastability and ensure the signal is safely used in the destination domain.
Requirements:
   Use only the destination clock (clk_dst) for synchronization.
   Implement a 2-flip-flop synchronizer.
   Do not include reset logic or additional combinational logic.
  Your output out_dst should be a stable version of in_src, aligned to clk_dst*/


  module sync (
  input wire clk_dst,
  input wire in_src,
  output wire out_dst
);

reg sync_ff1;
reg sync_ff2;
always@ (posedge clk_dst) begin
		sync_ff1 <= in_src;
		sync_ff2 <= sync_ff1;
end
assign out_dst=sync_ff2;
endmodule


