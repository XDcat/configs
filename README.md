# 配置文件

## 修改键盘映射
> 主要将左ctrl与caps互换，方便使用 vim


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
    
3. jupyter 中使用vim
    1. 安装 vim_binding 插件，具体见 https://github.com/lambdalisue/jupyter-vim-binding
    ```
    # Create required directory in case (optional)
    mkdir -p $(jupyter --data-dir)/nbextensions
    # Clone the repository
    cd $(jupyter --data-dir)/nbextensions
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
    # Activate the extension
    jupyter nbextension enable vim_binding/vim_binding
    ```

    2. 将左ctrl与caps互换，方便使用 vim

       在`~/.jupyter/custom/custom.js`创建`custom.js`，内容如下所示：

    ```
    // ctrl [：insert-》vim， vim-》jupyter
    require([
      'nbextensions/vim_binding/vim_binding',
      'base/js/namespace',
    ], function(vim_binding, ns) {
      // Add post callback
      vim_binding.on_ready_callbacks.push(function(){
        var km = ns.keyboard_manager;
        // Indicate the key combination to run the commands
        km.edit_shortcuts.add_shortcut('ctrl-[', CodeMirror.prototype.leaveInsertMode, true);
        km.edit_shortcuts.add_shortcut('shift-ctrl-[', CodeMirror.prototype.leaveNormalMode, true);

        // Update help
        km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
      });
    });
    ```

## python logging

提供两种使用的方式，一个是YAML类型的配置文件`python/log/logconfig.yaml`，还有一个写好的python文件`python/log/logconfig.py`。这里的话推荐，使用python文件的方式，通过调用其中的`setup_logging`函数，提供了默认和两种方式，具体的使用示例，见`/python/log/main.py`。

在实际的使用过程中，可能存在两种情况：

1. 在单个py或ipy文件中使用

   直接参考上述文件`main.py`即可。

2. 在项目中使用

   推荐使用写好的python文件，在入口函数导入`logconfig`函数，并在使用`setup_logging`方法初始化。在项目的其他位置，只需要直接使用`logging.getLogger()`的方式使用。默认会使用到`root`这个`Logger`，如果需要更多的层次，请自定义配置以及使用logging的多层日志结构。