# 《这本书能让你连接互联网 Ⅱ》

|[![cc](https://i.creativecommons.org/l/by-nc/4.0/80x15.png)](http://creativecommons.org/licenses/by-nc/4.0/)|[![fq-book](https://img.shields.io/badge/%F0%9F%93%96book-fq--book-red.svg?longCache=true&style=flat-square)](https://hoodiearon.github.io/fq-book)|[![docsify](https://img.shields.io/badge/%F0%9F%93%96docs-docsify-brightgreen.svg?longCache=true&style=flat-square)](https://docsify.js.org/)|[![blog](https://img.shields.io/badge/%F0%9F%94%97blog-hoodiearon-lightgrey.svg?longCache=true&style=flat-square)](https://hoodiearon.github.io/)|[![outlook](https://img.shields.io/badge/%F0%9F%93%A7hotmail-@邮箱联系-blue.svg?longCache=true&style=flat-square)](mailto:hoodiearon@outlook.com)|[![telegram](https://img.shields.io/badge/telegram-:me-blue.svg?longCache=true&style=flat-square)](https://t.me/hoodiearon)
|:-:|:-:|:-:|:-:|:-:|:-:|

本书着重于上网的方式与获取网站信息的技巧，并对相关流行且主要且典型的软件做简要的上手配置，以及原理的相关说明。

## ***update***

《这本书能让你连接互联网》-> 《这本书能让你连接互联网 Ⅱ》的更新要点：

* 收录ss前置原理以及推断gfw运作模式
* 增加相关上网方式以及软件配置操作
* crx_header_invalid 解决方案的说明
* 项目内置 probot 机器人，method 新增 战略家模式

* <details><summary>其他更新 click me! </summary>

    * 增加对虚拟电话注册方案的说明
    * 网页时光机以及查找相似站点
    * 利用个人博客作为连接互联网的中转

    </details>

此外，还精简了不必要的重复内容，图片采用 postimages 支持，项目由30M降低到144KB大小，非常方便在线部署及下载，欢迎 fork 《这本书》！

## ***usage***

在线部署：

fork 《这本书》 到你的 repo，并修改 docs/index.html，将`window.$docsify = {}` 的`repo` 修改成你的 repo 即可，这里以 anhoodie 为示例

![](https://user-images.githubusercontent.com/35732922/59164863-80b72000-8b45-11e9-8807-849ba56056f4.png)

`settings -> GitHub Pages` 选择 `master brach/docs folder`

![](https://user-images.githubusercontent.com/35732922/59164963-e061fb00-8b46-11e9-9647-c827fa784e38.png)

预览

![Snipaste_2019-06-10_06-18-56](https://user-images.githubusercontent.com/35732922/59165031-d7255e00-8b47-11e9-8a5b-829b61afeb24.png)

<details><summary>本地部署教程 click me! </summary>
 
点击`clone or download`之前，确认本机是否有[git](https://git-scm.com/)与[node](https://nodejs.org/zh-cn/)生产环境若没有请点击下载，安装比较傻瓜化，一直点`下一步`或`next`即可

* 右击选择`git bash`在命令行中输入 `npm i docsify-cli -g`
* 点击`clone or download`接着再点击`DownloadZIP`下载压缩包
* 解压缩后进入到`fq-book-master/docs`目录中右击打开`git bash`输入`docsify init .`
* 接着使用`docsify serve`完成本地部署，在浏览器中输入`localhost:3000`即可看到效果 :joy:

更多详细教程请看[docsify官网文档说明](https://docsify.js.org/)，当然，你也可以使用[wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)  以及结合[tools.pdf24.org](https://tools.pdf24.org/zh/webpage-to-pdf)制作《这本书》的PDF
</details>


## ***mind you*** 

由于工作和学习第二语言（非计算机）以及制作[《失落的满大林》](https://hoodiearon.github.io/LostMandarin)等方面的原因，有兴趣的话，支持一下，给[LostMandarin](https://github.com/hoodiearon/LostMandarin)打赏个star，非常感谢你们。

<!-- ## ***update***

《这本书能让你连接互联网》-> 《这本书能让你连接互联网 Ⅱ》

* 增加部分上网方式以及相关软件配置操作
* 增加对虚拟电话注册方案说明
* crx_header_invalid 解决方案的说明
* 网页时光机以及查找相似站点
* method 新增 战略家模式
* 项目内置 probot 机器人

此外，还精简了不必要重复的内容，图片使用 postimages 链接，内存占用30m降低到144kb，非常方便克隆与下载；以上是所有更新要点，欢迎 fork 《这本书》！ -->
