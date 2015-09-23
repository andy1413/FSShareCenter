//
//  UIView+Frame.m
//  FSShareCenteer
//
//  Created by 王方帅 on 15/9/23.
//  Copyright (c) 2015年 王方帅. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

-(void)setX:(CGFloat)x{
    
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
    
}

-(void)setY:(CGFloat)y{
    
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
    
}


-(void)setWidth:(CGFloat)width{
    
    CGRect frame=self.frame;
    frame.size.width=width;
    self.frame=frame;
}

-(void)setHeight:(CGFloat)height{
    
    CGRect frame=self.frame;
    frame.size.height=height;
    self.frame=frame;
    
}

-(CGFloat)x{
    return self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

-(CGFloat)getFrame_right
{
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)getFrame_Bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

@end
