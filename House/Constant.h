
#ifndef Config_h
#define Config_h

/*
 宽高
 */
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define iPhoneX  [UIScreen mainScreen].bounds.size.height == 812
#define SafeAreaTopHeight (kScreenH == 812.0 ? 88 : 64)
#define TabbarHeight (kScreenH == 812.0 ? 83 : 49)

#define IPHONEX_MARGIN_TOP       24
#define IPHONEX_MARGIN_BOTTOM      34

#define systemVersion  [UIDevice currentDevice].systemVersion
/*
 中文字体
 */

#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]
#define Font(FontSize)                     [UIFont systemFontOfSize:FontSize]


///tableview一页页数
#define PageSize (@"10")
/*
 字体色彩
 */

#define COLOR_WORD_BLACK HEXCOLOR(0x333333)
#define COLOR_WORD_GRAY_1 HEXCOLOR(0x666666)
#define COLOR_WORD_GRAY_2 HEXCOLOR(0x999999)
#define COLOR_BLUE [UIColor colorWithRed:37/255.0 green:155/255.0 blue:240/255.0 alpha:1]

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]


#define APP_MAIN_COLOR [UIColor colorWithRed:51/255.0 green:161/255.0 blue:251/255.0 alpha:1]


/**
 NSLog 输出宏
 **/
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

/*
 showMessage
 */

#define showError(message) [MBProgressHUD showError:message ToView:nil];
#define showWarn(message) [MBProgressHUD showWarn:message ToView:nil];
#define showSuccess(message) [MBProgressHUD showSuccess:message ToView:nil];
#define showInfo(message) [MBProgressHUD showInfo:message ToView:nil];

#define ShowProgressHUD(aa) [MBProgressHUD showHUDAddedTo:aa animated:YES];
#define HideProgressHUD(bb) [MBProgressHUD hideHUDForView:bb animated:YES];

#define TosterMessage(message,vc) [ZJTipsAlertView showNotificationWithTitle:message controller:vc ];


//弱引用/强引用  可配对引用在外面用MPWeakSelf(self)，block用MPStrongSelf(self)  也可以单独引用在外面用MPWeakSelf(self) block里面用weakself
#define MPWeakSelf(type)  __weak typeof(type) weak##type = type;
#define MPStrongSelf(type)  __strong typeof(type) type = weak##type;


/*
 检测
 */
#define toInt(x)              (isNull(x) ? 0 : [x intValue])
#define StringOrNull(obj) (!isNull(obj) ? (obj) : @"")
//字符串是否为空
#define CheckString(string) ((string == nil || [string isKindOfClass:[NSNull class]]) ? @"" : string)
//字符串是否为空
#define isEmptyString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define isEmptyArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define isEmptyDictory(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)


//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define UserDefaults [NSUserDefaults standardUserDefaults]

#define pro kScreenW/375.0
/*
 AppDelegate对象
 */
#define AppDelegateInstance [[UIApplication sharedApplication] delegate]


#define UserSortPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user_sort.plist"]

#endif /* Config_h */
