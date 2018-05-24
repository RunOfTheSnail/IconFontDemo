//
//  UIImage+IconFont.h
//
//  Created by zhangyan on 2018/5/23.
//  Copyright © 2018年 zhangyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IconFont)


/**
 通过IconFont的形式创建图片
 * 例如 [UIImage imageWithIconFontName:@"iconfont" fontSize:100 text:@"\U0000e603" color:[UIColor greenColor]]

 @param iconFontName iconFont的name
 @param fontSize 字体的大小
 @param text 文本信息<unicode>
 @param color 颜色
 @return 创建的图片
 */
+ (UIImage *)imageWithIconFontName:(NSString *)iconFontName fontSize:(CGFloat)fontSize text:(NSString *)text color:(UIColor *)color;

@end
