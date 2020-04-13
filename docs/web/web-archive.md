# 网页时光机

> 网站时光机（英语：Wayback Machine）[4]是万维网或互联网上传播的其他信息的一个数字文件网站，是美国加利福尼亚州旧金山的非营利组织——互联网档案馆最重要的服务之一。—— 摘自：[网站时光机 - wikiwand](https://www.wikiwand.com/zh-cn/%E7%BD%91%E7%AB%99%E6%97%B6%E5%85%89%E6%9C%BA#/overview)

!> 当对于相关技术讨论封锁越来越严，网站内容随时有丢失的可能，利用这个网页时光机，做个永久网页档案备份，方便下次再次查询与恢复思路继续联想。

进入 https://web.archive.org 输入想要永久备份的网址页面，再点击 `save this url in the wayback machine` 便可生成备份站点。

![](https://i.postimg.cc/CMbyc8K2/Snipaste-2019-06-09-19-13-00.png)

对于已经备份过的网页该网站是存有记录的，不过对于显示css、image并不理想，还是存在一定的局限性。

![](https://i.postimg.cc/1X6P8R9K/Snipaste-2019-06-09-19-45-23.png)

愿意离线保存的话，在Chrome设置中`更多工具 -> 网页另存为 -> 网页全部(*.htm;*.html)`或者`ctrl + p`打印PDF（建议使用[wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)针对网页打印PDF，相关参数官网有详细说明）；也可以保存成一个概览整图，在`f12`（开发者工具）中，`ctrl + shift + p`（控制台）输入：`screen` 如图示

![](https://i.postimg.cc/fTR7x34y/Snipaste-2019-06-09-20-03-18.png)

btw，当网页无法打开或者失效不久，没有时光机的话，也可以通过快照临时查看，[灵感来自：coderschool](https://coderschool.cn/2348.html)。

?> 在补一刀：使用 [similarsitesearch](https://www.similarsitesearch.com/cn/) 可查询相似网站，你懂的，ヾ§ ￣▽)ゞ2333333