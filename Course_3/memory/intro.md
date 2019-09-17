# Memory Requirements for IoT

- Power consumption and performance (traditional DRAM)
- Volatile and non volatile memory (SRAM, ROM)
- Form factor and cost (silicon area need to be minimized)
- Reliability (External flash memory NOR/NAND)
    - Supports temperature support.
    - have low cost and high density.
    - low standby power consumption.
- Data transfer speed.
    - emmc memory (flash controller moved into the memory to reduce management complexity)
    - UFS 600MB/s (30% to 55% power reduction.)
- Embedded or external 
    - MTP(multiple time programmable) vs OTP(one time programmable) (Finds use in networking and data application)
- Field programmable On/off site 

## Characteristics of Volatile and non volatile memory (NVM)

Memories are 2D array of cells. Each cell stores 1 bit(0 or a 1)

![memory addressing](./images/memory_addressing.png)
The rows are selected via the row decoder. Each row stores a word.

## Volatile Memory

SRAM - Static memory. It holds the data as long as the power is supplied.

Memory organization:
![sram organization](./images/sram_organization.png)

__Ex__: If we have a memory unit of size 8K * 32 we would have a memory size of ~ 2<sup>18</sup>.

Considering a word to be of size 32 bits long to address this memory we would need a 

Row decoder of size: __9 * 512__ and
column decoder/MUX of size __4 * 16__.

The 9 * 512 decoder maps to each row in the 2d array and 4 * 16 decoder selects each 32 bit long word in a selected row.

The defacto storage unit in SRAM is a six transistor cell. It has two access transistors, one word line(WL) and one Bit line(BL).

The row addressing is called as the word line and the column addressing is referred to as the bit line.

![sram](./images/sram.png)

DRAM has higher packing density than the SRAM. It only has one transistor. But, the stored charge needs a refresh cycle.

![dram](./images/dram.png)

## Non volatile Memory

Embedded flash is the most reliable and mature nvm.

//image:


read more on the following
Phase change memory

spin torque transfer
used in hard drives
- magnetic tunnel junction

- resistive memory
   - faster write times
   - High resistive to low resistive state transition to transfer data.

- Conductive Bridging Random Access Memory