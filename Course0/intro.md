# Introduction

Emebedded systems deal with desing of systems that are power and resource constrained.

Usually embedded systems are part of a larger device wherein they perform the tasks of the device.

- Dedicated computer/processor based system built for application/product
- System within a system. (A computing system which serves an application with in a system.)
- Built for only a single purpose and not reprogrammable.

### Charecteristics

- An embedded system is a special-purpose system -the computer is completely encapsulated by the device it controls. (Invisible computing)

- Unlike a general-purpose computer-an embedded system performs one or a few pre-defined tasks-usually with very specific requirements.

- Since the system is dedicated to specific tasks-design engineers can optimize it, reducing the size and cost of the product.

- Single functioned

- Complex Algorithms

- User Interface. (ususally integrated into the real world. _Ex_: Simple button)

- Tightly Constrained –Power, Cost, Memory

- Reactive and Real-Time. (Reactive because it has to respond to change in the environment and has to respond in real time.(React in a certain period of time.))

- Multi-rate.(Variety of inputs that are sampled at a different rate hence multi-rate) _Ex_: For a camera monitoring system the audio and video have different sampling rate.

_FFT_: Is a mobile phone an embedded system?

### Designing an embedded system

- What is the systems' behaviour.
- what is the input to the system.
- what is the output of the system.
- What are the constraints of the system.

### Performance Evaluation of embedded systems

- Response

- Throughput

- Reliability _Factors: MTBF,MTTR_ (Mean time between failure) & (Mean Time to Recovery)

- Maintainability

- ISP & IAP _In system programming and In Application Programming_

- Testability Debug-ability

- Evolvability

- Portability

- Time-to-prototype and Market

### Requirement Analysis

![Requirement Analysis Flow](./images/Requirement_analysis.png)

### Classification of IoT Systems

- Small-Scale Embedded System
    - Less complex hardware and software
    - Single 8/16 bit Microcontroller
    - Board level design
    - Battery-operated

- Medium-Scale Embedded System
    - 16/32 bit Microcontroller/RISC
    - DSP/ASSP/IP
    - May involve use of RTOS
    - Distributed System –bus/networks
    - Encryption/ Decryption/DCT
    - Real-Time Scheduling Algorithms

- Sophisticated Embedded System
    - Multi-processor system. 
    - Safety Critical applications.
    - H/w S/w Co-design.
    - RTOS

### Components of Embedded System

![Components of embedded systems](./images/components_es.png)

