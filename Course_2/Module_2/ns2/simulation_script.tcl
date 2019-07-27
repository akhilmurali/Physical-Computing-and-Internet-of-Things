#sample script for network simulation in tcl
set ns [new Simulator] 

set tr [open "out.tr" w] 
$ns trace-all $tr

set ftr [open "out.nam" w]

$ns namtrace-all $ftr

set n0 [$ns node]
$n0 shape box
$n0 color green
set n1 [$ns node]
$n1 shape box
$n1 color red
$ns duplex-link $n0 $n1 2Mb 4ms DropTail

#Attach a transport layer agent
set tcp1 [new Agent/TCP]
set sink [new Agent/TCPSink]

$ns attach-agent $n0 $tcp1
$ns attach-agent $n1 $sink

$ns connect $tcp1 $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp1

proc finish { } {
    global ns tr ftr
    $ns flush-trace
    close $tr
    close $ftr
    exec nam out.nam & 
    exit
}

#event specification
$ns at 0.1 "$ftp start"
$ns at 2.0 "$ftp stop"

$ns at 2.1 "finish"

$ns run