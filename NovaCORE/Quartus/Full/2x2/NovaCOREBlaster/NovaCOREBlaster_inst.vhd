	component NovaCOREBlaster is
		port (
			c_bus_export       : out std_logic_vector(27 downto 0);        -- export
			c_clk_export       : out std_logic;                            -- export
			c_dimension_export : out std_logic_vector(3 downto 0);         -- export
			c_dimswitch_export : out std_logic;                            -- export
			c_uid_export       : out std_logic_vector(3 downto 0);         -- export
			clk_clk            : in  std_logic                     := 'X'; -- clk
			mode_export        : out std_logic;                            -- export
			reset_reset_n      : in  std_logic                     := 'X'  -- reset_n
		);
	end component NovaCOREBlaster;

	u0 : component NovaCOREBlaster
		port map (
			c_bus_export       => CONNECTED_TO_c_bus_export,       --       c_bus.export
			c_clk_export       => CONNECTED_TO_c_clk_export,       --       c_clk.export
			c_dimension_export => CONNECTED_TO_c_dimension_export, -- c_dimension.export
			c_dimswitch_export => CONNECTED_TO_c_dimswitch_export, -- c_dimswitch.export
			c_uid_export       => CONNECTED_TO_c_uid_export,       --       c_uid.export
			clk_clk            => CONNECTED_TO_clk_clk,            --         clk.clk
			mode_export        => CONNECTED_TO_mode_export,        --        mode.export
			reset_reset_n      => CONNECTED_TO_reset_reset_n       --       reset.reset_n
		);

