# ss、ssr、v2ray链接解析

?> 网上有很多人会分享一些免费的 ss、ssr 免费账号，也有少数分享v2ray的；有的会直接把服务、端口、ip、协议等展示出来，直接手动输入相应参数就可以了，有的则直接显示二维码，直接用客户端软件扫一下就可以使用。<br><br>
不过，也有很多是直接以链接的形式展示出来，比如 ss://xxxxx 或 ssr://xxxx,对于这种链接的方式，复制链接后，直接使用ss 、ssr客户端右键从粘贴板导入url链接即可。



## SS链接

以ss链接为例，链接如下：

`ss://YWVzLTI1Ni1jZmI6S1NYTmhuWnBqd0M2UGM2Q0A1NC4xNjkuMzUuMjI4OjMxNDQ0`

用[base64解码站长工具](http://tool.chinaz.com/Tools/Base64.aspx)（此工具存在和谐因素，仅为演示方便）进行解码

![](https://i.postimg.cc/W3Vkrt3d/2018-06-07-131159x.png)

![](https://i.postimg.cc/ZKny6GTx/2018-06-07-132540.png)

从这两幅图也不难看出格式其实是这样的 `ss://method:password@server:port`，按照这个格式的写法并进行base64编码，就能将ss分享给对方使用。

![](https://i.postimg.cc/fT1kmkqM/2018-06-07-142343.png)

若是分享二维码，可以用[二维码生成器](https://www.qrstuff.com/)将ss链接嵌入二维码中扫描分享

![](https://i.postimg.cc/7hGwZnk0/2018-06-07-141818.png)

## SSR链接

再来看ssr的url，链接如下：

```text
ssr://NjQuMTM3LjIyOC4zNTo1NzYwOmF1dGhfc2hhMV92NDpjaGFjaGEyMDp0bHMxLjJfdGlja2V0X2F1dGg6Wkc5MVlpNXBieTl6YzNwb1puZ3ZLalUzTmpBLz9yZW1hcmtzPTVweXM1WVdONkxTNTZMU201WS0zNXAybDZJZXFPbVJ2ZFdJdWFXOHZjM042YUdaNEx3
```

使用[base64工具](https://1024tools.com/base64)解码

![](https://i.postimg.cc/cJzsyzq0/2018-06-07-145222.png)

 字符串包含`–`，需在解码前把`–`这个字符通通替换为`+`字符

![](https://i.postimg.cc/3wzHbDpw/2018-06-07-150006.png)

效果如下

![](https://i.postimg.cc/Jzgg1Ch6/2018-06-07-150327.png)

再来看ssr链接导入的截图

![](https://i.postimg.cc/4NyBn2qr/2018-06-07-150608.png)

由此得知，格式如下

`ssr://ip:port:protocol:method:blending:password/?remarks=other text`

有时也会看到部分解码后，这样的格式

`159.65.1.189:5252:auth_sha1_v4:rc4-md5:http_simple:NTJzc3IubmV0/?obfsparam=&protoparam=&group=d3d3LnNzcnNoYXJlLmNvbQ&remarks=RE1fTm9kZQ`

这其中`obfsparam`、`protoparam`、`group`、`remarks`等都是可选的，也可不填。

![](https://i.postimg.cc/76PSdfyp/2018-06-07-160125.png)

## v2ray链接

其实v2ray链接与相关二维码生成与上述方法是差不多的，只是配置参数格式大同小异而已。v2ray不像ss那样有统一规定的url格式，所以各个v2ray图形客户端的分享链接或是二维码不一定通用

v2ray的链接如下

```
vmess://ew0KICAicHMiOiAicnVzc2lhbi1jbG91ZCIsDQogICJhZGQiOiAiMTg1LjE3Ny4yMTYuMTM0IiwNCiAgInBvcnQiOiAiMjI1MzUiLA0KICAiaWQiOiAiNTIwNTAwNTctZjVlMS00YjllLWI3OGItNWY0OWI1NDlmZDIxIiwNCiAgImFpZCI6ICI2NCIsDQogICJuZXQiOiAia2NwIiwNCiAgInR5cGUiOiAic3J0cCIsDQogICJob3N0IjogIiIsDQogICJ0bHMiOiAiIg0KfQ==
```

进行base64解码之后再对比v2ray客户端的参数配置就显得一目了然

![](https://i.postimg.cc/85sbKtW2/2018-06-08-223349.png)

可以说大体是这么一个格式

```json
{
  "ps": "别名",
  "add": "ip地址",
  "port": "端口",
  "id": "uuid",
  "aid": "alterid",
  "net": "传输协议",
  "type": "伪装类型",
  "host": " http header参数",
  "tls": "底层传输安全"
}
```

 除别名外，可以说服务器与客户端的参数必须要相互对应，别名、留空的是可以省略的。按照这个相关格式生成base64编码。

![](https://i.postimg.cc/pXBnjK5z/2018-06-08-233637.png)

在base64编码首部加上`vmess://`协议头

```text
vmess://ewogICJhZGQiOiAiMTg1LjE3Ny4yMTYuMTM0IiwKICAicG9ydCI6ICIyMjUzNSIsCiAgImlkIjogIjUyMDUwMDU3LWY1ZTEtNGI5ZS1iNzhiLTVmNDliNTQ5ZmQyMSIsCiAgImFpZCI6ICI2NCIsCiAgIm5ldCI6ICJrY3AiLAogICJ0eXBlIjogInNydHAiCn0=
```

将其导入至v2ray客户端，在服务器未作其他相关变更时，即可成功连接服务器。

![](https://i.postimg.cc/mDTvPxvQ/2018-06-08-235033.png)

当然添加别名更好，这样就能v2ray客户端就能自动生成相应的v2ray链接

![](https://i.postimg.cc/cLX9FK28/2018-06-08-235553.png)

## SSR对SS的兼容

至于ssr与ss兼容性的问题参考逗比的解答

> 原文：[关于Shadowsocks的小白常见问题](https://doub.io/ss-jc35/) 作者：[逗比](https://doub.io/author/toyo/)

> **取消协议兼容原版后，**当你的ShadowsocksR服务端配置了**协议**后，只能ShadowsocksR的客户端**选择对应的协议才可以连接**\(SSR客户端选择原版协议也是无法连接\)，而使用Shadowsocks原版客户端无法连接。

> 只有你设置ShadowsocksR服务端的协议为**原版\(origin\)**，那么才能ShadowsocksR客户端\(选择原版协议\)和Shadowsocks客户端都能链接你的ShadowsocksR服务端\(账号\)。

> 目前ShadowsocksR服务端是，**auth\_aes128\_\*** 及以后的协议 都不支持兼容原版了，之前的协议可以兼容原版，混淆也都可以兼容原版。

> 当然了，这只针对 ShadowsocksR的协议，对于混淆参数是无所谓的，协议和混淆是可以分开的，你可以协议不设置兼容原版，而混淆设置兼容原版，或者不设置协议，而只设置混淆兼容原版，都可以，不存在协议开了，混淆也必须开的问题。

总而言之，ssr可以使用ss的服务器，但ss使用ssr的服务器的话，却未必行得通；顺便也多说一句：ssr是可使用ss链接与扫描二维码的（别没事整什么动态的短链接就行了...），反之则不生效。

我个人认为ssr倒像一个ss的升级版，是这样的一个关系：

![](https://i.postimg.cc/1RrpGkL8/2018-06-08-011429.png)

在了解这些，那么开始进行演示，打开[ssrshare论坛的小工具网页](https://tool.ssrshare.com/tool/free_ssr)

![](https://i.postimg.cc/7hjDGsMw/2018-06-08-014905.png)

图中的origin协议、plain混淆都是支持原版ss的，选择其中一个进行复制ss链接

![](https://i.postimg.cc/t70QC1pg/2018-06-08-020234.png)

将其解码

![](https://i.postimg.cc/VN58gPGm/2018-06-08-023014.png)

由于我们得知ss与ssr的链接格式：

`ss://method:password@server:port`

`ssr://ip:port:protocol:method:blending:password`

将解码后的ss的格式转成ssr的格式

![](https://i.postimg.cc/vZ2RcSQj/2018-06-08-024019.png)

对其编码

![](https://i.postimg.cc/zfhd8d3T/2018-06-08-024834.png)

加入`ssr://`链接协议头，再导入至ssr并不成功，原因是密码都套上一层base64编码...因此需要对密码进行一次编码

![](https://i.postimg.cc/jdJn8B16/2018-06-08-030909.png)

之后，按照原有格式将部分参数配置粘贴至密码前，进行编码

![](https://i.postimg.cc/d0J7V3Vn/2018-06-08-031437.png)

再加入`ssr://`链接协议头，导入至ssr即可如：

`ssr://MTM5LjU5LjE2Ny4yNDY6NjIwMzpvcmlnaW46YWVzLTI1Ni1jZmI6cGxhaW46YVM1M2RYY3VjbVZr`

![](https://i.postimg.cc/x1nHctsK/2018-06-08-032054.png)

## v2ray对ss的兼容

ss连接v2ray的服务器，需在v2ray服务端做相应的ss兼容配置；至于v2ray连接其本身兼容ss的服务器，可能需要配置uuid等验证机制。

> 配置参数摘录自：[V2Ray替换shadowsocks服务器详解](https://www.daehub.com/archives/2156.html) 作者：[大隐中心](https://www.daehub.com/)

```json
"inboundDetour": [
{
    "protocol": "shadowsocks", // 开启 Shadowsocks
    "port": 30001, // 监听 30001 端口
    "settings": {
    "method": "aes-256-cfb", // 加密方式，支持 aes-256-cfb 和 aes-128-cfb
    "password": "v2ray", // 密码，必须和客户端相同
    "udp": false // 是否开启 UDP 转发
  }
  },
  {
    "protocol": "shadowsocks", // 开启 Shadowsocks
    "port": 30002, // 监听 30002 端口，由于 Shadowsocks 的限制，多用户的时候只能开多个端口
    "settings": { // 配置和上述类似
    "method": "aes-256-cfb",
    "password": "v2ray-2",
    "udp": false
  }
}
],
```




