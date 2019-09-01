# ARM architecture

- Power efficiency
- RISC based architecture.
- 32 bit registers, ALU (data path), bus interface (started with this)
- Soft IP or Hard IP
- ACRON RISC machine/Advanced RISC machine

SOFT IP
- soft core is obtained as verilog/ system code. This is modifiable by the commpany that sources the IP.

HARD IP

The IP is given as a netlist. Thus, modifications are not possible.

ARM architecture ==  Instruction set architecture of the soft or hard core.

- Details of programmers model- instruction set, user visible registers, exception model.

ARM Processor

- Developed using one of ARM Architecture.
- Implementation details such as timing information, pipeline etc.

_Eg:_ 
__Architecture__ -- ARMv4T
__Processor__ -- ARM7TDMI
__Microcontroller__ -- LPC2378

ARM Architecture Evolution

### ARMv4/v4T

Has both 32 bit and 16 bit instruction set(thumb)
thumb instruction set maps to another 32 bit instruction.

How is it efficient if a 16 bit instruction maps into a 32 bit instruction. Won't we end up storing 48 bit instruction anyways as underneath we need to fetch the 32 bit instruction?

ARM7TDMI is based on ARMv4

### ARMv5/5vE

Used for DSP operations. Better MAC operations

There need to be saturation version of the operations. 
QADD: Saturated version of Add operations 

Popular Processor: ARM9926EJ-S

Jazzelle- Support for Java byte code.

Have two states, Jazzle, thumb states.

jazzle unit converts byte code into ARM instruction.

How did we arrive at 134byte code restriction for conversion from bytecode to ARM instruction conversion?

### ARMv6

Eg: Cortex-M0, M1

SIMD is an important enhancement.

### ARMv7

- ARMv7-M (Cortex M)
  - Meant for microcontrollers
  - Cost sensitive solutions for deterministic controller applications
  - Applications include microcontrollers, mixed signal devices, smart sensors, automotive body electronics and airbags.

 SecureCore(silht variant of M series)
    - High security applications- counter measures against side channel attacks and fault injections.
    - smart cards, electronic ticketing, advanced payment systems etc.

- Cortex R series
    - real time applications
    - Low latency, high reliability
    - Applications include automotive braking systemm powertrains etc.
- Cortex A series
    - High performance processors capable of full operating system support.
    - applications include smartphones, digital TV, smart books, home gateways etc.

## ARMv8

- ARMv8 - R
    - used for realtime applications.

- ARMv8 - A
    - 64 bit instruction set in addition to 32 bit instruction set.

Excecution Modes
- Aarch 32 bit version
    - supports two 32 bit instruction sets,
        the A32 and the T32(thumb 2 instrcution set)(no state switcing is required) instruction sets.
    - The processor can run programs developed for previous ISA versions. 
    - Is backward compatible.
- Aarch 64 bit version
    - It supports a single 64 bit instruction set called A64
    - uses 32 bit instruction encodings.
    - 64 bit data operations are possible.

### Neon

NEON is an advanced SIMD processing unit.

Apply a single instruction to many pieces of data at one time in parallel.

Extremely helpful for media processing such as image/audio/video filters and codec's

Thoguht of as a co-processor.

### Trust Zone:
    - system wide approach to system security for ARM cortex based processor sytesms.
    - Encompasses memory, software, bus transactions, interrupts and peripherals within the SoC.
    - Starts at the hardware level by creating two environments that can run simultaneously on a single core: a secure world and a not as secure world.

So, in software we have security in terms of public private key encryption and signature verification etc, but in hardware if any portion is compromised how do you think the secure spaces/ trusted zones would remain unaffected? Can you draw some parallels with the software here if that would be relavent.