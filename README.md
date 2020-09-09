# 配置文件

## 修改键盘映射
> 主要将左ctrl与caps互换，方便使用git


1. windows
    1. 打开注册表`cmd ->regedit`
    2. 路径`计算机 - local machine - sysytem - currentcontrolset - control - keyboard layout`
    3. 创建二进制文件`Scancode Map`
    4. 输入
        ```
        00 00 00 00  - 00 00 00 00
        03 00 00 00 - 1D 00 3A 00
        3A 00 1D 00 - 00 00 00 00
        ```
2. linux
    1. 创建文件`.Xmodmap`
    2. 输入
    ```
    ! 左 ctrl  -> 大小写锁定
    keycode 37 = Caps_Lock NoSymbol Caps_Lock
    ! 大小写锁定 -> 左 ctrl
    keycode 66 = Control_L NoSymbol Control_L
    ```
    3. 在 `.bashrc`中添加`if [ -f ~/.Xmodmap ]; then xmodmap ~/.Xmodmap; fi`
    
