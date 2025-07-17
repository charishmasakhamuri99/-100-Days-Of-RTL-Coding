module demux_1x8_struct (
    input  wire       d,
    input  wire       s0, s1, s2,
    output wire      y0, y1, y2, y3, y4, y5, y6, y7
);
    wire s0n, s1n, s2n;
    not (s0n, s0);
    not (s1n, s1);
    not (s2n, s2);
    and (y0, d, s0n, s1n, s2n);
    and (y1, d, s0,  s1n, s2n);
    and (y2, d, s0n, s1,  s2n);
    and (y3, d, s0,  s1,  s2n);
    and (y4, d, s0n, s1n, s2);
    and (y5, d, s0,  s1n, s2);
    and (y6, d, s0n, s1,  s2);
    and (y7, d, s0,  s1,  s2);
endmodule
