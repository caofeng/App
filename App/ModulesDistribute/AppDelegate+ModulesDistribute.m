//
//  AppDelegate+ModulesDistribute.m
//  Modules
//
//  Created by Topband on 2020/4/10.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

#import "AppDelegate+ModulesDistribute.h"
#import "TBModuesManager.h"
#import <objc/runtime.h>

@interface AppDelegate ()

@property (nonatomic, strong)TBModuesManager *manager;

@end

@implementation AppDelegate (ModulesDistribute)

- (TBModuesManager *)manager {
    return objc_getAssociatedObject(self, "procy");
}

- (void)setManager:(TBModuesManager *)manager {
    objc_setAssociatedObject(self, "procy", manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        swizzleMethod([self class], @selector(application:didFinishLaunchingWithOptions:), @selector(swizzled_application:didFinishLaunchingWithOptions:));
        
        
        swizzleMethod([self class], @selector(applicationWillResignActive:), @selector(swizzled_applicationWillResignActive:));
        
        
        swizzleMethod([self class], @selector(applicationDidEnterBackground:), @selector(swizzled_applicationDidEnterBackground:));
        
        
        swizzleMethod([self class], @selector(applicationDidBecomeActive:), @selector(swizzled_applicationDidBecomeActive:));

        swizzleMethod([self class], @selector(applicationWillEnterForeground:), @selector(swizzled_applicationWillEnterForeground:));

        swizzleMethod([self class], @selector(applicationWillTerminate:), @selector(swizzled_applicationWillTerminate:));

        swizzleMethod([self class], @selector(applicationDidReceiveMemoryWarning:), @selector(swizzled_applicationDidReceiveMemoryWarning:));
        ///... 可随便添加其他Delegate函数
    });
}

- (BOOL)swizzled_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self swizzled_application:application didFinishLaunchingWithOptions:launchOptions];
    
    NSArray *arr = [self classConfirmWithProtocol:@protocol(UIApplicationDelegate)];
    NSLog(@"==实现UIApplicationDelegate协议的类===%@",arr);
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in arr) {
        if (![str isEqualToString:@"App.AppDelegate"]) {
            [array addObject:NSClassFromString(str)];
        }
    }
    
    self.manager = [[TBModuesManager alloc] init];
    self.manager.moduleApplicationClass = array;
    [self.manager performSelector:@selector(application:didFinishLaunchingWithOptions:) withObject:application withObject:launchOptions];
    
    return YES;
}

- (void)swizzled_applicationWillResignActive:(UIApplication *)application {
    [self swizzled_applicationWillResignActive:application];
    [self.manager performSelector:@selector(applicationWillResignActive:) withObject:application];
}
- (void)swizzled_applicationDidEnterBackground:(UIApplication *)application {
    [self swizzled_applicationDidEnterBackground:application];
    [self.manager performSelector:@selector(applicationDidEnterBackground:) withObject:application];
}

- (void)swizzled_applicationDidBecomeActive:(UIApplication *)application {
    [self swizzled_applicationDidBecomeActive:application];
    [self.manager performSelector:@selector(applicationDidBecomeActive:) withObject:application];
}

- (void)swizzled_applicationWillEnterForeground:(UIApplication *)application {
    [self swizzled_applicationWillEnterForeground:application];
    [self.manager performSelector:@selector(applicationWillEnterForeground:) withObject:application];
}

- (void)swizzled_applicationWillTerminate:(UIApplication *)application {
    [self swizzled_applicationWillTerminate:application];
    [self.manager performSelector:@selector(applicationWillTerminate:) withObject:application];
}

- (void)swizzled_applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [self swizzled_applicationDidReceiveMemoryWarning:application];
    [self.manager performSelector:@selector(applicationDidReceiveMemoryWarning:) withObject:application];
}

/// Method Change
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// 获取声明了某协议的类
- (NSArray <NSString *>*)classConfirmWithProtocol:(Protocol *)protocol {
    
    NSMutableArray *targetClasses = [NSMutableArray array];
    Class targetClass;
    int numClasses;
    Class *classes = NULL;
    classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
    if (numClasses > 0) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class)*numClasses);
        numClasses = objc_getClassList(classes, numClasses);
    }
    for (int i = 0; i < numClasses; ++i) {
        targetClass = classes[i];
        if (class_conformsToProtocol(targetClass, protocol)) {
//            [targetClasses addObject:[NSValue value:&targetClass withObjCType:@encode(Class)]];
            [targetClasses addObject:NSStringFromClass(targetClass)];
        }
    }
    free(classes);
    return [targetClasses copy];
}


@end
