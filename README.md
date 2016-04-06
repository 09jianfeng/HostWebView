### 用法
注册

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //注册protocol
    [NSURLProtocol registerClass:[MyURLProtocolHostEdit class]];
    return YES;
}
```

添加host

```
- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = (UIWebView *)[self.view viewWithTag:10001];
    webView.delegate = self;
    webView.scrollView.bounces = NO;
    self.currenURL = [NSURL URLWithString:@"https://www.baidu.com/"];
    [MyURLProtocolHostEdit addHost:@"www.baidu.com" ip:@"14.215.177.37"];
    self.originRequest = [[NSMutableURLRequest alloc] initWithURL:self.currenURL];
    [webView loadRequest:self.originRequest];
}
```