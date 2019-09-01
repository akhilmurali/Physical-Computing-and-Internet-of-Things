# Scalar Pielined Architectures

Under ideal scenarios after the prolog is full we get one instruction per clock cycle/ throughput of one instruction per cycle (IPC) in a scalar pipeline.

### Hazards

Scenarios that prevent exection of next instruction in the designated time/clock cycle.

__Structural Hazards__: They from <span style='color: red'>resource conflicts</span> when the hardware cannot support all possible combinations of instructions in simultaneous overlapped execution.

- _Ex_: If we use von nueman arch if an instruction fetches data and an execute cycle tries to write to memory a conflict will occur.

__Control Hazards__: If there is an instruction that need to  branch is execute cycle, the processor will have to fulsh the other instructions that were fetched in the same cycle and the new instruction needs to be put into the pipeline.

__Data hazards__: Arise when an instruction depends on the result of a previous instruction. _Ex_: when an execute cycle requires more than one cycle to complete.

### Performance Improvement

- Increasing clock frequency - Super pipelining. 
- Each individual stages are broken down into sub stages.
- To increase clock frequency we split stages into sub stages.
- Clock frequency = inverse of worst case scenario.
- Why do we need buffer or stages increase?
- super pipelining requires more power.
- Increases the size of the processor.
- Increased power dissipation.
- It requires more buffers or registers between pipeline stages?
- Increase the throughput. Have more instruction in one clock cycle.

ILP- Intruction level parallelism (Used in super scalar architectures.)

### Dependencies obstructing parallelism

- True Data Dependency (RAW)(Read After Write)
- Output dependency (WAW) (Write After Write)
- Anti Dependency (WAR) (Write After Read)

RAW dependencies cannot be executed in parallel.

With certain architectural patterns/features we can have parallelism for WAW and WAR dependency.

## Super Scalar Architecture

In super scalar pipeline you need more stages

- Fetch: obtain system from the memory.
- Decode
- Dispatch: Disaptch instructions to corresponding functional units. Checks for dependency between the units.
- Issue: initiation of execution in functional units.(Add/Multiply etc) waiting station.
- Execute: perform an operation.
- Complete: result available to other instructions.
- Retire/commit: result available to outside.

They can be inorder or out of order.

Fetch/Decode/Dispatch/Complete and Retire should be inorder

Everything in between can be out of order.

### Super scalar variants

In-order Issue, In order completion.
In order issue, out of order completion.
out of order issue, out of order completion.

## Reorder Buffer

These are memory units that store the results from the functional units. Depending on the super scalar variants.

We have problem in mitigating hazards here as well.

A branch predictor unit to guide the dispatch unit to avoid hazards in further stages.

## Data Level parallelism

- Exploited using SIMD.
- A single instruction launches many data operations.
- Energy efficient
- Three variations 
    - Vector architectures
        - _Eg_ Array elements addition
            - reduction in dynamic instruction width
            - Reduction in pipelineing interlocks
    - Multimedia SIMD instruction set extensions
    - Graphic processing units

__structural level__ parallelism is achieved by MIMD architecture.

## Thread level parallelism/ Task Level parallelism

- Each processor executing a different thread or process on same or different data.
- Have multiple program counters.
- Uses MIMD model.
- Targeterd for tightly coupled shared memory multiprocessors.
- Two software models: parallel processing and request level parallelism.

- For n processors requires n threads in MIMD.

__Uniform memory access__/ __shared memory__

- small number of cores
- multiple processors can operate independently
- share a single centralized memory
- equal access time. 
- changes made by one processor are visible to other processors.

__distributed Memory__

- Require a communication network.
- local memory 
- memory is addresses independent
- no cache coherency
- Also called as NUMA (non uniform memory access.)

In data level parallelism what is meant by Multimedia SIMD instruction set extensions?