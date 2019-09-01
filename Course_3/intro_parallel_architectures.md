# Parallel Architectures | Introduction

Multiple calculations are carried out simultaneously.

Simultanous use of multiple compute resources to solve a computational problem.

Allows for multiple program instructions to execute simultaneously.

Concurrency introduces a lot of issues.

_Ex_: Race conditions are an issue in parallel computation.

For parallel computing the problem set needs to be divided into discrete tasks.

Parallel computing can be done at the following levels:
    - Bit Level
    - Instruction Level
    - Data Level
    - Task Level

Traditionally, computer has been viewed as a sequential machine.

## Serial Computing

![serial computing](./images/serial_computing.png)

Serial computing is the sequential way of fetching instruction, processing it and storing the results into memory.

## Parallel Computing:

![parallel computing](./images/parallel_computing.png)

Dividing tasks into independent discrete units and working on them simulaneously to achieve higher performance.

## Amdhal's Law:

The maximum possible speedup of a program that is possible is defined by the amdhal's law. It states that the small portion of program that cannot be parallelized will limit the overall speedup that is available from making the programs parallel.

If alpha is the fraction of running time a program spends on sequntial code and P is the no. of parallel processors 1/alpha is the maximum speedup for the same program.

This puts an upper limit on the parallelism that can be achieved.

## Flynn's Taxonomy

Legend:
__IS__- Instruction stream
__DS__- Data streams

### SISD:
![sisd](./images/sisd.png)

one instruction is run on one processor and works on one data stream.

### SIMD:
![simd](./images/simd.png)

one instruction is executed on multiple data streams by different processors

### MIMD:
![mimd](./images/mimd.png)

Different instructions sequences on different data streams in parallel. It can be deterministic and non deterministic. Targets task level or thread level parallelism. The execution can be synchronous or asynchronous.