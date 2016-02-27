
// .h文件
/**
 *  定义一个宏，XMGSingletonH(name) 代替H文件中的share方法。
 *
 *  @param name 在宏中，字符串替换可以用“##”表示，传递一个name过来,生成自定义的share方法名称
 *
 *  @return <#return value description#>
 */
#define XMGSingletonH(name) + (instancetype)shared##name;

// .m文件
/**
 *  定义一个XMGSingletonM(name) 代替m文件中的单例实现逻辑。
 *
 *  @param name 定义一个宏，会默认默认后面一行的内容，如何替换后面多行的内容呢，"\"标记
 *
 *  @return <#return value description#>
 */
#define XMGSingletonM(name) \
static id _instance; \
 \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
 \
+ (instancetype)shared##name \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
 \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance; \
}