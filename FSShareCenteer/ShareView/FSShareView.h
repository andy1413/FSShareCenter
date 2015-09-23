//
//  FSShareView.h
//  FSShareCenteer
//
//  Created by 王方帅 on 15/9/23.
//  Copyright (c) 2015年 王方帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSShareCenter.h"

@interface FSShareView : UIView
{
    IBOutlet UIView     *_weiboView;
    IBOutlet UIView     *_wechatView;
    IBOutlet UIView     *_timelineView;
    IBOutlet UIView     *_qqView;
    
    IBOutlet UIView     *_contentView;
    IBOutlet UIView     *_bgView;
}

-(void)showInView:(UIView *)view;

@end
