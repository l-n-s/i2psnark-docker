#!/bin/sh

cd /snark/i2psnark
    
if [ "$1" != "" ]; then
    I2CP_HOST=$1
else
    echo "I2CP host is not specified. Read documentation!"
    exit 2
fi

if [ "$2" != "" ]; then
    I2CP_PORT=$2
else
    I2CP_PORT="7654"
fi

printf "i2psnark.dir=downloads\ni2psnark.i2cpHost=$I2CP_HOST\ni2psnark.i2cpPort=$I2CP_PORT\n" > i2psnark.config

java -jar i2psnark.jar
