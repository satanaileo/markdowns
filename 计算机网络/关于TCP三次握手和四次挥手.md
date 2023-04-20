1.  A发送A的SYN和SEQ=x
2. B收到A的SYN和SEQ, 发送对其确认的ACK=x+1; 发送B的SYN和SEQ=y
3. A收到B的SYN和SEQ及ACK, 发送对其确认的ACK=y+1



三次握手后, A确认A的收发, B的收发正常; B确认B的收发, A的收发正常

过程中，其实A和B都发送了SYN, SEQ和对对方SEQ的ACK, 并接收了以上内容
SYN_SEND: 什么都没有确认

SYN_RECV: B确认自己的RECV正常, 确认A的SEND正常(第一次握手后)

ESTABLISHED: A收到B的SYN和SEQ及ACK, 确认A的收发正常, B的收发正常

ESTABLISHED: B收到ACK后确认B的发送正常, A的接收正常





四次挥手：

A：FIN(SEQ=x) 我没啥要说的了，下线了

B: ACK(SEQ=x + 1) 好的，知道了(因为收到A的FIN时B可能还有数据要传输, 所以分两步)

...B可能还在传输的数据

B: FIN(SEQ=y) 我也没啥要说的了, 下线了

A: ACK(SEQ=y+1) 好的，知道了



等待2MSL后关闭, 否则如果A的ACK丢掉了，B一直没收到, 就会一直重发FIN, 但A如果已经关闭了就不会重发ACK，B就无法关闭了

