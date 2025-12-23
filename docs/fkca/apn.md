# APN

## APN 与移动网络的连接流程（简化版）

1. 手机开启移动数据 → 向运营商网络发送连接请求，附带 APN 配置。
2. 运营商的核心网（SGSN/MME）收到 APN → 通过 DNS 解析找到对应的网关（GGSN/PGW）。
3. 网关根据 APN 决定：
    * 连接公网互联网（普通上网）
    * 连接企业专网（私有 APN）
    * 分配 IP、QoS（服务质量）、计费规则等

连接成功 → 手机获得 IP 地址，开始上网。

| 作用             | 说明                                                                 |
|------------------|----------------------------------------------------------------------|
| 标识接入路径     | 告诉运营商的网关（GGSN/PGW）设备要连接哪个外部网络（如互联网、MMS、WAP、企业专网等） |
| 分配 IP 地址     | 决定设备获得公网 IP 还是私网 IP，以及 IP 地址类型（动态/静态）       |
| 决定服务类型     | 区分普通上网、MMS、多媒体消息、定位服务等                           |
| 控制安全与路由   | 私网 APN 可实现数据直连企业内网、加密传输、防火墙隔离等             |
| 运营商区分       | 每个运营商的 APN 不同（如中国移动常用 cmnet、cmwap，中国联通 3gnet、uniwap，中国电信 ctnet、ctwap） |


没有正确的 APN 配置 → 无法使用移动数据（即使信号满格）。APN 是移动网络数据服务的“入口”，直接决定了设备能访问什么网络、速度、安全性、计费方式。大多数情况下，插入 SIM 卡后手机会自动配置正确的 APN（运营商推送），但换卡、换设备、用物联网卡、去国外漫游、需要专网时，可能需要手动设置或修改。


## 两张不同的网络传递

固定宽带网络

```mermaid
graph LR
    A[电脑] --> B[网线/Wi-Fi];
    B --> C[路由器];
    C --> D[光猫];
    D --> E[光纤];
    E --> F[运营商机房];
    F --> G[互联网];
    
    style A fill:#e1f5fe
    style G fill:#f1f8e9
```

移动通信网络


```mermaid
graph LR
    A[电脑带移动模块] --> B[无线信号];
    B --> C[基站];
    C --> D[移动核心网];
    D --> E[互联网];
    
    style A fill:#ffe0e0
    style C fill:#fff3e0
```


## 架构梳理

电脑、手机通过有线网络上网的完整技术架构图，涵盖了从设备到互联网的全过程


