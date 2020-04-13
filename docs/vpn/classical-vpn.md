## tunsafe

> 使用 [WireGuard](https://zh.wikipedia.org/zh-cn/WireGuard) 协议的高性能且安全的VPN客户端。TunSafe使在Windows和Linux之间设置极其快速且安全的VPN隧道非常简单。 [摘自官网介绍](https://tunsafe.com)。有兴趣的话，可了解下[虚拟网卡 TUN/TAP 驱动程序设计原理 - IBM dev](https://www.ibm.com/developerworks/cn/linux/l-tuntap/index.html)、[TUN与TAP wiki](https://zh.wikipedia.org/zh-hans/TUN%E4%B8%8ETAP)

进入[tunsafe官网](https://tunsafe.com/)，可以看到此外它还提供独立的虚拟网卡和软件（集合安装器需要全局翻墙环境），然后下载并安装这两个文件。

![](https://i.postimg.cc/1XRCdppx/20190607083401.png)

安装很简单，默认就行；注意勾选下始终信任项目就好了。

![](https://i.postimg.cc/Z5LLG954/20190607083553.png)

在 `user guide` 选择 `using tunsafe windows`接着再选择`free vpn servers`

![](https://i.postimg.cc/7LKsW3r8/20190606205200.png)

点击 `create new account`，选择服务器，然后生成下载该配置文件，**建议下载多个配置文件测试连接效果**。

![](https://i.postimg.cc/63NrzTyJ/20190606205536.png)

也可以在 [mullvad](https://www.mullvad.net) 中选择`取得账户`-> `验证` -> `WireGuard configuration generator`

![](https://i.postimg.cc/C1b528w4/20190607084331.png)

选择服务器并下载

![](https://i.postimg.cc/CxnYmCWV/20190607084522.png)

打开软件在`File`项中选择`browse in explorer` 就会打开软件配置目录源

![](https://i.postimg.cc/hv8Qj0rf/Snipaste-2019-06-06-21-11-36.png)

将下载好的conf导入到该目录

![](https://i.postimg.cc/SRYVwsqj/20190607092202.png)

如果连接不上，那换一个服务器连接测试，即可

!> 也有可能存在恶意禁用的问题，详情请看：[简谈国产杀软 - 恶意禁用连接互联网服务问题](append/guochan-sharuan?id=恶意禁用连接互联网服务问题)

![](https://i.postimg.cc/T3RbDfrP/Snipaste-2019-06-07-08-54-24.png)


## GateVPN

!>重点且易被封杀的对象，需要选择合适的协议与连接方式并时常更新列表与软件，否则连接成功率极低，对协议间的了解与如何选择，[相关细节，请点击这里](4vpn.md)

> 原列表出处：[泡泡](https://pao-pao.net/article/82)，以及如何设置相关服务器连接方式，[GateVPN官网列表](http://www.vpngate.net/cn/)已有说明

| gateVPN服务器连接方式 | 软件设置 | 平台适用 | 服务器支持 | 翻墙体验 |
| :-: | :-: | :-: | :-: | :-: |
| SSL-VPN | 一般 | 只windows平台 | 全部支持 | 最好 |
| L2TP/Ipsec-VPN | 简单 | win,mac,ios,android | 很少 | 较差 |
| openvpn | 复杂 | win,mac,ios,android | 极好 | 一般 |
| MS-SSTP | 最易 | 只windows平台 | 较好 | 最差 |

<!-- ![](https://ipfs.io/ipfs/QmQc1YoVQvszg1rNZscxwWJ7ZmBMmDZyvALyw3T5iYsRa4?4.gif) -->

![](https://i.postimg.cc/RZFb7zhp/Snipaste-2019-06-06-04-03-52.png)

## OpenVPN

!> 目前，已被GFW特征识别成为重点封杀的对象，连接成功率低，一些SSH站点也提供OpenVPN配置文件下载，因为极大多数国家并没有像中国封锁网络那么严格

进入[freeopenvpn.org](https://www.freeopenvpn.org/)，点击home查看服务器列表，`get access`、`download`皆可进入下载页面

<!-- ![](https://ipfs.io/ipfs/QmbkkgwTLEQGRWNEqWAvhnLkaNB5dVWNmZiLV1HYonVkwQ?1.png) -->

![](https://i.postimg.cc/fRkYHqMb/2018-04-29-012851.png)

导入文件后，运行 openVPN 连接互联网

