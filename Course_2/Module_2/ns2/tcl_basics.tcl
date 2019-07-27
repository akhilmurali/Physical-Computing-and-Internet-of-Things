set a 0
# while loop implementation in tcl
while { $a < 101 } {
    puts $a
    set a [expr $a + 2]
}

#if else implementation in tcl
if [expr $a > 100] {
    puts "a is a great number"
} else {
    puts "a isn't so great afterall"
}

#for loop implementation in tcl
for {set a 1} {$a < 11} {incr a} {
    puts $a
}

# array implementation  in tcl
set b(0) 21
set b(1) 22
set b(2) 23
set b(3) 24

puts $b(0)
puts $b(1)

set salary("max") "100K"
set salary("JRANGANATHAN") "130K"

puts $salary("JRANGANATHAN")


# procedure a.k.a functions  in  tcl
proc max {a b} { 
    if { $a > $b} {
        puts "a is greater than b"
    } else {
        puts "b is greater than a"
    }
}

max 23 45 
#The procedures are not hoisted in most cases, hence 
#the invocation needs to come after the definition.

# procedure call with a return value.
proc sum {a  b c} {
    set c [expr $a + $b + $c]
    return $c
} 

set x [sum 10 30 50]
puts $x

# returning a list from a command:
proc fun {} {
    return [list 12 23 45 67]
}

puts [fun] 

# Global and local variable creation in NS
set x 10

proc localproc {} {
    global x
    set x 12
}

puts $x
localproc
puts $x

# File handling in tcl
#File modes: r w a r+ w+
set fh [open "one.txt" w+]

puts $fh "Welcome to ns2"

close $fh

# read from a file:
set fh [open "one.txt" r]
gets $fh d
puts $d

# Object oriented tcl programming:
Class student
student obj
obj set name 'anne'
obj set roll 12354
obj set city "singapore"

puts [obj set name]
puts [obj set roll]
puts [obj set city]

# Defining a function in a class.
student instproc show {} { #instaproc is  a key word
    $self instvar name roll city # variables of the invoking object
    puts "name: $name"
    puts "city: $city"
    puts "roll: $roll"
}

obj show

#Constructor in tcl
student instproc init {} {
    $self instvar name roll city
    set name "default"
    set roll 0
    set city "delhu"
}

student obj1
obj1 show


#Destructor in tcl

student instproc destroy {} {
    
}

obj1 destroy