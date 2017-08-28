# I2PSnark Docker image

I2PSnark is anonymous torrent client for I2P network.  

## Building

    # Build latest development version
    docker build -t i2psnark .

    # Specify git tag to build 
    docker build -t i2psnark --build-arg GIT_TAG=i2p-0.9.31 .

## Running

    # create directory for downloads data at host
    mkdir /home/username/downloads
    chmod 777 /home/username/downloads

    # run container. I2P-Snark will use I2CP interface 172.17.0.1:7654
    docker run -it -p 127.0.0.1:8002:8002 -v /home/username/downloads:/snark/i2psnark/downloads i2psnark 172.17.0.1 7654


I2P-Snark WebUI is available at `http://127.0.0.1:8002`. 
Downloaded data will be available at `/home/username/downloads`.
