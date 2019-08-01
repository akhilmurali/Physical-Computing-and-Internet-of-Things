# NSEXPERIMENT 1 QUESTION 2

# Packet size = 640 * 480 * 24 = 7372800 = 7.32728 Mb
# Packet size limit is 256 bytes =  2048 bits
# 8bit dst address 8bit src address data 32bit CRC.
# While here raw data is being sent –the bandwidth requirement is kept same as the data rate 
#–if the data is being encoded and modulated –based on the encoding and modulation techniques the 
#data rate will change.

# No of packets that need to be sent per second would be 7372800/(256-48) = 35446.153 packets

#Data Rate = 256 bits * no.of packets per second.(35446.153)  = 9.074 Mbps == Approximately 10 Mbps

## NS 2 code for the condition:
set ns [new Simulator]
set nf [open out.nam w]
$ns namtrace-all $nf
proc finish {} {
    global ns nf  
    $ns flush-trace
    close $nf
    exec nam out.nam 
    &exit 0
}
set n0 [$ns node]
set n1 [$ns node]
$ns duplex-link $n0 $n1 10Mb 10ms DropTail
# Create an agent object and attach it to a variable:
# Agent are also referred to as traffic sources.
# Agents are basic objects
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0 
# The created agent is attached to node n0
set cbr0 [new Application/Traffic/CBR]  
# here we create a constant bit rate traffic generator.
$cbr0 set packetSize_ 256
$cbr0 set interval_ 0.282 * 10^-6 
$cbr0 attach-agent $udp0 
#Attach the cbr traffic generator to udp traffic agent.

set null0 [new Agent/Null] 
$ns attach-agent $n1 $null0

$ns connect $udp0 $null0

$ns at 0.5 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"

$ns at 5.0 "finish"

$ns run

# Both CBR and FTP are traffic generators not traffic agents. Traffic agents are like UDP and TCP. 
# Their main difference is as they said: FTP uses TCP for transferring packet and CBR uses UDP for transferring packet. 
# And Note that: As its known the request through TCP has an Ack while the one through UDP has no ACK and in Network simulation 
# the same scenario works if you are familiar with it.
