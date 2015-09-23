//
//  ViewController.m
//  FSShareCenteer
//
//  Created by 王方帅 on 15/9/23.
//  Copyright (c) 2015年 王方帅. All rights reserved.
//

#import "ViewController.h"
#import "FSShareView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)shareButtonClick:(id)sender
{
    UIGraphicsBeginImageContext(_imageShareView.frame.size);
    
    [_imageShareView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = UIImageJPEGRepresentation(viewImage, 0.7);
        NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"icon.jpg"];
        [data writeToFile:path atomically:YES];
        NSLog(@"%@",path);
        [FSShareCenter share].imagePath = path;
        dispatch_async(dispatch_get_main_queue(), ^{
            FSShareView *shareView = [[[NSBundle mainBundle] loadNibNamed:@"FSShareView" owner:nil options:nil] firstObject];
            [shareView showInView:self.view];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
