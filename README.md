# LeftTabBar
使用addChildViewController方法自定义左侧的TabBar，并实现点击子视图显示返回按钮的监听
使用[[NSNotificationCenter defaultCenter] addObserverForName:CSbackAction object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            self.baseBackbutton.hidden = NO;
        }];在HomeViewController里面监听是否是加载的下层页面，如果是显示返回按钮，如果不是就隐藏，点击返回按钮，一层一层的返回上个页面,//  切换各个标签内容
 - （void）replaceController：（UIViewController *）oldController newController：（UIViewController *）newController，如果是要添加点击下层显示返回键的事件就加的方法
