Time/program = Time/cycle * cycles/inst * inst/program

CISC - High level operation
RISC - Low level operation


### Instruction pipelines

RISC uses instruction pipelining:

ADD R2, R1, R3
SBR R2, R3, R2
STR R2, b

Reverse operation

Above operation takes 9 cycles to execute.

Instruction pipelining will help reduce time by running non independent operations simultaneously.

Prologue(2 cycle) and epilogue(2 cycles) of a pipeline. This becomes insignificant after a point.

Pipeline Hazards:
1. Data hazards - Extra cycles for an instruction
2. Structural harad - Branched instruction

Types of GPP

- uC
    - Processor has limited capability
    - Limited I/O functions

Design Decesions

- RISC vs CISC
- uC or uP
- uP
    - computation heavy.

CISC - Large memory and I/O operation (Allows for working directly with memory locations.)
RISC - used with intensive computations have to be carried out. (Allows for 1 computaion per cycle.)

## Embedded Processor

For __GPP__ to Qualify as an embedded processor it should have
    - Realtime operation optimized. (Interrupr)
    - supports atomic operations.

Interrupt jitter is the metric that defines what is the latency with a system.

Atomic:
    - Read, modify and writing to a memory location as one unit.
    - This ensures that two processes cannot simultaneously modify a memory location.

__DSP__
    - uP Core + MAC(Multiple and Accumulate unit)

__ASSP__ (Application specific system processors)
    - Specific tasks such as MPEG coding, I2 Chip, TCP/UDP -- IP, ARP, Ethernet 10/100
    - Faster than a software solution
    - RTOS less solution
        - IIM 700 serial -- to -- Ethernet converter
    - ASSP is used as an additional processing unit -- instead of embedded s/w AES.(accelerated embedded system)
Chips that are capable of implement that can be done in software in a hardware unit.
This helps accelerate the speed of those set of tasks.

ASSP is also called as an accelerated embedded system.

__Mutli-processor systems__

- speec and signal compressing and coding
- Communication unit
- Keyboard display I/F
- Image processing

Multiple processors are used when a single processor cannot meed the needs of different tasks.

Used when a single processor cannot meet the needs of different tasks.

Factors taken Into account during processor selection

- Instruction ser
- size of the processor
- Colck frequency in MHz
- Processing speed in MIPS
- Dhrystone -- bench mark program (used to compare different architectures)

We can use MIPS to compare the same architecute of microprocessors.

1 MIPS = 1757 Dhrystones - VAX 11/780
 - Instrucitons per cycle.
 - Intruction per program.

### Memory Types

RAM
    - internal/external (of CPU silicon)
    - Flash memory/EEPROM
        - External or Internal
    - System Ports
    - ROM/PROM
    - Cache

memory ususally can be a bottleneck to a powerful cpu.

Memory Organization

1. von Nuemannn architecture
2. Harvard Architecutre
    - Seperate instruction and data memory.
    - Multiple buses to manage the same.

Memory types:
1. RAM(Scratch pad)
    - SRAM
    - DRAM
2. Hybrid(Application data)
    - EEPROM
    - NVRAM
    - Flash
3. ROM(Application code)
    - EPROM
    - EROM
    - Allows for a bulk erase.

 - ROM
 - EEPROM
 - SRAM
 - DRAM
 - DRAM - FPM (Paging)
 - SDRAM (Synchronous Data Ram) (RAM with a clock.)
 - SIMMs (Single inline memory modules)
 - DIMMs (Dual inline memory modules) DDR3
 - SODIMMs (Small outline DIMMS) (used inside laptops)
 - PCMIA (SD cards/ additional memory)


Available in Embedded system
 - ROM
 - EEPROM
 - SRAM
  - PCMIA (SD cards/ additional memory)

### Dynamic Memory Allocation (used in non real time systems)

Multiple Programs in memory
 - Swapping
 - Overlays

### Memory Map
- Memory Faults
    - Stuck at 0
    - Stuck at 1
- Bridge
    Two data or address lines shorted with each other.
- Signature Analysis - ROM (This is checked to ensure that the ROM is functional.)

Application abstains from running unless the signature analysis runs successfully.

### Cache memory

Registers cannot be very large. So cache is the next best option for fast action.

Cache memory is costly (usually like 64K)

The cache is fast because it is spatially and temporally close to the CPU.

L1 Cache - Internal to the CPU
L2 Cache - External to the CPU

If data is not present in L1 and L2 it is looked in the memory.


with L1 cache only:
tav = h1 * tL1 + (1-h)tmain

With L1 and L2 cache:
tav = h1tL1 + h2tL2 + (1-h1-h2)tmain

Cache Memory:

Cache Miss
1. Compulsory Miss/Cold Miss - Happens on system boot
2. Capacity Miss - Capacity of cahche is limiting - Cache is full in this case
3. Conflict Miss - Two things are mapped to the same location. This happens when the cache memory is not full.

cache organization

- Direct mapped.
- Set associative mapped.

## Direct Mapped Cache

Memory is broken into pages and page size is divided into blocks.

_Ex_: Block 0 of cache all pages are mapped to Block 0 of cache.


