# Redis

## 1. Redis安装

redis官网下载stable版本，只有Linux版本，在Linux系统下解压后，文件夹内make, 成功后make install,默认安装路径在/usr/local/bin，会看到新增的6个redis开头的文件

## 2. Redis启动

![image-20220902125604307](C:\Users\SATANAILEO\AppData\Roaming\Typora\typora-user-images\image-20220902125604307.png)

```java
redis-server /etc/redis.conf // 注意，这里的redis.conf是从redis安装包解压后的文件夹中拷贝过来的
// 在此之前需要修改redis.conf中的daemonize no -> yes，这样才可以在后台运行
// redis 默认端口号是6379
```



## 3. Redis常用操作



## 4. 连接Redis

连接redis之前需要修改redis.conf,

1. bind 127.0.0.1行需要注释掉（如果没有的话不用管）
2. protected-mode no , 如果原先是yes则改成no, 原先配置文件没有的话添加本行到配置文件末尾
3. 外部连接前检查服务器的防火墙是否开启

## 5. SpringBoot整合Redis

1. 导入依赖

   ```xml
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-data-redis</artifactId>
   </dependency>
   
   <dependency>
       <groupId>org.apache.commons</groupId>
       <artifactId>commons-pool2</artifactId>
   </dependency>
   ```

2. application.yml配置redis配置

   ```yaml
   spring:
     redis:
       host: 192.168.191.129
       port: 6379
       database: 0
       timeout: 1800000
       lettuce:
         pool:
           max-active: 20
           max-wait: -1
           max-idle: 5
           min-idle: 0
   ```

3. 配置类
