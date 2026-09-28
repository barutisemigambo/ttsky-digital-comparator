import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start Digital Comparator test")

    # Weka masharti ya mwanzo
    dut.ena.value = 1
    dut.clk.value = 0
    dut.rst_n.value = 1
    dut.uio_in.value = 0

    # Jaribio la 1: V+ (0) na V- (0) -> Vout lazima iwe 0
    dut.ui_in.value = 0b00000000
    await Timer(10, units="ns")
    assert dut.uo_out.value[0] == 0, "Test 1 Failed: 0 > 0 should be 0"

    # Jaribio la 2: V+ (1) na V- (0) -> Vout lazima iwe 1
    dut.ui_in.value = 0b00000001
    await Timer(10, units="ns")
    assert dut.uo_out.value[0] == 1, "Test 2 Failed: 1 > 0 should be 1"

    # Jaribio la 3: V+ (0) na V- (1) -> Vout lazima iwe 0
    dut.ui_in.value = 0b00000010
    await Timer(10, units="ns")
    assert dut.uo_out.value[0] == 0, "Test 3 Failed: 0 > 1 should be 0"

    dut._log.info("All tests passed successfully!")
