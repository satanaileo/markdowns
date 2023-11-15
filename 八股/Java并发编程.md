### 1. 并行和并发的区别

- 并发：同一时刻，两个线程都在执行，多CPU
- 并行：同一时间段内，两个线程都执行了，CPU切换线程

### 2. 进程和线程

- 进程：系统进行资源分配和调度的基本单位
- 线程：进程的一个执行路径，进程中的多个线程共享进程的资源

操作系统分配资源给进程，但**CPU**资源是分配到线程的

![image-20230828184415791](C:\Users\satanaileo\AppData\Roaming\Typora\typora-user-images\image-20230828184415791.png)

### 3. 线程的3种创建方式

- 继承Thread类，重写run()方法，调用start()方法启动线程

  ```java
  public class ThreadTest {
      public static class MyThread extends Thread {
          public void run() {
              ...
          }
      }
      public static void main(String[] args) {
          MyThread thread = new MyThread();
          thread.start();
      }
  }
  ```

- 实现Runnable接口，重写run()方法，new Thread(新类).start()

```java
public class RunnableTask implements Runnable{
    public void run() {
        ...
    }
    
    public static void main(String[] args) {
        RunnableTask task = new RunnableTask();
        new Thread(task).start();
    }
}
```

- 实现Callable接口，重写call()方法，新建FutureTask，将futuretask放入new Thread()执行start()

  可以用task的get()获取任务执行的返回值

```java
public class CallerTask implements Callable<String> {
    public String call() throws Exception {
        return "Hello,i am running!";
    }

    public static void main(String[] args) {
        //创建异步任务
        FutureTask<String> task=new FutureTask<String>(new CallerTask());
        //启动线程
        new Thread(task).start();
        try {
            //等待执行完成，并获取返回结果
            String result=task.get();
            System.out.println(result);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
    }
}
```

### 4. ThreadLocal内存泄漏

ThreadLocalMap内是Entry数组，而其中的Entry是弱引用，当垃圾回收释放掉Entry但value的Object没有被释放就会出现内存泄漏

![image-20230828195609141](C:\Users\satanaileo\AppData\Roaming\Typora\typora-user-images\image-20230828195609141.png)

为解决这个问题，使用完ThreadLocal方法后最好手动调用remove

