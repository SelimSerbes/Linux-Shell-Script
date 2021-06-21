#!/bin/sh

### NOTE : Use x instead of * in input file.

while read line;
do

#ADDITION - BINARY
if echo $line | grep -q 0b && echo $line | grep -q +;
then

first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0b//g')
third=$(echo $line | awk 'NR==1{print $3}' | sed 's/\0b//g')

result=$(echo "ibase=2;obase=2; $first + $third" | bc)
if [ $result -lt 0 ]
then
result=$((result*-1))
echo "0b$result (NEGATIVE)" >> $2
else
echo "0b$result (POSITIVE)" >> $2
fi

#SUBRACTION - BINARY
elif echo $line | grep -q 0b && echo $line | grep -q -;
then

first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0b//g')
third=$(echo $line | awk 'NR==1{print $3}' | sed 's/\0b//g')

result=$(echo "ibase=2;obase=2; $first - $third" | bc)
if [ $result -lt 0 ]
then
result=$((result*-1))
echo "0b$result (NEGATIVE)" >> $2
else
echo "0b$result (POSITIVE)" >> $2
fi

#MULTIPLICATION - BINARY
elif echo $line | grep -q 0b && echo $line | grep -q x; 
then

first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0b//g')
third=$(echo $line | awk 'NR==1{print $3}' | sed 's/\0b//g')

result=$(echo "ibase=2;obase=2; $first * $third" | bc)
if [ $result -lt 0 ]
then
result=$((result*-1))
echo "0b$result (NEGATIVE)" >> $2
else
echo "0b$result (POSITIVE)" >> $2
fi

#DIVISION - BINARY
elif echo $line | grep -q 0b && echo $line | grep -q /; 
then

first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0b//g')
third=$(echo $line | awk 'NR==1{print $3}' | sed 's/\0b//g')

result=$(echo "ibase=2;obase=2; $first / $third" | bc)
if [ $result -lt 0 ]
then
result=$((result*-1))
echo "0b$result (NEGATIVE)" >> $2
else
echo "0b$result (POSITIVE)" >> $2
fi

#REMAINDER - BINARY
elif echo $line | grep -q 0b && echo $line | grep -q %; 
then

first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0b//g')
third=$(echo $line | awk 'NR==1{print $3}' | sed 's/\0b//g')

result=$(echo "ibase=2;obase=2; $first % $third" | bc)
if [ $result -lt 0 ]
then
result=$((result*-1))
echo "0b$result (NEGATIVE)" >> $2
else
echo "0b$result (POSITIVE)" >> $2
fi

#ADDITION - HEXADECIMAL
elif echo $line | grep -q 0x && echo $line | awk 'NR==1{print $2}' | grep -q +;
then

first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(($first + $third))
if [ $result -lt 0 ]
then
result=$((result * -1))
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (NEGATIVE)" >> $2
else
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (POSITIVE)" >> $2
fi

#SUBTRACTION - HEXADECIMAL
elif echo $line | grep -q 0x && echo $line | awk 'NR==1{print $2}' | grep -q -;
then

first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(($first - $third))
if [ $result -lt 0 ]
then
result=$((result * -1))
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (NEGATIVE)" >> $2
else
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (POSITIVE)" >> $2
fi

#MULTIPLICATION - HEXADECIMAL
elif echo $line | grep -q 0x && echo $line | awk 'NR==1{print $2}' | grep -q x;
then

first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(($first * $third))
if [ $result -lt 0 ]
then
result=$((result * -1))
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (NEGATIVE)" >> $2
else
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (POSITIVE)" >> $2
fi

#DIVISION - HEXADECIMAL
elif echo $line | grep -q 0x && echo $line | awk 'NR==1{print $2}' | grep -q /;
then

first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(($first / $third))
if [ $result -lt 0 ]
then
result=$((result * -1))
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (NEGATIVE)" >> $2
else
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (POSITIVE)" >> $2
fi

#REMAINDER - HEXADECIMAL
elif echo $line | grep -q 0x && echo $line | awk 'NR==1{print $2}' | grep -q %;
then

first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(($first % $third))
if [ $result -lt 0 ]
then
result=$((result * -1))
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (NEGATIVE)" >> $2
else
result2=$(echo "ibase=10;obase=16; $result" | bc)
echo "0x$result2 (POSITIVE)" >> $2
fi

else
#ADDITION - DECIMAL
if echo $line | awk 'NR==1{print $2}' | grep -q +;
then
first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(echo $((first + third)))
echo $result >> $2

#SUBRACTION - DECIMAL
elif echo $line | awk 'NR==1{print $2}' | grep -q -;
then
first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(echo $((first - third)))
echo $result >> $2

#MULTIPLICATION - DECIMAL
elif echo $line | awk 'NR==1{print $2}' | grep -q x;
then
first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(echo $((first * third)))
echo $result >> $2

#DIVISION -DECIMAL
elif echo $line | awk 'NR==1{print $2}' | grep -q /;
then
first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(echo $((first / third)))
echo $result >> $2

#REMAINDER - DECIMAL
elif echo $line | awk 'NR==1{print $2}' | grep -q %;
then
first=$(echo $line | awk 'NR==1{print $1}')
third=$(echo $line | awk 'NR==1{print $3}')
result=$(echo $((first % third)))
echo $result >> $2

fi
fi

#CONVERSION

#BINARY 2-10
if echo $line | grep -q 0b && echo $line | awk 'NR==1{print $2}' | grep -q 2 && echo $line | awk 'NR==1{print $3}' | grep -q 10; 
then
first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0b//g')
echo "ibase=2; obase=A; $first" | bc >> $2

#BINARY 2-16
elif echo $line | grep -q 0b && echo $line | awk 'NR==1{print $2}' | grep -q 2 && echo $line | awk 'NR==1{print $3}'| grep -q 16;
then
first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0b//g')
result=$(echo "ibase=2; obase=10000; $first" | bc)
echo "0x$result" >> $2

#HEXADECIMAL 16-2
elif echo $line | grep -q 0x && echo $line | awk 'NR==1{print $2}' | grep -q 16 && echo $line | awk 'NR==1{print $3}' | grep -q 2;
then
first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0x//g')
result=$(echo "ibase=16; obase=2; $first" | bc)
echo "0b$result" >> $2

#HEXADECIMAL 16-10
elif echo $line | grep -q 0x && echo $line | awk 'NR==1{print $2}' | grep -q 16 && echo $line | awk 'NR==1{print $3}' | grep -q 10;
then
first=$(echo $line | awk 'NR==1{print $1}' | sed 's/\0x//g')
echo "ibase=16; obase=A; $first" | bc >> $2

else

#DECIMAL 10-2
if echo $line | awk 'NR==1{print $2}' | grep -q 10 && echo $line | awk 'NR==1{print $3}' | grep -q 2;
then
first=$(echo $line | awk 'NR==1{print $1}')
result=$(echo "ibase=A; obase=2; $first" | bc)
echo "0b$result" >> $2

#DECIMAL 10-16
elif echo $line | awk 'NR==1{print $2}' | grep -q 10 && echo $line | awk 'NR==1{print $3}' | grep -q 16;
then
first=$(echo $line | awk 'NR==1{print $1}')
result=$(echo "ibase=A; obase=16; $first" | bc)
echo "0x$result" >> $2

fi
fi


done <$1
