//
//  ViewController.m
//  IconfontDemo001
//
//  Created by zhangyan on 2018/5/21.
//  Copyright © 2018年 zhangyan. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+IconFont.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
 
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 300, 50)];
    // 字体使用下面对比出来的字体
    label.font = [UIFont fontWithName:@"iconfont" size:35];
    // 采用Unicode码进行
    label.text = @"下面展示的IconFont \U0000e77c  \U0000e77d  \U0000e781  \U0000e782  \U0000e787";
    label.textColor = [UIColor orangeColor];
    label.numberOfLines = 0;
    [label sizeToFit];
    [self.view addSubview:label];
    

    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 250, 100, 100)];
    imageView1.image = [UIImage imageWithIconFontName:@"iconfont" fontSize:80 text:@"\U0000e781" color:[UIColor greenColor]];
    imageView1.layer.borderColor = [UIColor redColor].CGColor;
    imageView1.layer.borderWidth = 1;
    imageView1.contentMode = UIViewContentModeCenter;
    [self.view addSubview:imageView1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, CGRectGetMaxY(imageView1.frame)+20, 100, 50);
    [btn setTitle:@"狮子" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:btn];
    
    UIImage *normalImage = [UIImage imageWithIconFontName:@"iconfont" fontSize:40 text:@"\U0000E784" color:[UIColor cyanColor]];
    [btn setImage:normalImage forState:UIControlStateNormal];
    
    
    
    
//    [self checkAll];
    
}
- (void)checkAll
{
    
    NSArray*familyNames = [UIFont familyNames];
    
    NSLog(@"familyNames.count === %ld",familyNames.count);
    
    for(NSString*familyName in familyNames ){
        
        printf("Family: %s \n", [familyName UTF8String]);
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end


