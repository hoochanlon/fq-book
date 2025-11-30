# 自建云梯入门：Shadowsocks服务端 + Clash客户端配置

国内直接访问境外网站必然受限制，原因在于国内对境外流量进行了严格控制。但国内到台湾之间是互通的。 也就是可以买一台最便宜的台湾服务器作为中转当做跳板。不得不说，这个免费梯子真厉害：[Pawdroid/Free-servers](https://github.com/Pawdroid/Free-servers)

## 在服务器上安装Shadowsocks服务端

### 选型安装shadowsocks-libev

推荐使用官方维护的 shadowsocks-libev，因为简单、稳定、性能好。

更新软件源和安装shadowsocks-libev

```bash
sudo apt update
sudo apt install shadowsocks-libev
```

### 配置 Shadowsocks 服务

配置文件默认放在 `/etc/shadowsocks-libev/config.json` 修改配置 `vi /etc/shadowsocks-libev/config.json`

修改如下：

```json
{
    "server": "0.0.0.0",
    "mode": "tcp_and_udp",
    "server_port": 8488,
    "local_port": 1080,
    "password": "your-password",
    "timeout": 86400,
    "method": "chacha20-ietf-poly1305"
}
```

参数简单解释：

* ​`server`​: `0.0.0.0`​ 表示监听所有网卡。
* ​`server_port`​: 自定义你需要开启的端口。
* `local_port`: 本地默认代理端口。
* ​`method`​: 可选 `chacha20-ietf-poly1305`​、`aes-256-gcm`​ 等。


端口配置参考：

* 知名端口 (Well-known ports)：从 0 到 1023，这些端口号通常被操作系统和系统级应用程序使用，如 HTTP (80)、HTTPS (443)、FTP (21) 等。
* 注册端口 (Registered ports)：从 1024 到 49151，这些端口号是为特定应用程序或服务保留的，并且可以由应用程序开发者注册使用。
* 动态/私有端口 (Dynamic/Private ports)：从 49152 到 65535，这些端口通常用于客户端和服务端之间的动态连接，如 NAT (网络地址转换) 和临时端口。


### 服务端启动

1. 启动服务 `sudo systemctl restart shadowsocks-libev.service`
2. 检查状态 `sudo systemctl status shadowsocks-libev.service`
3. 防火墙放行端口 `ufw allow 8848`
4. 配置开机自动启动：`sudo systemctl enable shadowsocks-libev.service`

`ss -tulpn | grep ss-server` 在服务器上检查端口是否在监听，正常会显示 `ss-server`​ 在监听配置好的端口。


## 在你自己的电脑上安装 clash 并配置

clash 下载地址：https://www.clashverge.dev/index.html 

### 关键配置展示解读


```yaml
# 本地从哪里走代理
port: 7890
socks-port: 7891
redir-port: 7892
allow-lan: false
mode: Rule
log-level: info
external-controller: 127.0.0.1:9090

...

# 代理
proxies:
  - name: "海外服务器IP地址"
    type: ss
    server: 海外服务器IP地址
    port: 8848
    cipher: chacha20-ietf-poly1305
    password: "你的密码"
    udp: false

# 节点
proxy-groups:
  - name: CroLAX
    type: select
    proxies:
      - "海外服务器IP地址"
      - "DIRECT"
```


客户端配置链接参考：

* Windows：[Clash for Windows](https://www.clashforwindows.net)  
* Mac：[Clash Verge](https://clashverge.net)
* Android：[Clash for Android](https://clashforandroid.org/clash-for-android-download)
* iOS：[Shadowrocket](https://apps.apple.com/us/app/shadowrocket/id932747118)


### 在【订阅】-> 【新建】 修改 Clash 配置。

clash 完整配置模板如下，复制粘贴，修改如上“关键配置解读”的proxies和proxy-groups部分即可。


```yml
port: 7890
socks-port: 7891
redir-port: 7892
allow-lan: false
mode: Rule
log-level: info
external-controller: 127.0.0.1:9090
secret: ""
cfw-bypass:
  - localhost
  - 127.*
  - 10.*
  - 172.16.*
  - 172.17.*
  - 172.18.*
  - 172.19.*
  - 172.20.*
  - 172.21.*
  - 172.22.*
  - 172.23.*
  - 172.24.*
  - 172.25.*
  - 172.26.*
  - 172.27.*
  - 172.28.*
  - 172.29.*
  - 172.30.*
  - 172.31.*
  - 192.168.*
  - <local>
cfw-latency-timeout: 3000
proxies:
  - name: "海外服务器IP地址"
    type: ss
    server: 海外服务器IP地址
    port: 8848
    cipher: chacha20-ietf-poly1305
    password: "你的密码"
    udp: false
proxy-groups:
  - name: CroLAX
    type: select
    proxies:
      - "海外服务器IP地址"
      - "DIRECT"
rules:
  - DOMAIN,hls.itunes.apple.com,CroLAX
  - DOMAIN,itunes.apple.com,CroLAX
  - DOMAIN,itunes.com,CroLAX
  - DOMAIN-SUFFIX,icloud.com,DIRECT
  - DOMAIN-SUFFIX,icloud-content.com,DIRECT
  - DOMAIN-SUFFIX,me.com,DIRECT
  - DOMAIN-SUFFIX,mzstatic.com,DIRECT
  - DOMAIN-SUFFIX,aaplimg.com,DIRECT
  - DOMAIN-SUFFIX,cdn-apple.com,DIRECT
  - DOMAIN-SUFFIX,apple.com,DIRECT
  ## 国内网站
  - DOMAIN-SUFFIX,akadns.net,DIRECT
  - DOMAIN-SUFFIX,akamaized.net,DIRECT
  - DOMAIN-SUFFIX,cn,DIRECT
  - DOMAIN-KEYWORD,-cn,DIRECT
  - DOMAIN-SUFFIX,126.com,DIRECT
  - DOMAIN-SUFFIX,126.net,DIRECT
  - DOMAIN-SUFFIX,127.net,DIRECT
  - DOMAIN-SUFFIX,163.com,DIRECT
  - DOMAIN-SUFFIX,360buyimg.com,DIRECT
  - DOMAIN-SUFFIX,36kr.com,DIRECT
  - DOMAIN-SUFFIX,acfun.tv,DIRECT
  - DOMAIN-SUFFIX,air-matters.com,DIRECT
  - DOMAIN-SUFFIX,aixifan.com,DIRECT
  - DOMAIN-KEYWORD,alicdn,DIRECT
  - DOMAIN-KEYWORD,alipay,DIRECT
  - DOMAIN-KEYWORD,taobao,DIRECT
  - DOMAIN-SUFFIX,amap.com,DIRECT
  - DOMAIN-SUFFIX,autonavi.com,DIRECT
  - DOMAIN-KEYWORD,baidu,DIRECT
  - DOMAIN-SUFFIX,bdimg.com,DIRECT
  - DOMAIN-SUFFIX,bdstatic.com,DIRECT
  - DOMAIN-SUFFIX,bilibili.com,DIRECT
  - DOMAIN-SUFFIX,caiyunapp.com,DIRECT
  - DOMAIN-SUFFIX,clouddn.com,DIRECT
  - DOMAIN-SUFFIX,cnbeta.com,DIRECT
  - DOMAIN-SUFFIX,cnbetacdn.com,DIRECT
  - DOMAIN-SUFFIX,cootekservice.com,DIRECT
  - DOMAIN-SUFFIX,csdn.net,DIRECT
  - DOMAIN-SUFFIX,ctrip.com,DIRECT
  - DOMAIN-SUFFIX,dgtle.com,DIRECT
  - DOMAIN-SUFFIX,dianping.com,DIRECT
  - DOMAIN-SUFFIX,douban.com,DIRECT
  - DOMAIN-SUFFIX,doubanio.com,DIRECT
  - DOMAIN-SUFFIX,duokan.com,DIRECT
  - DOMAIN-SUFFIX,easou.com,DIRECT
  - DOMAIN-SUFFIX,ele.me,DIRECT
  - DOMAIN-SUFFIX,feng.com,DIRECT
  - DOMAIN-SUFFIX,fir.im,DIRECT
  - DOMAIN-SUFFIX,frdic.com,DIRECT
  - DOMAIN-SUFFIX,g-cores.com,DIRECT
  - DOMAIN-SUFFIX,godic.net,DIRECT
  - DOMAIN-SUFFIX,gtimg.com,DIRECT
  - DOMAIN-SUFFIX,hongxiu.com,DIRECT
  - DOMAIN-SUFFIX,hxcdn.net,DIRECT
  - DOMAIN-SUFFIX,iciba.com,DIRECT
  - DOMAIN-SUFFIX,ifeng.com,DIRECT
  - DOMAIN-SUFFIX,ifengimg.com,DIRECT
  - DOMAIN-SUFFIX,ipip.net,DIRECT
  - DOMAIN-SUFFIX,iqiyi.com,DIRECT
  - DOMAIN-SUFFIX,jd.com,DIRECT
  - DOMAIN-SUFFIX,jianshu.com,DIRECT
  - DOMAIN-SUFFIX,knewone.com,DIRECT
  - DOMAIN-SUFFIX,le.com,DIRECT
  - DOMAIN-SUFFIX,lecloud.com,DIRECT
  - DOMAIN-SUFFIX,lemicp.com,DIRECT
  - DOMAIN-SUFFIX,licdn.com,DIRECT
  - DOMAIN-SUFFIX,luoo.net,DIRECT
  - DOMAIN-SUFFIX,meituan.com,DIRECT
  - DOMAIN-SUFFIX,meituan.net,DIRECT
  - DOMAIN-SUFFIX,mi.com,DIRECT
  - DOMAIN-SUFFIX,miaopai.com,DIRECT
  - DOMAIN-SUFFIX,microsoft.com,DIRECT
  - DOMAIN-SUFFIX,microsoftonline.com,DIRECT
  - DOMAIN-SUFFIX,miui.com,DIRECT
  - DOMAIN-SUFFIX,miwifi.com,DIRECT
  - DOMAIN-SUFFIX,mob.com,DIRECT
  - DOMAIN-SUFFIX,netease.com,DIRECT
  - DOMAIN-SUFFIX,office.com,DIRECT
  - DOMAIN-KEYWORD,officecdn,DIRECT
  - DOMAIN-SUFFIX,office365.com,DIRECT
  - DOMAIN-SUFFIX,oschina.net,DIRECT
  - DOMAIN-SUFFIX,ppsimg.com,DIRECT
  - DOMAIN-SUFFIX,pstatp.com,DIRECT
  - DOMAIN-SUFFIX,qcloud.com,DIRECT
  - DOMAIN-SUFFIX,qdaily.com,DIRECT
  - DOMAIN-SUFFIX,qdmm.com,DIRECT
  - DOMAIN-SUFFIX,qhimg.com,DIRECT
  - DOMAIN-SUFFIX,qhres.com,DIRECT
  - DOMAIN-SUFFIX,qidian.com,DIRECT
  - DOMAIN-SUFFIX,qihucdn.com,DIRECT
  - DOMAIN-SUFFIX,qiniu.com,DIRECT
  - DOMAIN-SUFFIX,qiniucdn.com,DIRECT
  - DOMAIN-SUFFIX,qiyipic.com,DIRECT
  - DOMAIN-SUFFIX,qq.com,DIRECT
  - DOMAIN-SUFFIX,qqurl.com,DIRECT
  - DOMAIN-SUFFIX,rarbg.to,DIRECT
  - DOMAIN-SUFFIX,ruguoapp.com,DIRECT
  - DOMAIN-SUFFIX,segmentfault.com,DIRECT
  - DOMAIN-SUFFIX,sinaapp.com,DIRECT
  - DOMAIN-SUFFIX,smzdm.com,DIRECT
  - DOMAIN-SUFFIX,sogou.com,DIRECT
  - DOMAIN-SUFFIX,sogoucdn.com,DIRECT
  - DOMAIN-SUFFIX,sohu.com,DIRECT
  - DOMAIN-SUFFIX,soku.com,DIRECT
  - DOMAIN-SUFFIX,speedtest.net,DIRECT
  - DOMAIN-SUFFIX,sspai.com,DIRECT
  - DOMAIN-SUFFIX,suning.com,DIRECT
  - DOMAIN-SUFFIX,taobao.com,DIRECT
  - DOMAIN-SUFFIX,tencent.com,DIRECT
  - DOMAIN-SUFFIX,tenpay.com,DIRECT
  - DOMAIN-SUFFIX,tianyancha.com,DIRECT
  - DOMAIN-SUFFIX,tmall.com,DIRECT
  - DOMAIN-SUFFIX,tudou.com,DIRECT
  - DOMAIN-SUFFIX,umetrip.com,DIRECT
  - DOMAIN-SUFFIX,upaiyun.com,DIRECT
  - DOMAIN-SUFFIX,upyun.com,DIRECT
  - DOMAIN-SUFFIX,veryzhun.com,DIRECT
  - DOMAIN-SUFFIX,weather.com,DIRECT
  - DOMAIN-SUFFIX,weibo.com,DIRECT
  - DOMAIN-SUFFIX,xiami.com,DIRECT
  - DOMAIN-SUFFIX,xiami.net,DIRECT
  - DOMAIN-SUFFIX,xiaomicp.com,DIRECT
  - DOMAIN-SUFFIX,ximalaya.com,DIRECT
  - DOMAIN-SUFFIX,xmcdn.com,DIRECT
  - DOMAIN-SUFFIX,xunlei.com,DIRECT
  - DOMAIN-SUFFIX,yhd.com,DIRECT
  - DOMAIN-SUFFIX,yihaodianimg.com,DIRECT
  - DOMAIN-SUFFIX,yinxiang.com,DIRECT
  - DOMAIN-SUFFIX,ykimg.com,DIRECT
  - DOMAIN-SUFFIX,youdao.com,DIRECT
  - DOMAIN-SUFFIX,youku.com,DIRECT
  - DOMAIN-SUFFIX,zealer.com,DIRECT
  - DOMAIN-SUFFIX,zhihu.com,DIRECT
  - DOMAIN-SUFFIX,zhimg.com,DIRECT
  - DOMAIN-SUFFIX,zimuzu.tv,DIRECT
  - DOMAIN-KEYWORD,netflix,CroLAX
  - DOMAIN-KEYWORD,nflx,CroLAX
  ## 抗 DNS 污染
  - DOMAIN-KEYWORD,amazon,CroLAX
  - DOMAIN-KEYWORD,google,CroLAX
  - DOMAIN-KEYWORD,gmail,CroLAX
  - DOMAIN-KEYWORD,youtube,CroLAX
  - DOMAIN-KEYWORD,facebook,CroLAX
  - DOMAIN-SUFFIX,fb.me,CroLAX
  - DOMAIN-SUFFIX,fbcdn.net,CroLAX
  - DOMAIN-KEYWORD,twitter,CroLAX
  - DOMAIN-KEYWORD,instagram,CroLAX
  - DOMAIN-KEYWORD,dropbox,CroLAX
  - DOMAIN-SUFFIX,twimg.com,CroLAX
  - DOMAIN-KEYWORD,blogspot,CroLAX
  - DOMAIN-SUFFIX,youtu.be,CroLAX
  - DOMAIN-KEYWORD,whatsapp,CroLAX
  - DOMAIN-KEYWORD,googleapis,CroLAX
# Clubhouse
  - DOMAIN-SUFFIX,clubhouse.com,CroLAX
  - DOMAIN-SUFFIX,clubhouseapi.com,CroLAX
  - DOMAIN-SUFFIX,joinclubhouse.com,CroLAX
  - DOMAIN-SUFFIX,clubhouseprod.s3.amazonaws.com,CroLAX
  - DOMAIN-SUFFIX,clubhouse.pubnub.com,CroLAX

  - DOMAIN-SUFFIX, ap-oversea-tls.agora.io, DIRECT
  - DOMAIN-SUFFIX, ap-oversea.agora.io, DIRECT
  - DOMAIN-SUFFIX, ap-oversea2.agora.io, DIRECT
  - DOMAIN-SUFFIX, report-oversea.agora.io, DIRECT
  - IP-CIDR, 3.0.163.78/32, DIRECT
  - IP-CIDR, 13.230.60.35/32, DIRECT
  - IP-CIDR, 23.248.191.103/32, DIRECT
  - IP-CIDR, 23.248.191.105/32, DIRECT
  - IP-CIDR, 23.98.43.152/32, DIRECT
  - IP-CIDR, 35.178.208.187/32, DIRECT
  - IP-CIDR, 45.40.48.11/32, DIRECT
  - IP-CIDR, 45.255.124.98/32, DIRECT
  - IP-CIDR, 45.255.124.100/32, DIRECT
  - IP-CIDR, 45.255.124.101/32, DIRECT
  - IP-CIDR, 45.255.124.104/32, DIRECT
  - IP-CIDR, 45.255.124.105/32, DIRECT
  - IP-CIDR, 45.255.124.107/32, DIRECT
  - IP-CIDR, 45.255.124.108/32, DIRECT
  - IP-CIDR, 45.255.124.109/32, DIRECT
  - IP-CIDR, 45.255.124.135/32, DIRECT
  - IP-CIDR, 50.17.126.121/32, DIRECT
  - IP-CIDR, 52.52.84.170/32, DIRECT
  - IP-CIDR, 52.58.56.244/32, DIRECT
  - IP-CIDR, 52.194.158.59/32, DIRECT
  - IP-CIDR, 52.221.46.208/32, DIRECT
  - IP-CIDR, 54.178.26.110/32, DIRECT
  - IP-CIDR, 69.28.51.148/32, DIRECT
  - IP-CIDR, 103.59.49.10/32, DIRECT
  - IP-CIDR, 103.65.41.166/32, DIRECT
  - IP-CIDR, 103.65.41.169/32, DIRECT
  - IP-CIDR, 103.98.18.181/32, DIRECT
  - IP-CIDR, 103.98.18.183/32, DIRECT
  - IP-CIDR, 103.98.18.184/32, DIRECT
  - IP-CIDR, 103.98.18.189/32, DIRECT
  - IP-CIDR, 120.227.115.126/32, DIRECT
  - IP-CIDR, 122.10.255.165/32, DIRECT
  - IP-CIDR, 128.1.87.196/32, DIRECT
  - IP-CIDR, 129.227.71.203/32, DIRECT
  - IP-CIDR, 129.227.115.130/32, DIRECT
  - IP-CIDR, 148.153.126.146/32, DIRECT
  - IP-CIDR, 148.153.172.73/32, DIRECT
  - IP-CIDR, 148.153.172.74/32, DIRECT
  - IP-CIDR, 148.153.172.75/32, DIRECT
  - IP-CIDR, 148.153.172.76/32, DIRECT
  - IP-CIDR, 148.153.172.77/32, DIRECT
  - IP-CIDR, 164.52.0.244/32, DIRECT
  - IP-CIDR, 164.52.6.19/32, DIRECT
  - IP-CIDR, 164.52.6.21/32, DIRECT
  - IP-CIDR, 164.52.6.23/32, DIRECT
  - IP-CIDR, 164.52.6.24/32, DIRECT
  - IP-CIDR, 164.52.6.25/32, DIRECT
  - IP-CIDR, 164.52.32.57/32, DIRECT
  - IP-CIDR, 164.52.32.59/32, DIRECT
  - IP-CIDR, 164.52.32.60/32, DIRECT
  - IP-CIDR, 164.52.36.228/32, DIRECT
  - IP-CIDR, 164.52.36.232/32, DIRECT
  - IP-CIDR, 164.52.36.238/32, DIRECT
  - IP-CIDR, 164.52.36.243/32, DIRECT
  - IP-CIDR, 164.52.36.245/32, DIRECT
  - IP-CIDR, 164.52.36.254/32, DIRECT
  - IP-CIDR, 164.52.102.35/32, DIRECT
  - IP-CIDR, 164.52.102.66/32, DIRECT
  - IP-CIDR, 164.52.102.67/32, DIRECT
  - IP-CIDR, 164.52.102.68/32, DIRECT
  - IP-CIDR, 164.52.102.69/32, DIRECT
  - IP-CIDR, 164.52.102.70/32, DIRECT
  - IP-CIDR, 164.52.102.75/32, DIRECT
  - IP-CIDR, 164.52.102.76/32, DIRECT
  - IP-CIDR, 164.52.102.77/32, DIRECT
  - IP-CIDR, 164.52.102.91/32, DIRECT
  - IP-CIDR, 164.52.124.102/32, DIRECT
  - IP-CIDR, 199.190.44.36/32, DIRECT
  - IP-CIDR, 199.190.44.37/32, DIRECT
  - IP-CIDR, 202.181.136.106/32, DIRECT
  - IP-CIDR, 202.226.25.162/32, DIRECT
  - IP-CIDR, 202.226.25.166/32, DIRECT
  - IP-CIDR, 202.226.25.171/32, DIRECT
  - IP-CIDR, 202.226.25.195/32, DIRECT
  - IP-CIDR, 202.226.25.198/32, DIRECT
  - IP-CIDR, 129.227.57.143/32, DIRECT
  - IP-CIDR, 129.227.234.70/32, DIRECT
  - IP-CIDR, 129.227.234.82/32, DIRECT
  - IP-CIDR, 129.227.234.119/32, DIRECT
  - IP-CIDR, 129.227.71.144/32, DIRECT
  - IP-CIDR, 129.227.57.132/32, DIRECT
  - IP-CIDR, 129.227.57.134/32, DIRECT
  - IP-CIDR, 129.227.57.145/32, DIRECT
  - IP-CIDR, 129.227.71.141/32, DIRECT
  - IP-CIDR, 129.227.234.83/32, DIRECT
  - IP-CIDR, 129.227.71.142/32, DIRECT
  - IP-CIDR, 129.227.71.132/32, DIRECT
  - IP-CIDR, 129.227.71.133/32, DIRECT
  - IP-CIDR, 129.227.71.134/32, DIRECT
  - IP-CIDR, 129.227.234.67/32, DIRECT
  - IP-CIDR, 129.227.234.110/32, DIRECT
  - IP-CIDR, 129.227.234.112/32, DIRECT
  - IP-CIDR, 129.227.234.124/32, DIRECT
  - IP-CIDR, 129.227.71.140/32, DIRECT
  - IP-CIDR, 129.227.71.130/32, DIRECT
  - IP-CIDR, 129.227.71.131/32, DIRECT
  - IP-CIDR, 129.227.71.143/32, DIRECT
  - IP-CIDR, 129.227.156.17/32, DIRECT
  - IP-CIDR, 129.227.57.137/32, DIRECT
  - IP-CIDR, 129.227.156.20/32, DIRECT
  ## 国外网站
  - DOMAIN-SUFFIX,openai.com,CroLAX
  - DOMAIN-SUFFIX,9to5mac.com,CroLAX
  - DOMAIN-SUFFIX,abpchina.org,CroLAX
  - DOMAIN-SUFFIX,adblockplus.org,CroLAX
  - DOMAIN-SUFFIX,adobe.com,CroLAX
  - DOMAIN-SUFFIX,alfredapp.com,CroLAX
  - DOMAIN-SUFFIX,amplitude.com,CroLAX
  - DOMAIN-SUFFIX,ampproject.org,CroLAX
  - DOMAIN-SUFFIX,android.com,CroLAX
  - DOMAIN-SUFFIX,angularjs.org,CroLAX
  - DOMAIN-SUFFIX,aolcdn.com,CroLAX
  - DOMAIN-SUFFIX,apkpure.com,CroLAX
  - DOMAIN-SUFFIX,appledaily.com,CroLAX
  - DOMAIN-SUFFIX,appshopper.com,CroLAX
  - DOMAIN-SUFFIX,appspot.com,CroLAX
  - DOMAIN-SUFFIX,arcgis.com,CroLAX
  - DOMAIN-SUFFIX,archive.org,CroLAX
  - DOMAIN-SUFFIX,armorgames.com,CroLAX
  - DOMAIN-SUFFIX,aspnetcdn.com,CroLAX
  - DOMAIN-SUFFIX,att.com,CroLAX
  - DOMAIN-SUFFIX,awsstatic.com,CroLAX
  - DOMAIN-SUFFIX,azureedge.net,CroLAX
  - DOMAIN-SUFFIX,azurewebsites.net,CroLAX
  - DOMAIN-SUFFIX,bing.com,CroLAX
  - DOMAIN-SUFFIX,bintray.com,CroLAX
  - DOMAIN-SUFFIX,bit.com,CroLAX
  - DOMAIN-SUFFIX,bit.ly,CroLAX
  - DOMAIN-SUFFIX,bitbucket.org,CroLAX
  - DOMAIN-SUFFIX,bjango.com,CroLAX
  - DOMAIN-SUFFIX,bkrtx.com,CroLAX
  - DOMAIN-SUFFIX,blog.com,CroLAX
  - DOMAIN-SUFFIX,blogcdn.com,CroLAX
  - DOMAIN-SUFFIX,blogger.com,CroLAX
  - DOMAIN-SUFFIX,blogsmithmedia.com,CroLAX
  - DOMAIN-SUFFIX,blogspot.com,CroLAX
  - DOMAIN-SUFFIX,blogspot.hk,CroLAX
  - DOMAIN-SUFFIX,bloomberg.com,CroLAX
  - DOMAIN-SUFFIX,box.com,CroLAX
  - DOMAIN-SUFFIX,box.net,CroLAX
  - DOMAIN-SUFFIX,cachefly.net,CroLAX
  - DOMAIN-SUFFIX,chromium.org,CroLAX
  - DOMAIN-SUFFIX,cl.ly,CroLAX
  - DOMAIN-SUFFIX,cloudflare.com,CroLAX
  - DOMAIN-SUFFIX,cloudfront.net,CroLAX
  - DOMAIN-SUFFIX,cloudmagic.com,CroLAX
  - DOMAIN-SUFFIX,cmail19.com,CroLAX
  - DOMAIN-SUFFIX,cnet.com,CroLAX
  - DOMAIN-SUFFIX,cocoapods.org,CroLAX
  - DOMAIN-SUFFIX,comodoca.com,CroLAX
  - DOMAIN-SUFFIX,crashlytics.com,CroLAX
  - DOMAIN-SUFFIX,culturedcode.com,CroLAX
  - DOMAIN-SUFFIX,d.pr,CroLAX
  - DOMAIN-SUFFIX,danilo.to,CroLAX
  - DOMAIN-SUFFIX,dayone.me,CroLAX
  - DOMAIN-SUFFIX,db.tt,CroLAX
  - DOMAIN-SUFFIX,deskconnect.com,CroLAX
  - DOMAIN-SUFFIX,disq.us,CroLAX
  - DOMAIN-SUFFIX,disqus.com,CroLAX
  - DOMAIN-SUFFIX,disquscdn.com,CroLAX
  - DOMAIN-SUFFIX,dnsimple.com,CroLAX
  - DOMAIN-SUFFIX,docker.com,CroLAX
  - DOMAIN-SUFFIX,dribbble.com,CroLAX
  - DOMAIN-SUFFIX,droplr.com,CroLAX
  - DOMAIN-SUFFIX,duckduckgo.com,CroLAX
  - DOMAIN-SUFFIX,dueapp.com,CroLAX
  - DOMAIN-SUFFIX,dytt8.net,CroLAX
  - DOMAIN-SUFFIX,edgecastcdn.net,CroLAX
  - DOMAIN-SUFFIX,edgekey.net,CroLAX
  - DOMAIN-SUFFIX,edgesuite.net,CroLAX
  - DOMAIN-SUFFIX,engadget.com,CroLAX
  - DOMAIN-SUFFIX,entrust.net,CroLAX
  - DOMAIN-SUFFIX,eurekavpt.com,CroLAX
  - DOMAIN-SUFFIX,evernote.com,CroLAX
  - DOMAIN-SUFFIX,fabric.io,CroLAX
  - DOMAIN-SUFFIX,fast.com,CroLAX
  - DOMAIN-SUFFIX,fastly.net,CroLAX
  - DOMAIN-SUFFIX,fc2.com,CroLAX
  - DOMAIN-SUFFIX,feedburner.com,CroLAX
  - DOMAIN-SUFFIX,feedly.com,CroLAX
  - DOMAIN-SUFFIX,feedsportal.com,CroLAX
  - DOMAIN-SUFFIX,fiftythree.com,CroLAX
  - DOMAIN-SUFFIX,firebaseio.com,CroLAX
  - DOMAIN-SUFFIX,flexibits.com,CroLAX
  - DOMAIN-SUFFIX,flickr.com,CroLAX
  - DOMAIN-SUFFIX,flipboard.com,CroLAX
  - DOMAIN-SUFFIX,g.co,CroLAX
  - DOMAIN-SUFFIX,gabia.net,CroLAX
  - DOMAIN-SUFFIX,geni.us,CroLAX
  - DOMAIN-SUFFIX,gfx.ms,CroLAX
  - DOMAIN-SUFFIX,ggpht.com,CroLAX
  - DOMAIN-SUFFIX,ghostnoteapp.com,CroLAX
  - DOMAIN-SUFFIX,git.io,CroLAX
  - DOMAIN-KEYWORD,github,CroLAX
  - DOMAIN-KEYWORD,linkedin,CroLAX
  - DOMAIN-SUFFIX,globalsign.com,CroLAX
  - DOMAIN-SUFFIX,gmodules.com,CroLAX
  - DOMAIN-SUFFIX,godaddy.com,CroLAX
  - DOMAIN-SUFFIX,golang.org,CroLAX
  - DOMAIN-SUFFIX,gongm.in,CroLAX
  - DOMAIN-SUFFIX,goo.gl,CroLAX
  - DOMAIN-SUFFIX,goodreaders.com,CroLAX
  - DOMAIN-SUFFIX,goodreads.com,CroLAX
  - DOMAIN-SUFFIX,gravatar.com,CroLAX
  - DOMAIN-SUFFIX,gstatic.com,CroLAX
  - DOMAIN-SUFFIX,gvt0.com,CroLAX
  - DOMAIN-SUFFIX,hockeyapp.net,CroLAX
  - DOMAIN-SUFFIX,hotmail.com,CroLAX
  - DOMAIN-SUFFIX,icons8.com,CroLAX
  - DOMAIN-SUFFIX,ift.tt,CroLAX
  - DOMAIN-SUFFIX,ifttt.com,CroLAX
  - DOMAIN-SUFFIX,iherb.com,CroLAX
  - DOMAIN-SUFFIX,imageshack.us,CroLAX
  - DOMAIN-SUFFIX,img.ly,CroLAX
  - DOMAIN-SUFFIX,imgur.com,CroLAX
  - DOMAIN-SUFFIX,imore.com,CroLAX
  - DOMAIN-SUFFIX,instapaper.com,CroLAX
  - DOMAIN-SUFFIX,ipn.li,CroLAX
  - DOMAIN-SUFFIX,is.gd,CroLAX
  - DOMAIN-SUFFIX,issuu.com,CroLAX
  - DOMAIN-SUFFIX,itgonglun.com,CroLAX
  - DOMAIN-SUFFIX,itun.es,CroLAX
  - DOMAIN-SUFFIX,ixquick.com,CroLAX
  - DOMAIN-SUFFIX,j.mp,CroLAX
  - DOMAIN-SUFFIX,js.revsci.net,CroLAX
  - DOMAIN-SUFFIX,jshint.com,CroLAX
  - DOMAIN-SUFFIX,jtvnw.net,CroLAX
  - DOMAIN-SUFFIX,justgetflux.com,CroLAX
  - DOMAIN-SUFFIX,kat.cr,CroLAX
  - DOMAIN-SUFFIX,klip.me,CroLAX
  - DOMAIN-SUFFIX,libsyn.com,CroLAX
  - DOMAIN-SUFFIX,linode.com,CroLAX
  - DOMAIN-SUFFIX,lithium.com,CroLAX
  - DOMAIN-SUFFIX,littlehj.com,CroLAX
  - DOMAIN-SUFFIX,live.com,CroLAX
  - DOMAIN-SUFFIX,live.net,CroLAX
  - DOMAIN-SUFFIX,livefilestore.com,CroLAX
  - DOMAIN-SUFFIX,llnwd.net,CroLAX
  - DOMAIN-SUFFIX,macid.co,CroLAX
  - DOMAIN-SUFFIX,macromedia.com,CroLAX
  - DOMAIN-SUFFIX,macrumors.com,CroLAX
  - DOMAIN-SUFFIX,mashable.com,CroLAX
  - DOMAIN-SUFFIX,mathjax.org,CroLAX
  - DOMAIN-SUFFIX,medium.com,CroLAX
  - DOMAIN-SUFFIX,mega.co.nz,CroLAX
  - DOMAIN-SUFFIX,mega.nz,CroLAX
  - DOMAIN-SUFFIX,megaupload.com,CroLAX
  - DOMAIN-SUFFIX,microsofttranslator.com,CroLAX
  - DOMAIN-SUFFIX,mindnode.com,CroLAX
  - DOMAIN-SUFFIX,mobile01.com,CroLAX
  - DOMAIN-SUFFIX,modmyi.com,CroLAX
  - DOMAIN-SUFFIX,msedge.net,CroLAX
  - DOMAIN-SUFFIX,myfontastic.com,CroLAX
  - DOMAIN-SUFFIX,name.com,CroLAX
  - DOMAIN-SUFFIX,nextmedia.com,CroLAX
  - DOMAIN-SUFFIX,nsstatic.net,CroLAX
  - DOMAIN-SUFFIX,nssurge.com,CroLAX
  - DOMAIN-SUFFIX,nyt.com,CroLAX
  - DOMAIN-SUFFIX,nytimes.com,CroLAX
  - DOMAIN-SUFFIX,omnigroup.com,CroLAX
  - DOMAIN-SUFFIX,onedrive.com,CroLAX
  - DOMAIN-SUFFIX,onenote.com,CroLAX
  - DOMAIN-SUFFIX,ooyala.com,CroLAX
  - DOMAIN-SUFFIX,openvpn.net,CroLAX
  - DOMAIN-SUFFIX,openwrt.org,CroLAX
  - DOMAIN-SUFFIX,orkut.com,CroLAX
  - DOMAIN-SUFFIX,osxdaily.com,CroLAX
  - DOMAIN-SUFFIX,outlook.com,CroLAX
  - DOMAIN-SUFFIX,ow.ly,CroLAX
  - DOMAIN-SUFFIX,paddleapi.com,CroLAX
  - DOMAIN-SUFFIX,parallels.com,CroLAX
  - DOMAIN-SUFFIX,parse.com,CroLAX
  - DOMAIN-SUFFIX,pdfexpert.com,CroLAX
  - DOMAIN-SUFFIX,periscope.tv,CroLAX
  - DOMAIN-SUFFIX,pinboard.in,CroLAX
  - DOMAIN-SUFFIX,pinterest.com,CroLAX
  - DOMAIN-SUFFIX,pixelmator.com,CroLAX
  - DOMAIN-SUFFIX,pixiv.net,CroLAX
  - DOMAIN-SUFFIX,playpcesor.com,CroLAX
  - DOMAIN-SUFFIX,playstation.com,CroLAX
  - DOMAIN-SUFFIX,playstation.com.hk,CroLAX
  - DOMAIN-SUFFIX,playstation.net,CroLAX
  - DOMAIN-SUFFIX,playstationnetwork.com,CroLAX
  - DOMAIN-SUFFIX,pushwoosh.com,CroLAX
  - DOMAIN-SUFFIX,rime.im,CroLAX
  - DOMAIN-SUFFIX,servebom.com,CroLAX
  - DOMAIN-SUFFIX,sfx.ms,CroLAX
  - DOMAIN-SUFFIX,shadowsocks.org,CroLAX
  - DOMAIN-SUFFIX,sharethis.com,CroLAX
  - DOMAIN-SUFFIX,shazam.com,CroLAX
  - DOMAIN-SUFFIX,skype.com,CroLAX
  - DOMAIN-SUFFIX,smartdnsProxy.com,CroLAX
  - DOMAIN-SUFFIX,smartmailcloud.com,CroLAX
  - DOMAIN-SUFFIX,sndcdn.com,CroLAX
  - DOMAIN-SUFFIX,sony.com,CroLAX
  - DOMAIN-SUFFIX,soundcloud.com,CroLAX
  - DOMAIN-SUFFIX,sourceforge.net,CroLAX
  - DOMAIN-SUFFIX,spotify.com,CroLAX
  - DOMAIN-SUFFIX,squarespace.com,CroLAX
  - DOMAIN-SUFFIX,sstatic.net,CroLAX
  - DOMAIN-SUFFIX,st.luluku.pw,CroLAX
  - DOMAIN-SUFFIX,stackoverflow.com,CroLAX
  - DOMAIN-SUFFIX,startpage.com,CroLAX
  - DOMAIN-SUFFIX,staticflickr.com,CroLAX
  - DOMAIN-SUFFIX,steamcommunity.com,CroLAX
  - DOMAIN-SUFFIX,symauth.com,CroLAX
  - DOMAIN-SUFFIX,symcb.com,CroLAX
  - DOMAIN-SUFFIX,symcd.com,CroLAX
  - DOMAIN-SUFFIX,tapbots.com,CroLAX
  - DOMAIN-SUFFIX,tapbots.net,CroLAX
  - DOMAIN-SUFFIX,tdesktop.com,CroLAX
  - DOMAIN-SUFFIX,techcrunch.com,CroLAX
  - DOMAIN-SUFFIX,techsmith.com,CroLAX
  - DOMAIN-SUFFIX,thepiratebay.org,CroLAX
  - DOMAIN-SUFFIX,theverge.com,CroLAX
  - DOMAIN-SUFFIX,time.com,CroLAX
  - DOMAIN-SUFFIX,timeinc.net,CroLAX
  - DOMAIN-SUFFIX,tiny.cc,CroLAX
  - DOMAIN-SUFFIX,tinypic.com,CroLAX
  - DOMAIN-SUFFIX,tmblr.co,CroLAX
  - DOMAIN-SUFFIX,todoist.com,CroLAX
  - DOMAIN-SUFFIX,trello.com,CroLAX
  - DOMAIN-SUFFIX,trustasiassl.com,CroLAX
  - DOMAIN-SUFFIX,tumblr.co,CroLAX
  - DOMAIN-SUFFIX,tumblr.com,CroLAX
  - DOMAIN-SUFFIX,tweetdeck.com,CroLAX
  - DOMAIN-SUFFIX,tweetmarker.net,CroLAX
  - DOMAIN-SUFFIX,twitch.tv,CroLAX
  - DOMAIN-SUFFIX,txmblr.com,CroLAX
  - DOMAIN-SUFFIX,typekit.net,CroLAX
  - DOMAIN-SUFFIX,ubertags.com,CroLAX
  - DOMAIN-SUFFIX,ublock.org,CroLAX
  - DOMAIN-SUFFIX,ubnt.com,CroLAX
  - DOMAIN-SUFFIX,ulyssesapp.com,CroLAX
  - DOMAIN-SUFFIX,urchin.com,CroLAX
  - DOMAIN-SUFFIX,usertrust.com,CroLAX
  - DOMAIN-SUFFIX,v.gd,CroLAX
  - DOMAIN-SUFFIX,vimeo.com,CroLAX
  - DOMAIN-SUFFIX,vimeocdn.com,CroLAX
  - DOMAIN-SUFFIX,vine.co,CroLAX
  - DOMAIN-SUFFIX,vivaldi.com,CroLAX
  - DOMAIN-SUFFIX,vox-cdn.com,CroLAX
  - DOMAIN-SUFFIX,vsco.co,CroLAX
  - DOMAIN-SUFFIX,vultr.com,CroLAX
  - DOMAIN-SUFFIX,w.org,CroLAX
  - DOMAIN-SUFFIX,w3schools.com,CroLAX
  - DOMAIN-SUFFIX,webtype.com,CroLAX
  - DOMAIN-SUFFIX,wikiwand.com,CroLAX
  - DOMAIN-SUFFIX,wikileaks.org,CroLAX
  - DOMAIN-SUFFIX,wikimedia.org,CroLAX
  - DOMAIN-SUFFIX,wikipedia.com,CroLAX
  - DOMAIN-SUFFIX,wikipedia.org,CroLAX
  - DOMAIN-SUFFIX,windows.com,CroLAX
  - DOMAIN-SUFFIX,windows.net,CroLAX
  - DOMAIN-SUFFIX,wire.com,CroLAX
  - DOMAIN-SUFFIX,wordpress.com,CroLAX
  - DOMAIN-SUFFIX,workflowy.com,CroLAX
  - DOMAIN-SUFFIX,wp.com,CroLAX
  - DOMAIN-SUFFIX,wsj.com,CroLAX
  - DOMAIN-SUFFIX,wsj.net,CroLAX
  - DOMAIN-SUFFIX,xda-developers.com,CroLAX
  - DOMAIN-SUFFIX,xeeno.com,CroLAX
  - DOMAIN-SUFFIX,xiti.com,CroLAX
  - DOMAIN-SUFFIX,yahoo.com,CroLAX
  - DOMAIN-SUFFIX,yimg.com,CroLAX
  - DOMAIN-SUFFIX,ying.com,CroLAX
  - DOMAIN-SUFFIX,yoyo.org,CroLAX
  - DOMAIN-SUFFIX,ytimg.com,CroLAX
  - DOMAIN-SUFFIX,telegram.me,CroLAX
  - DOMAIN-SUFFIX,v2ex.com,CroLAX
  - DOMAIN-SUFFIX,poe.com,CroLAX
  - DOMAIN-SUFFIX,poecdn.net,CroLAX
  - DOMAIN-SUFFIX,quoracdn.net,CroLAX
  - IP-CIDR,91.108.4.0/22,CroLAX
  - IP-CIDR,91.108.8.0/22,CroLAX
  - IP-CIDR,91.108.56.0/22,CroLAX
  - IP-CIDR,109.239.140.0/24,CroLAX
  - IP-CIDR,149.154.160.0/20,CroLAX
  - IP-CIDR,127.0.0.0/8,DIRECT
  - IP-CIDR,172.16.0.0/12,DIRECT
  - IP-CIDR,192.168.0.0/16,DIRECT
  - IP-CIDR,10.0.0.0/8,DIRECT
  - IP-CIDR,17.0.0.0/8,DIRECT
  - IP-CIDR,100.64.0.0/10,DIRECT
  - GEOIP,CN,DIRECT
  - MATCH,CroLAX
```

## 效果

[Pix-Pin-2025-11-30-20-04-25.png](https://postimg.cc/NLrrFt6n)
