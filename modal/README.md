自定义ViewController modal转换动画
=============================


使用介绍：
------------------------

### 直接创建ViewController

        - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
                HMSecondViewController *second = [[HMSecondViewController alloc] init];
                second.view.backgroundColor = [UIColor redColor];
                //定义样式为自定义
                second.modalPresentationStyle = UIModalPresentationCustom;
                //设置代理
                second.transitioningDelegate = [HMTransition sharedtransition];
                [self presentViewController:second animated:YES completion:nil];
        }
### 通过storyboard方式创建
    1、连线的时候设置类型为modal(注意不是customer)
    2、在modal进去的controller的ViewDidload方法调用之前设置modal样式和transitioningDelegate;
    - (id)initWithCoder:(NSCoder *)decoder
    {
        if (self = [super initWithCoder:decoder]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = [HMTransition sharedtransition];
        }
        return self;
    }

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
    }


