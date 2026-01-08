# 开通虚拟信用卡摸索历程

## 免责声明

本书所有区块链相关数据与资料仅供用户学习及研究之用，不构成任何投资、法律等其他领域的建议和依据。 强烈建议您独自对内容进行研究、审查、分析和验证，谨慎使用相关数据及内容，并自行承担所带来的一切风险。

## 随言前置

因时间关系的原因，暂没空了解虚拟币是怎么像印钞机一样生产的，估计和挖矿八九不离十了。就留个标记吧。这些开卡商之所以用虚拟币的原因基本上也能推得出来一二了。

1. 保值：地缘政治国际关系使得美元兑换汇率波动较大
1. 规避审查，以及相关交易争议

## 信息提炼

过时教程：万里汇相关申请虚拟信用卡的教程、[【教程】免信用卡为cloudflare添加付款方式](https://www.nodeseek.com/post-84328-1)


重要教程：

* [星环无限 - 美国虚拟信用卡申请教学，超多支付场景，线上可开，人手必备！简单KYC|低费率|升级海外软件|绑定苹果ID(youtube)](https://www.youtube.com/watch?v=MfAe_cQjyh8)

参考教程：[数字移民指南](https://shuziyimin.net/)、[Tangent-Wei/crypto_info](https://github.com/Tangent-Wei/crypto_info)

准备工具：

* 过时教程提炼出来的网页工具
    * 信用卡号生成网站：[https://namso-gen.com](https://namso-gen.com/?tab=basic&network=random)
    * 信用卡校验测活网站：[https://www.mrchecker.net](https://www.mrchecker.net/card-checker/ccn2/)
    * 卡BIN查询网站：[https://bincheck.io/zh](https://bincheck.io/zh)
    * [美国地址生成器](https://www.meiguodizhi.com/)：
        * 免税州：俄勒冈州、特拉华州、新罕布什尔州、蒙大拿州、阿拉斯加州
* 信用卡最低开卡费 + 最低充值费：
    * 人民币兑换美元约7:1，虚拟币兑换美元目前基本等价（2025.11.13）
    * 准备约450-500块钱
* 虚拟信用卡开卡应用，binpay：https://app.binpay.cc/pages/passport/invitation?r=1121893
* 虚拟币交易所：[欧易](https://www.okx.com/zh-hans)


## 开卡成功过程关键展示


**这里的“注册完毕”包含在 Binpay 与欧易中完成手机、邮箱、身份证、人脸等全部认证。**

补充欧易使用视频教程：[YOUTUBE - 欧易教程，欧易怎么玩（中国大陆用户）？注册→充值→提现→交易——欧易注册教学欧易交易欧易注册欧易卖币欧易怎么使用欧易买币欧易充值欧易下载欧易提现欧易提现人民币欧易购买okex](https://www.youtube.com/watch?v=U94fVBRfcQA)


跟着 [星环无限 - 美国虚拟信用卡申请教学，超多支付场景，线上可开，人手必备！简单KYC|低费率|升级海外软件|绑定苹果ID](https://www.bilibili.com/video/BV15u2FBgEeT) 做一遍注册完binpay，然后注册欧易账号，并购买虚拟币。


购买虚拟币：以alipay为例：通过alipay id找到商家，将钱转账到对方账户后，截图交易成功记录及账单，上传支付记录，等待商家支付虚拟币。首次充值可以试着充值最低额度，摸索一两小时基本上也会了一点。

从欧易购买好虚拟币后，与binpay进行交易，步骤如图：

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_21-49-26.png)

过几分钟后，就会收到邮件及系统的转出成功提示

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_21-54-02.png)

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_22-24-31.png)

接着打开binpay，将充值到账的虚拟币，转换成美元

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_22-26-55.png)

这时钱包有了美元额度，就可以申请开卡了。

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_22-27-54.png)

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_22-29-06.png)

设置密码激活卡

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_22-30-58.png)


## 使用 cloud flare r2 服务信用卡资料填写

免税州见信息提炼部分，使用美国地址生成器 https://www.meiguodizhi.com ，填入邮寄信息等。

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_22-38-44.png)

r2 存储桶使用成功！

![](https://cdn.jsdelivr.net/gh/hoochanlon/picx-images-hosting@master/imgs/fkca/PixPin_2025-11-12_22-45-24.png)

## 红·黄·绿

在国内能用上海外的服务胜似蜀道难，难怪这么多人用支付宝收付款，原来是微信太容易触发风控了，迟早电话卡也会被限制，迟早也会成赛博北朝鲜。当刹那 Power 和艾滋病一样，通过母婴、血液和性传播，必然免不了折腾，都是为你好的宏大叙事，好东西，韭菜就是用不了，普通人不可能三角，也太典了。


