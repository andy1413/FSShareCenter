//
//  FSShareCenter.m
//  FSShareCenteer
//
//  Created by 王方帅 on 15/9/23.
//  Copyright (c) 2015年 王方帅. All rights reserved.
//

#import "FSShareCenter.h"

static FSShareCenter *_shareCenter = nil;

@implementation FSShareCenter

+(FSShareCenter *)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareCenter = [[FSShareCenter alloc] init];
    });
    return _shareCenter;
}

+(void)registerShareSDK
{
    [ShareSDK registerApp:@"api20"];
    
    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"   //微信APPID
                           appSecret:@"64020361b8ec4c99936c0e3999a9f249"  //微信APPSecret
                           wechatCls:[WXApi class]];
    
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    [ShareSDK  connectSinaWeiboWithAppKey:@"568898243"
                                appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                              redirectUri:@"http://www.sharesdk.cn"];
}

-(void)shareToSocialPlatformWithType:(ShareType)type
{
    //如果第二次还想弹出登陆框的时候，可以调用这句话
    [ShareSDK cancelAuthWithType:type];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"ShareSDK无比强大哦"
                                       defaultContent:@""
                                                image:[ShareSDK imageWithPath:_imagePath]
                                                title:@"演示Demo中的标题"
                                                  url:@"http://www.mob.com"
                                          description:@"测试DEMO正在制作中，欢迎大家观看"
                                            mediaType:SSPublishContentMediaTypeNews];
    //自定义UI分享
    [ShareSDK shareContent:publishContent
                      type:type
               authOptions:nil
              shareOptions:nil
             statusBarTips:YES
                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                        NSLog(@"%@",error.errorDescription);
                        if (state == SSPublishContentStateSuccess)
                        {
                            NSLog(@"发表成功");
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"分享成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                            [alert show];
                            [[NSNotificationCenter defaultCenter] postNotificationName:kShareFinishedNotification object:nil];
                        }
                        else if (state == SSPublishContentStateFail)
                        {
                            NSLog(@"发布失败!");
                            NSString *message = [NSString stringWithFormat:@"分享失败,%@",error.errorDescription];
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                            [alert show];
                            [[NSNotificationCenter defaultCenter] postNotificationName:kShareFinishedNotification object:nil];
                        }
                        
                    }];
}

@end
