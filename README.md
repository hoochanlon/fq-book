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
    * 谷歌新账户注册方式
    * 网页时光机以及查找相似站点
    * 利用个人博客作为连接互联网的中转

    </details>

此外，还精简了不必要的重复内容，图片采用 postimages 支持，项目由30M降低到144KB大小，非常方便在线部署及下载，欢迎 fork 《这本书》！

## ***usage***

### 在线部署：

1. fork 《这本书》 到你的 repo
2. 修改 docs/index.html 将`window.$docsify = {}` 的`repo` 修改成你的 repo
3. 在 settings 找到 GitHub Pages 并选择 `master brach/docs folder` 
4. 访问 `https://你的GitHub用户名.github.io/fq-book` 即可看到效果

<details><summary>这里以 anhoodie 为示例 click me! </summary>

![](https://user-images.githubusercontent.com/35732922/59164863-80b72000-8b45-11e9-8807-849ba56056f4.png)

![](https://user-images.githubusercontent.com/35732922/59164963-e061fb00-8b46-11e9-9647-c827fa784e38.png)

</details>

预览

![Snipaste_2019-06-10_06-18-56](https://user-images.githubusercontent.com/35732922/59165031-d7255e00-8b47-11e9-8a5b-829b61afeb24.png)


### 本地部署

 
所需环境：[git](https://git-scm.com/)、[node](https://nodejs.org/zh-cn)；安装很简单一直 `下一步` 直到完成安装即可。

* 右击选择`git bash`在命令行中输入 `npm i docsify-cli -g`
* 点击`clone or download`下载`.zip` 并解压缩
* 进入到`fq-book-master/docs`目录
* 右击打开`git bash`输入`docsify init .`
* 使用`docsify serve`完成本地部署
* 在浏览器中输入`localhost:3000`即可看到效果 :joy: 

更多详细教程请看[docsify官网文档说明](https://docsify.js.org/)，当然，你也可以使用[wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)  以及结合[tools.pdf24.org](https://tools.pdf24.org/zh/webpage-to-pdf)制作《这本书》的PDF

## ***mind you*** 

科学上网仅为研究需要，以下是免责声明：

* 本书面向海外华人用户且仅供科研与学习，切勿用于其他用途
* 中国居民请自觉关闭本书并24小时内删掉与此相关的所有内容，否则出现一切后果本书作者概不负责

© 2019 [hoodiearon](https://github.com/hoodiearon)



