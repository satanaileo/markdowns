./git/objects

blob 只存储文件内容不存储文件名

tree 包含多个blob和tree对象

![image-20231114202204157](assets/image-20231114202204157.png)

commit 包含tree和其他信息

![image-20231114202304588](assets/image-20231114202304588.png)

./git/index中存储暂存区中文件名和blob的对应关系

![image-20231114202348284](assets/image-20231114202348284.png)