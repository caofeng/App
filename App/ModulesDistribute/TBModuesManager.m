//
//  TBModuesManager.m
//  Modules
//
//  Created by Topband on 2020/4/10.
//  Copyright © 2020 深圳拓邦股份有限公司. All rights reserved.
//

#import "TBModuesManager.h"

@implementation TBModuesManager

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = anInvocation.selector;
    for (Class targetClass in self.moduleApplicationClass) {
        id target = [[targetClass alloc] init];
        if ([target respondsToSelector:sel]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}
@end
