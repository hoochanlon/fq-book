# 初次搭建网站多次失败后的成功记录

内容包含了相关参考站点的链接，部分操作细节有所省略，旨在提供参考和说明，而非作为手把手的教程。

## VPS与环境选择

2U / 2G / 50GB / 5Mbps，年费约 800–1000 元；域名年费 250–280 元。常见 VPS 平台：LightNode、DigitalOcean、Hostinger、Vultr。

* [VPS 带宽选择指南](https://vpszhijia.com/服务器带宽多少合适)
* [注册域名与 Cloudflare 托管](https://doc.laopobao.online/domain)
* [自托管平台对比：Cloudron / YunoHost / Sandstorm](https://www.bayescafe.com/tools/self-hosting-platform-comparison.html)（推荐使用 Cloudron）
* [1Panel 管理面板](https://1panel.cn/)
* [Nginx UI](https://nginxui.com/zh_CN/)
* [Micro 编辑器](https://github.com/zyedidia/micro)
* [Caddy 简介](https://blog.motorbottle.site/archives/168)
* [Docker 中文参考](https://dockerdocs.xuanyuan.me/reference)

免费主机：

* https://run.claw.cloud
* https://www.serv00.com



**关于 VPS 与无服务器部署的思考**

如今已经不太推荐使用 VPS。原因如下：

1. 无服务器（Serverless）平台已经相当成熟，不仅提供免费额度，超出部分的计费也十分友好。对于大多数中小型项目而言，这些服务完全能够满足日常需求。
1. 在部署策略上，无服务器最理想的场景是静态化服务，例如静态博客或前端页面；若确实需要运行后端服务，国内的云服务商同样提供了价格低廉、性能稳定的选择。
1. 国外云服务器虽然可以免备案直接使用，但访问速度远不如国内。而若是为了科学上网等用途，选择机场服务通常比自建 VPN 更划算。

综合来看，在当前环境下，VPS的性价比已经大幅下降，不再是首选方案。

## bluesky建站部署

目前有两大协议去中心化社交：AT协议的bluesky和ActivityPub的mastodon，但mastodon实在太烂了。

bluesky启动地址：https://bsky.app

参考内容：

* [[軟體教學] 自架 Bluesky PDS 伺服器，促進去中心化社群發展](https://tedliou.com/software/bluesky-pds-server-deploy/#bluesky-pds-%E4%BC%BA%E6%9C%8D%E5%99%A8%E6%9E%B6%E8%A8%AD%E5%BF%83%E5%BE%97)
* [自己架設Bluesky PDS 並使用自己的Domain建立帳號](https://avantiblog.tw/self-hosting-a-bluesky-pds/#%E8%A8%AD%E5%AE%9ADNS_domain%E8%88%87%E7%AE%A1%E7%90%86%E5%93%A1%E4%BF%A1%E7%AE%B1)
* https://github.com/bluesky-social/atproto/issues/1752


SMTP 服务邮箱:

* https://resend.com
* https://www.brevo.com


bsky.app第三方启动器：https://tabtter.jp


在使用 Resend 发送邮件时，如果出现“域名未验证”的错误，通常是因为 域名验证流程未完成。要正确验证域名，需要注意两点：

1. DNS 记录对应：在自己的 DNS 服务商中添加 Resend 提供的域名记录时，必须确保记录的域名（主机名/网域）与 Resend 要求完全一致。
2. 控制台验证：添加完 DNS 记录后，还需要回到 Resend 控制台点击 “Verify DNS Record” 进行验证，Resend 才能确认域名已经生效。

只有满足这两步，域名验证成功后，才能正常使用该域名发送邮件。


```env
#將YOUR_API_KEY_HERE換成上一部給你的 API Keys
PDS_EMAIL_SMTP_URL=smtps://resend:re_your_key@smtp.resend.com:465/
#將 admin@example.com 替換成 SMTP 發信地址
PDS_EMAIL_FROM_ADDRESS=admin@hoochanlon.space
# 测试效果时，取消邀请机制
PDS_INVITE_REQUIRED="false"
# 编辑完，重启服务
systemctl restart pds
```

## Memos 搭建记录

Memos 是轻量级的自托管笔记系统。新版 UI 不太合我意，因此我选择回退旧版。

### Docker 原理图

```
+-------------------------------------------------+
|                  宿主机                         |
|                                                 |
| 访问地址: http://服务器IP:5230                   |
|                                                 |
|  +-----------------------------------------+    |
|  |             容器: MEMOS                  |    |
|  | 应用: MEMOS                             |     |
|  | 内部端口: 5230                          |     |
|  | 数据存储卷: /data                     |       |
|  +-----------------------------------------+    |
| 本地挂载路径: /var/opt/memos ------------------> |
+-------------------------------------------------+
```

### 部署命令

```yaml
version: "3.8"
services:
  memos:
    image: neosmemo/memos:0.24.0
    container_name: memos
    ports:
      - "5230:5230"
    volumes:
      - ./data:/var/opt/memos
    restart: unless-stopped
```

切换版本命令：

```bash
cd /opt/1panel/www/memos
docker compose down
docker stop memos
docker rm memos
docker compose up -d
```

旧版 UI 截图：

![旧版 Memos UI](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/uploads/2025/PixPin_2025-11-05_18-11-00.webp)


虽然有不少衍生项目，但个人兴趣不大：

- [Vespa314/cflow](https://github.com/Vespa314/cflow)
- [blinkospace/blinko](https://github.com/blinkospace/blinko)
- [AppFlowy-IO/AppFlowy](https://github.com/AppFlowy-IO/AppFlowy)


### Nginx 反代注意事项

若访问反代域名时提示“无法访问”，说明浏览器可能强制使用 HTTPS（443 端口）。  
而你只配置了 HTTP（80 端口）。

**解决办法：**
1. 申请 HTTPS 证书（可用 Cloudflare 或 Let’sEncrypt 免费申请）。  
2. 若浏览器缓存了 HSTS，需清理缓存或使用隐身模式访问。

参考教程：  
[如何申请 Cloudflare 免费 SSL 证书](https://kerrynotes.com/apply-ssl-certificate-from-cloudflare/)

### 域名绑定参考

- [Vercel 域名绑定官方指南](https://docs.tangly1024.com/article/vercel-domain)
- [使用 1Panel 自动申请和续签通配符证书](https://hin.cool/posts/sslfor1panel.html)
- [GitHub Pages 绑定域名问题](https://blog.csdn.net/jinweilin/article/details/79607349?)
- [github.io 绑定域名](https://blog.csdn.net/weixin_45961774/article/details/108402406)




