# A brief Introduction to NS2

First task in NS2 is to create an instance of NS2. For every simulation there will be one AND ONLY one instance of NS2. Example:set ns [new Simulator]

The next step would be created 'Nodes'. A Node in NS represents any network device -endpoint. Computers, network enabled micro-controller, routers, etc., will all be Nodes. Example of creating a Node:set myNode1 [$ns node]

Once we have identified the network end points –like computers, routers, gateways, etc., We mustconnect these devices to each other. In NS2 this is simulated by using what is known as 'Links'. The Links  between  two  Nodes  can  either  be  unidirectional(simplex-link)  or  bidirectional  (duplex-link).Example: 

- $ns simplex-link $myNode1 $node2 1Mb 10ms DropTailr
- $ns  duplex-link $myNode1 $node2 1Mb 10ms DropTail

Propagation delay is given by the formula Delay = Distance/Speed.

The next step would be to create NS2 objects for the transport agents and add them to the nodes. The Transport Agent would primarily be TCP or UDP based. Please note that every Node MUST be associated with an Agent. In case of UDP Agents where the receiving end do not necessarily send back any Acknowledgement, then you need to add a Null Agent on the receiving end. Example of creating and adding Agents:

_Ex_
- set myUdpAgent [new Agent/UDP]
- $ns attach_agent $myNode1 $ myUdpAgent

Once the Agents have been created and added to the appropriate Nodes, the final job in creating the topology is to connect the Agents together. Even though the Nodes themselves have already been connected using Links, it is still necessary to connect the Agents together. Think of it using this analogy –Connection of Nodes to each other is the physical connection between these nodes. Connection of Agents is the software (network) connection between the sender and the receiver.  

Supposing you have added 'tcp1 agent' to one node and “tcpsink1 agent” to the second node, 

then an example would be: 
- $ns connect $tcp1 $tcpsink1 
or in case ofUDP
- $ns connect $udp1 $null1

With the above step we have completed the task of creating a network topology.

The next step would be to generate the traffic and understand how the traffic behaves in the network.

InNS2, traffic generation is done either by creating an instance of one of Application classes of NS2 
or by using a Traffic Class like CBR.

Application classes represent common applications like FTP and Telnet. CBR stands for Constant Bit Rate and it can beused to directly specify the number of packets, interval between packets, etc. 

An example of creating a CBR Traffic in which a packet is of 512 bytes and ten packets are sent every second is : 

- set mycbr [new Application/Traffic/CBR]
- $mycbr set packetSize_ 512
- $mycbr set interval_ 0.1

0.1 interval means 10 packets/second –100 packets/sec then will become .001

After the Traffic variables are created, these have to be attached to a Transport agent. The traffic object has tobe attached to a sender Agent.  Using the objects that we have created in our previous examples, the example to add the traffic object to the transport agent would be:

- $myCbr attach-agent $myUdpAgent

Once the topology is created, the next step would be to actually go ahead and run the simulation. Before we see how to do that, let's understand a few aspects related to that. 

![alt text](./images/trace_file_sample.png "Trace file sample")

Delay = propagation delay + transmission delayDelay = 10ms (declared in the link parameters) + 
{[ 40(size of packet in bytes) x 8]/1 Mbps(link data rate)}Delay = 10ms + [[40 x 8]/ 1x 106]] = .01 s +  0.00032 s = .010032 s

The above text(which we will refer to as 'trace' from now on) has to be read manually by a human and analyzed. To write the trace to a file after the simulation is completed, the following commandhas to be used:
- $ns trace-all [open "trace.out" w]

The NAM will not be able to understand the trace format and needs some additional data. NS can also generate a filewhich NAM can read. To do this, we use the following command:
- $ns namtrace-all [open "nam.out" w]

To do the actual simulation, there are three steps that mustbe done 

- Specify when the simulation of the traffic is to be started.
- Specify when the simulation of the traffic is tobe stopped.
- Specify when we need to stop the entire simulation. 

NS has an event scheduler which allows you to schedule and call any (NS)task at a specified amount of time. For example if you say $ns at 5 “puts Hello” At 5 seconds of simulation, it will simply print out the word “Hello” on the console.

e use the scheduling feature of NS to start and stop traffic. In our topology myCbr was the actual traffic. So,let's say that we want to start the traffic at 1 second and end it 50 seconds, the commands would be:

- $ns at 1  “$myCbr start” 
- $ns at 50 “$myCbr stop” 

Finally after the traffic generation is complete, you will have to stop the program itself. This is done by using:

$ns at 55 “exit 0” 

## Insight into common NS commands

### Simulator Object

This is the top most object in a NS2 simulation. It represents the main simulation itself. There will be only one instance of Simulation for the entire simulation. It is typically created using the syntax:

set <name_of_simulator_variable> [new Simulator]

You can set the name of the variable to anything that you want. eg:

set ns [new Simulator]

The simulator object has member function that can

1. Create node component
2. Create link component
3. Connect or attach Agents to components
4. Give visual parameters to components (eg. color, position, etc,.)
   _Ex_: $ns color 1 Blue
5. Specify parameters for tracing
   _Ex_: $ns namtrace-all $nf 
         $ns trace-all $nf (For non ui trace)
