## Subconverter Docker

在 Docker 运行的 [Subconverter](https://github.com/tindy2013/subconverter)

支持:

- 把订阅地址转换为你想要的格式
- 订阅之外添加自建的代理
- 配置定义分流规则


## 文件目录

- 基础配置文件:
    - all_base.tpl: 需要修改 external-controller, secret
    - pref.ini: 需要修改 api_access_token, managed_config_prefix
- additional_proxies.yaml 文件: 添加订阅之外的额外代理
- config 配置目录: 新建代理组、匹配分流规则对应代理/代理组
    - default.ini: 默认
    - proxy_chain.ini: 包含链式代理
- profiles 档案目录: 输出格式配置
    - clash.ini: 输出 clash 格式
    - quanx.ini: 输出 quanx 格式(不支持链式代理)
- rules 分流规则目录: 自己维护的分流规则文件
    - *.list


## 使用方法

0.检查上面的配置文件目录，按自己需求改配置

1.配置订阅地址

在 profile 目录下修改订阅地址和 config 配置

2.docker 运行 subconverter

修改 CONFIG_DIR 为 subconverter_docker 目录路径后运行

```bash
CONFIG_DIR="/path/to/subconverter_docker"

docker run -d \
    -p 25500:25500 \
    --restart unless-stopped \
    -v $CONFIG_DIR/pref.ini:/base/pref.ini \
    -v $CONFIG_DIR/all_base.tpl:/base/base/all_base.tpl \
    -v $CONFIG_DIR:/base/my \
    --name subconverter tindy2013/subconverter
```

3.在浏览器打开下面 URL，预览配置信息，然后将获取到的订阅地址填入代理软件

```
http://docker_host_ip:25500/getprofile?name=my/profiles/clash.ini&token=$token
```

修改 name 为想要生成的目标的 profile 路径， token 在 pref.ini 中找。
