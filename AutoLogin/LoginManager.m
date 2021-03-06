//
//  LoginManager.m
//  IvarList
//
//  Created by cnmobi on 2017/3/10.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "LoginManager.h"

@implementation LoginManager

static LoginManager *manager = nil;

#pragma mark - 单例唯一性

//创建单例
+ (instancetype)shareManager {

    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        if (!manager.user) {
        
            manager.user = [[User alloc] init];
        }
    });

    return manager;
}


//覆盖该方法主要确保当用户通过[[Singleton alloc] init]创建对象时对象的唯一性，alloc方法会调用该方法，只不过zone参数默认为nil，因该类覆盖了allocWithZone方法，所以只能通过其父类分配内存，即[super allocWithZone:zone]
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [super allocWithZone:zone];
        if (!manager.user) {
            
            manager.user = [[User alloc] init];
        }
    });
    
    return manager;
}

//覆盖该方法主要确保当用户通过copy方法产生对象时对象的唯一性
- (id)copy {
    
    return self;
}

//覆盖该方法主要确保当用户通过mutableCopy方法产生对象时对象的唯一性
- (id)mutableCopy {
    
    return self;
}



@end