6. Schedule events
   _Ex_: $ns at 0.5 "$ftp start"
         $ns at 4 "$ftp stop"
    This simulates traffic that starts at 500ms and stops at 4seconds.

### Nodes

A Node in NS is created using the following syntax:
set <node_var_name> [$<ns_var_name> node]
_Ex_:set n0 [$ns node]

### Links

A Link in NS represents the physical connection between 2 Nodes. It represents a communication channel. In communication terminology, there are 3 main types of communication channels:

1. __Simplex__: A simplex communication channel only sends information in one direction. Example -a media channel or a public address system. Information can be sent from theTV channel to the subscribers but the subscribers can not send back any Information
2. __Half-Duplex__: A  Half-duplex  communication  channel  sends  information  in  both  directions.  However  only  side  of  the communicationcan be active at one time -think of it as a walky-talky. When one person is sending the second person cannot send at the same time.
3. __Full-Duplex__:A Full-duplex communication channel sends information in both directions. In this case, both sending and receiving can happen at the same time.

Syntax:

<simulator> <channel-type> <node1> <node2> <bw> <delay> <qtype> <args>

### Queues

A queue is a buffer where packets are held in transit before being recieved by the node. NS supports several types of queues. Out of which DropTail is the most commonly used type of the queue which is FIFO. Another commonly used queue is Fair Queue. The common commands that are used in conjunction with Queues:

$ns_ queue-limit <n1><n2> <limit>

_Ex_: $ns queue-limit $computer $gateway 10

Queue commands to trace queue events:

- $ns_ trace-queue <n1> <n2> <optional:file>
- $ns_ namtrace-queue <n1> <n2> <optional:file>

### Link Operations

NS2 allows you to control various parameters with respect to the links. This is done using the command

$ns simplex-link-op <n1> <n2> <option> <args> 
$ns duplex-link-op <n1> <n2> <option> <args>

This command is used to set configuration options for the links. The options are:
    color, label, orientation, or queue position.
    color - The color that should be used to display the link on the NAM animator.
    label -  A friendly name that is used to display the link in NAM
    Orientation - The position on the screen where the link is to be displayed when showing in NAM.

### Agents

Agents represent the part of the endpoints where network-layer packets are created or consumed. The different types of Agents supported by NS2 are:
1. __TCP__: This the basic TCP SENDER. There are other types of TCP Sender agents such as  TCPReno, TCPVegas, TCPFullTcp, etc.
2. __TCPSink__: This is a TCP Receiver for the basic TCP or TCPReno senders
3. __UDP__: A Basic UDP Agent
4. __Null__: An agent that discards messages. Typically used in conjunction with UDP packets, this agent provides as placeholder for receiving messages without actually processing it.
5. __RTP Agent&RTCP Agent__: These are used to simulate sending and receiving of RTP& RTCP packets.
6. __Routing Protocol Agents__

command _Ex_:

Attach an agent to a node:
- ns attach_agent <node> <agent>
- _Ex_: set mysender[new Agent/UDP]
Connect two agents:
- ns connect <sourch_agent> <destination_agent>
- _Ex_: $ns connect $tcp1 $tcpsinc1

### Traffic Generators

To generate traffic for NSSimulation, traffic generators are used. Depending on the type of traffic you could choose the category. The types of traffic generators are:

1. __CBR__ -This is Constant Bit Rate traffic. This is typically used for UDP Agents (although it can be used for TCP agents also). The way to use CBR agents is to first instantiate a CBR object and assigning various parameters:
   - set cbr0 [new Application/Traffic/CBR]
   - $cbr0 set packetSize_ 500
   - $cbr0 set interval_ 0.005
  You will then have to attach this CBR to an already created transport agent
   - $cbr0 attach-agent $udp0
2. __Common TCP Applications__ -The most common applications used in NS2 For generating TCP traffic is FTP and Telnet. Syntax to work with TCP Applications is:
   - set traffic [new Application/FTP]
   - $traffic attach-agent $tcp0
  Where $tcp0 is the TCP agent that you would have already created.

### Routing

NS2 can simulate various Routing strategies.  The strategies used in routing are :

1. __Static routing__ -Here the route is calculated once as soon as simulator script starts and the routing rules remain the same till the end
2. __Dynamic Routing__ -The route is checked periodically and advertised. If any change is required in the route, this is done automatically
3. __Manual routing__ -The Routing rules are specified manually in the tcl script. These rules can be changed midway in the scripts.

Most common types of routing in NS2

1. __DV Agent__: This agent represents the implementation of a distance-vector dynamic routing protocol. Distance-vector routing protocols measure the distance by the number of routers a packet has to pass. This is set by using:
   - $ns rtproto DV

2. __Manual__ We could specifically set routes for different nodes in the script Adding Manual routes is an advance topic and is hence left out of this guide.

3. __Static__ This is the default routing strategy and it need not be set explicitly

4. Working with route models:There are a few ways to manipulate routes. Out of these the most commonly used ones are:
   - $ns rtmodel-at 1.0 down <src_node><dest_node>
   - $ns rtmodel-at 2.0 up <src_node> <dest_node>
  The  first  command  brings  down  the  traffic  link  between  source  node  and  destination  nodeThe second one brings it up. The parameter 1.0 , 2.0, etc., is the time at which the route should be brought down or up respectively.