# IPFS简单使用

## 前言

在看了读者的邮箱来信后，确实，若是被勒令这不可抗拒的因素删除仓库也是毫无办法；何况，我也是各种担心也因其他缘由与相关操作不当导致删除重建好几次该书项目，而这次就需要着手使用ipfs这类去中心化的网络应用了。

这其中也遇到一些问题就是上传文件后，关闭了ipfs的进程，其他人却无法有效访问这个站点了。为此特意搜索相关相关问题内容，找到了一个合理的解释：

> 我还特意找了一个VM安装ipfs，并添加同样内容（"hello world"）的文件到ipfs，发现hash是一样的。相信全球大量的人员在测试ipfs时都可能会使用"hello world"作为文件内容。  

> 所以当访问地址`https://ipfs.io/ipfs/QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o`时，访问的不见得是你自己的电脑上的这个hello.txt文件，除非这个文件的内容独特到全球只有你的电脑上有。  

> 文档`https://ipfs.io/ipfs/QmXZXP8QRMG7xB4LDdKeRL5ZyZGZdhxkkLUSqoJDV1WRAp`的内容比较独特，恐怕只有我自己的电脑上有，如果我不开机并启动ipfs进程，估计别人访问不了。

> —— 摘自 [王伟兵的博客](https://github.com/wbwangk/wbwangk.github.io/wiki/IPFS)

也就是说，打不开对方提供的已发布在网上的IPFS节点链接，很可能是资源仅他独有且关闭了ipfs的进程。


## 安装

打开[ipfs](https://ipfs.io/docs/install/)，选择[getting started with ipfs](https://ipfs.io/docs/getting-started/)

<!-- ![](https://ipfs.io/ipfs/QmVqhqctR8HaHEaLBsT8oCy5u2cDWH3xp5nWSgCjMGJTJJ?0.png) -->

![](https://i.postimg.cc/Y0SyFZ1Z/2018-05-27-092613.png)

[install ipfs now](https://ipfs.io/docs/getting-started/)

<!-- ![](https://ipfs.io/ipfs/QmT8nWpg14T2Vts7LRWiNMi4ZcXd3q96DYAYq8cFB3vF5j?2.png) -->

![](https://i.postimg.cc/vHg0dWXr/2018-05-27-093125.png)

[download ipfs for your platorm](https://dist.ipfs.io/#go-ipfs)

<!-- ![](https://ipfs.io/ipfs/QmTDGnkpwcuN6tQjnP7R7XpTjLxr9MXwGYKBBbAqXN7ako?3.png) -->

![](https://i.postimg.cc/fLqfGL9q/2018-05-27-093548.png)

点击即可下载

<!-- ![](https://ipfs.io/ipfs/QmSTjFqRHEjtW6LWYmE9eLy2YRGjKUmUQgX8JznX6N28Ui?2.png) -->

![](https://i.postimg.cc/XvVKXFKD/2018-05-27-093946.png)

解压并用CLI进入当前文件夹，输入`ipfs.exe init`完成初始化操作

<!-- ![](https://ipfs.io/ipfs/QmbAL6HMqHTc8stSxQRhowh5WBcVEiW4i4NsmTe6hcjS78?4.png) -->

![](https://i.postimg.cc/0yCWt9cF/2018-05-27-095305.png)

`ipfs.exe daemon`开启守护进程

<!-- ![](https://ipfs.io/ipfs/QmRQf6jx8U9VeFfu2gr8T7JhQX5zRdSPgaWmF7BipWrjvn?0.png) -->

![](https://i.postimg.cc/D0s51hSC/2018-05-27-095836.png)

输入`http://localhost:5001/webui`进入主界面，在`connection`版块中可以看到全球共有267个节点，这一数字也是动态变化的

<!-- ![](https://ipfs.io/ipfs/Qmf2iphYYZbzoZXisJB6rfGTdEU5MGzRwbPLaoobzA1Nkt?2.png) -->

![](https://i.postimg.cc/T2rrjCkH/2018-05-27-100854.png)

## 上传文件

在`files`版块中点击`create folder`创建文件夹，目前除图片外，若要正确上传文件，必须用文件夹的`hash`加载

<!-- ![](https://ipfs.io/ipfs/QmTWV2wo9on5oqgcgQq5N4hRyfLrNY3RXgcvtGfE13Shjb?2.png) -->

![](https://i.postimg.cc/vZpBNdT7/2018-05-27-113127.png)

选择需要上传的文件，右键`copy hash`，转到DAG板块中粘贴进输入框GO

<!-- ![](https://ipfs.io/ipfs/QmUMhW3H3ApEPihJs9gHxfAG1SExeyUuWZtoM2VmtCpQz7?3.png) -->

![](https://i.postimg.cc/qq5068Cc/2018-05-27-114055.png)

<!-- ![](https://ipfs.io/ipfs/QmeoED47NpN6HHEkiSnz4Mt32XJpoWtX1AQDuC1LaojUA8?2.png) -->

![](https://i.postimg.cc/dQbJF9wv/2018-05-27-114452.png)

将如上hash连接复制，并在前面加上`htttps://ipfs.io`

<!-- ![](https://ipfs.io/ipfs/QmRAbdqGsKiZjScrztkftxx9XTArenE8toKkvCZfLhvP8M?3.png) -->

![](https://i.postimg.cc/BvVdgqvs/2018-05-27-114812.png)

hash链接始终是太长了，就需要使用[tinyURL](https://tinyurl.com/)生成短链接

<!-- ![](https://ipfs.io/ipfs/QmfSA2veGGcndSWXpmxhn3zBNux4i1JMHv8Wm3fRr9nmbz?3.png) -->

![](https://i.postimg.cc/QCrY4VZL/2018-05-27-120243.png)

测试

<!-- ![](https://ipfs.io/ipfs/QmVTmfExQdvVjrosgsmqKT5hk4wABW756V7pA6YcoN9hCu?2.png) -->

![](https://i.postimg.cc/9f7B6Vpc/2018-05-27-121017.png)

你愿意把它当作无限存储的网盘也可以，只不过任何人包括你在内不能删除它罢了；速度的话，聊天群、问答社区以及贴吧各种宣传，人多了应该自然也就会快一些。

## 部署静态网站

在这里我已预先提供了一份基于gitbook生成的静态网站文件夹

<!-- ![](https://ipfs.io/ipfs/Qmf337dkc4u8Vvz3afx6hVQwDutSagkEh1nPW7dRtSCpEC?2.png) -->

![](https://i.postimg.cc/J4FZMvt0/2018-05-27-164203.png)

命令行定位到文件夹的上层文件夹，执行`ipfs add -r web-book`上传整个目录

<!-- ![](https://ipfs.io/ipfs/QmYAHqw57WUfvTyLEd8EgAVE6gN38ykrZJg1bV7ci5z4de?0.png) -->

![](https://i.postimg.cc/X7BXcJ7N/2018-05-27-171923.png)

`web-book`文件夹的指令输出的最后一行的哈希值，就是你的网站的根目录

<!-- ![](https://ipfs.io/ipfs/QmSqfSqZCjZ2BGr75sK816cRGHksoESnYK8CPXfg6cjKUF?2.png) -->

![](https://i.postimg.cc/fLkMz2VW/2018-05-27-172511.png)

复制最后一行的hash值

<!-- ![](https://ipfs.io/ipfs/QmcP41JKtYrq7TuS3pdU2Hmh5zpTQsDKdmniFgQyJcgwb9?4.png) -->

![](https://i.postimg.cc/VkD6zbKR/2018-05-27-173142.png)

输入`localhost:8080/ipfs`后面追加已复制的哈希值即可

<!-- ![](https://ipfs.io/ipfs/QmW7yPmdmZXPanUrDfVFm7C38TjdB3B3gMWQXjXoU2iCf4?1.png) -->

![](https://i.postimg.cc/G2YdTBx6/2018-05-27-173114.png)

虽数据已添加到当前的ipfs节点中，但是并没有同步到ipfs网络；此时还只是离线部署，现在要将它发布在互联网上。

运行了`ipfs add -r` 的指令的窗口不要关闭，新建一个cmd命令行窗口，进入ipfs文件夹再输入`ipfs.exe daemon`便发布成功了

![](https://i.postimg.cc/mrC5Q7K3/2018-05-27-175819.png)

测试

<!-- ![](https://ipfs.io/ipfs/QmdPPXYVMJ2JTMFChQbdQy2eApMiD6Dr763s27YD46n35b?3.png) -->

![](https://i.postimg.cc/3wXtyYDn/2018-05-27-181051.png)

## IPNS同步更新

由于去中心化的缘故，一但上传也就不能更改了，为此需要ipns的新目录以及节点id映射在新的hash值，用户只需访问`ipfs.io/ipns/节点id`查看相关的更新，也就是说以前的`ipfs.io/ipfs/目录hash值`被废弃了；这也看出来去中心化一个弊端就是产生大量垃圾，虽然链接很长很长...

为了演示方便在`book.json`文件中添加了新的插件，并再次使用了`ipfs add -r web-book`指令使其生成新的hash值。

<!-- ![](https://ipfs.io/ipfs/QmUokTS9iEMAvcBf2r4AuGXkgHzmoC97LuPLtnS3Tc3miz?4.png) -->

![](https://i.postimg.cc/YSR1K9FK/2018-05-27-213304.png)

使用`ipfs name publish`后面跟上站点根目录的hash值进行发布操作

<!-- ![](https://ipfs.io/ipfs/QmPrEGfXt53aZdXwkRgPC9qFLaziKZKXjy2sXgXQmTDdPk?2.png) -->

![](https://i.postimg.cc/65Z1vDg2/2018-05-27-220829.png)

使用`ifps id`查看节点id

<!-- ![](https://ipfs.io/ipfs/Qma7Ww1tWrrdX4aauMqYueeNnhuXR1Ms16JDkDCcSofYM1?1.png) -->

![](https://i.postimg.cc/ZqWN9hsX/2018-05-27-221733.png)

`ipfs name resolve`后面追加已查到的节点id

<!-- ![](https://ipfs.io/ipfs/QmaL3MCdyBbBS5n5X2sweyMj1pKW2UgZka4jY9rSQKtd3F?0.png) -->

![](https://i.postimg.cc/ZRhqTkG8/2018-05-27-222850.png)

此时，已经可以本地访问了，`localhost:8080/ipns/节点id`

<!-- ![](https://ipfs.io/ipfs/QmULUBN4wRUSQ5NquDxXwAyvGuXogymDBCbQbXQsB8BhvR?1.png) -->

![](https://i.postimg.cc/Zn54RJVd/2018-05-27-223735.png)

关掉之前的使用`ipfs daemon`指令的窗口，再打开命令行窗口重新运行该指令即可，由于访问人数不多再加上GFW的干扰，可能会很慢。

测试

<!-- ![](https://ipfs.io/ipfs/QmUe1eWwnUFPDpjiSu75Gyv3QxpaHm8Xb2aVJMmuydwXxk?2.png) -->

![](https://i.postimg.cc/qMY4JVnN/2018-05-27-225417.png)

## 备份

备份这很重要，但也很简单，在`C:\Users\lorem\.ipfs`下找到`config`文件并将其拷贝至云盘即可，lorem是我的用户名

<!-- ![](https://ipfs.io/ipfs/QmWdvB4mskcD6oPEWJLHB16JspxxdSQh9uog4JoaSgUR2v?3.png) -->

![](https://i.postimg.cc/xTkVFx7n/2018-05-27-232208.png)
