

docker kill $(docker ps -q) ; 
docker rm $(docker ps -a -q) ; 
docker rmi $(docker images -q -a) 
systemctl daemon-reload;
systemctl enable docker.service
systemctl status docker.service;
systemctl restart docker.service;
systemctl start docker.service;
systemctl restart docker.service;

docker commit c65c825830bb xap/rocketmq_base:0.1
docker commit centos_ssh xap/centos_ssh:0.1
docker save xap/centos_ssh:0.1 > /root/Downloads/centos_ssh_0.1.tar 
docker load < /root/Downloads/centos7-ssh-0.1.tar 
docker run -d --name=centosssh --privileged=true centos7-ssh:0.1
/usr/bin/docker daemon --bip=192.168.12.1/24  --insecure-registry 172.18.44.212:5000
/usr/lib/systemd/system/docker.service




