# config-scripts
我自己的各种配置脚本

## Linux自动化脚本

1. 修改ubuntu 14.04的主目录下的中文文件夹为英文文件夹
``` Bash
cd linux
./modify_chinese_directory.sh
```

2. 定时同步IP地址，2个小时检查一次
``` Bash
cd linux
./timer_ip.sh
```

3. 自动设置vim的配置文件
``` Bash
cd linux
./set_vim.sh
```

## Linux配置

1. 添加到本地别名列表中
``` Bash
cat linux/.bash_aliases >> ~/.bash_aliases
```

## 开发工具
1. eclipse
    1. java
        1. [zxwang2](config-scripts/devtool/eclipse/java/zxwang2)
        2. [wxyz](config-scripts/devtool/eclipse/java/wxyz)
2. idea
    1. ideaIU-14-key
3. sublime text
    1. sublime text 3的中文输入法支持 [详细](config-scripts/devtool/sublime/sublime.md)
4. vim

## Python脚本

1. 网络检查
    1. 访问其他机器的特定端口
    ``` Bash
    cd python/check_net
    ./req.py ip port
    ```
    
    2. 监听本地的一个端口
    ``` Bash
    cd python/check_net
    ./listen.py port
    ```