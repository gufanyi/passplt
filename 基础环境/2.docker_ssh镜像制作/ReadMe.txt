一Docker使用Dockerfile创建支持ssh服务自启动的容器镜像
1.下载centos镜像
docker pull daocloud.io/centos:7

2. 首先创建一个Dockerfile文件，文件内容如下
# 选择一个已有的os镜像作为基础
FROM daocloud.io/centos:7
 
# 镜像的作者
MAINTAINER tianchw "wuyao1200@163.com"
 
# 安装openssh-server和sudo软件包，并且将sshd的UsePAM参数设置成no
RUN yum install -y openssh-server sudo
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
 
# 添加测试用户admin，密码admin，并且将此用户添加到sudoers里
# RUN useradd root
RUN echo "root:11" | chpasswd
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers
 
# 下面这两句比较特殊，在centos6上必须要有，否则创建出来的容器sshd不能登录
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
 
# 启动sshd服务并且暴露22端口
RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


3. 有了Dockerfile文件以后，就可以根据Dockerfile来创建image文件了，在Dockerfile所在的目录下，运行下面的命令
sudo docker build -t centos7-ssh:0.1 .
命令成功后，就会创建一个名字为centos7-ssh的image，可以使用“sudo docker images”来查看。

4. 此时就可以根据上面创建出来的image文件来创建自己的容器了，下面的命令会创建一个名字为“mytest”的容器。
sudo docker run -d --name=centosssh --privileged=true  centos_ssh:0.2

5. 有了容器，就可以测试我们的ssh服务了。
运行“sudo docker inspect centosssh”，查看当前启动容器IP地址，然后运行下面的命令来测试
ssh root@172.18.44.150 -p 32767

二:镜像的导出和导入
1.把 centos7-ssh:0.1 镜像保存成 tar 文件
docker save centos7-ssh:0.1 > centos7-ssh-0.1.tar
2.把 centos7-ssh-0.1.tar 拷贝到新的 Docker 实例中
docker load < centos7-ssh-0.1.tar
