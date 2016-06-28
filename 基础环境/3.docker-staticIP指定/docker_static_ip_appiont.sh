#!/bin/bash
pipework docker0 fc78f97fa375 192.168.2.27/24@192.168.2.1
pipework docker0 $(docker run -itd -p 9197:80 liyong/javaweb /bin/bash) 192.168.2.27/24@192.168.2.1

