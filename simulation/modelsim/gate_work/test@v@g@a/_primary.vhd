library verilog;
use verilog.vl_types.all;
entity testVGA is
    port(
        clk_50          : in     vl_logic;
        sw_r            : in     vl_logic;
        sw_g            : in     vl_logic;
        sw_b            : in     vl_logic;
        sw_p1           : in     vl_logic;
        sw_p2           : in     vl_logic;
        sw_p3           : in     vl_logic;
        sw_cc           : in     vl_logic;
        sw_cp           : in     vl_logic;
        clk             : out    vl_logic;
        pixel           : out    vl_logic_vector(2 downto 0);
        hsync_out       : out    vl_logic;
        vsync_out       : out    vl_logic
    );
end testVGA;
