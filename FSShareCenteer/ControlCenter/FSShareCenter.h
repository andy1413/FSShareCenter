//
//  FSShareCenter.m
//  FSShareCenteer
//
//  Created by 王方帅 on 15/9/23.
//  Copyright (c) 2015年 王方帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WeiboSDK.h"

#define kShareFinishedNotification   @"kShareFinishedNotification"

@interface FSShareCenter : NSObject

+(FSShareCenter *)share;

+(void)registerShareSDK;

@property (nonatomic,strong) NSString   *imagePath;

-(void)shareToSocialPlatformWithType:(ShareType)type;

@end
