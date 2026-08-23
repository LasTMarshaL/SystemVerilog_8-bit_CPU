`ifndef CPU_PACKAGE_SV
`define CPU_PACKAGE_SV

package CPU_Package;
    typedef struct packed {
        logic zero;
        logic carry_out;
        logic sign;
        logic overflow;
    } flags_t;
endpackage

`endif