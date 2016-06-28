
修改docker.service 中的docker0网桥的IP段 --bip=192.168.3.1/24  
修改docker.service 中的仓库地址为私有仓库--insecure-registry 172.18.44.212:5000
拷贝docker.service 和 docker.socket到 /usr/lib/systemd/system

拷贝docker 到 /usr/bin 
程序授权 
chmod 777 /usr/bin/docker

# 设置docker开机启动
systemctl enable docker.service

# 启动docker服务
sudo systemctl start docker

# 启动docker服务
/usr/bin/docker daemon --bip=192.168.12.1/24 --insecure-registry 172.18.44.212:5000
