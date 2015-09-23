//
//  UIView+Frame.h
//  FSShareCenteer
//
//  Created by 王方帅 on 15/9/23.
//  Copyright (c) 2015年 王方帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property(nonatomic,readwrite) CGFloat x,y,width,height;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;

- (void)removeAllSubviews;

-(CGFloat)getFrame_right;
-(CGFloat)getFrame_Bottom;

@end