```mermaid
flowchart TD
    subgraph UserZone["用户区域"]
        direction LR
        Device1["电脑/智能设备<br>操作系统网络栈"]
        Device2["智能手机<br>双模：Wi-Fi+蜂窝"]
    end
    
    %% ========== 路径1：有线网络 ==========
    Device1 -->|"路径①: 有线网络<br>以太网帧/RJ45接口"| WiredPath
    
    subgraph WiredPath["有线接入路径"]
        Router1["家庭/企业路由器<br>NAT/DHCP/防火墙"]
        Modem["光猫/调制解调器<br>光电转换"]
    end
    
    Router1 -->|"网线<br>PPPoE/DHCP"| Modem
    
    %% ========== 路径2：Wi-Fi网络 ==========
    Device1 & Device2 -->|"路径②: Wi-Fi连接<br>802.11ac/ax协议"| WiFiAP["Wi-Fi接入点/路由器"]
    
    WiFiAP --> Router1
    
    %% ========== 路径3：移动数据网络 ==========
    Device2 -->|"路径③: 移动数据<br>需SIM卡/USIM"| MobilePath
    
    subgraph MobilePath["移动网络路径"]
        Radio["手机射频模块"]
        BS["基站<br>4G:eNodeB / 5G:gNB<br>无线信号覆盖"]
        RAN["无线接入网<br>基站控制器/汇聚"]
        MobileCore["移动核心网<br>MME:移动管理 HSS:用户数据库<br>SGW/PGW:数据网关"]
    end
    
    Radio -->|"无线信号<br>LTE/NR协议"| BS
    BS --> RAN
    RAN --> MobileCore
    
    %% ========== 运营商网络汇聚 ==========
    Modem -->|"光纤/DSL线<br>接入网"| ISP_A["运营商宽带接入网<br>OLT/DSLAM"]
    MobileCore -->|"通过PGW连接"| ISP_B["运营商IP核心网"]
    
    ISP_A --> BRAS["宽带接入服务器<br>BRAS<br>认证/计费/分配IP"]
    ISP_B --> BRAS
    
    %% ========== 互联网与VPN ==========
    BRAS --> Internet["公共互联网<br>Internet"]
    
    Internet --> Target["目标服务器<br>网站/应用/服务"]
    
    %% ========== VPN叠加层 ==========
    subgraph VPNLayer["VPN安全隧道（可选）"]
        V_Client["设备VPN客户端"]
        V_Tunnel["加密隧道<br>IPSec/OpenVPN/WireGuard"]
        V_Server["VPN服务器/网关"]
    end
    
    Device1 & Device2 --> V_Client
    V_Client --> V_Tunnel
    V_Tunnel --> V_Server
    V_Server --> Target
    
    %% ========== 关键协议栈 ==========
    subgraph ProtocolStack["关键协议栈（分层模型）"]
        P7["应用层<br>HTTP/HTTPS/DNS"]
        P4["传输层<br>TCP/UDP（端口）"]
        P3["网络层<br>IP（IPv4/IPv6）/路由"]
        P2["数据链路层<br>以太网/MAC/Wi-Fi/PPP"]
        P1["物理层<br>光纤/网线/无线电波"]
    end
    
    ProtocolStack -.->|"每层对应不同设备"| UserZone
    
    %% ========== 特殊连接方式 ==========
    subgraph SpecialPaths["特殊连接方式"]
        SP1["手机USB共享网络<br>手机作为调制解调器"]
        SP2["蓝牙网络共享<br>PAN"]
        SP3["卫星互联网<br>Starlink等"]
    end
    
    SP1 -->|"USB RNDIS协议"| Device1
    SP2 --> Device1
    SP3 -->|"卫星信号"| Satellite["卫星终端"]
    Satellite --> Internet
    
    %% ========== 认证与标识 ==========
    subgraph AuthSystem["认证与标识系统"]
        Auth1["有线/Wi-Fi认证:<br>PPPoE/802.1X/密码"]
        Auth2["移动网络认证:<br>SIM卡(IMSI/Ki)/5G-AKA"]
        Auth3["IP地址分配:<br>公网IP/CGNAT私网IP"]
    end
    
    Auth1 --> BRAS
    Auth2 --> MobileCore
    Auth3 --> BRAS
    
    %% ========== 设备标识 ==========
    subgraph DeviceID["设备唯一标识"]
        ID1["MAC地址<br>数据链路层"]
        ID2["IP地址<br>网络层"]
        ID3["IMSI（SIM卡）<br>移动网络"]
    end
    
    ID1 --> Device1
    ID2 --> Device1
    ID3 --> Device2

    %% ========== 样式美化 ==========
    classDef user fill:#e3f2fd
    classDef wired fill:#e8f5e8
    classDef mobile fill:#fff3e0
    classDef isp fill:#f3e5f5
    classDef internet fill:#e8eaf6
    classDef vpn fill:#ffebee
    classDef protocol fill:#f5f5f5
    classDef special fill:#fff8e1
    
    class UserZone,Device1,Device2 user
    class WiredPath,Modem,WiFiAP wired
    class MobilePath,Radio,BS mobile
    class ISP_A,ISP_B,BRAS isp
    class Internet,Target internet
    class VPNLayer vpn
    class ProtocolStack,AuthSystem,DeviceID protocol
    class SpecialPaths,SP1,SP2,SP3 special
```



