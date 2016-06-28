#通过镜像中心安装
#yum install docker
# 通过daoclud安装docker 
curl -sSL https://get.daocloud.io/docker | sh 

# 设置docker开机启动
systemctl enable docker.service

# 启动docker服务
sudo systemctl start docker
#sudo systemctl status docker

#安装加速器
curl -sSL https://get.daocloud.io/daomonit/install.sh | sh -s 054c99e86679e377708b27a2407f418a77fe286f 

echo 'stop docker service'
pkill docker

echo 'success'
#通过daoclud安装
#1.访问daocloud
#https://www.daocloud.io
#2.登录daocloud
#gufanyi  Zhaihong0