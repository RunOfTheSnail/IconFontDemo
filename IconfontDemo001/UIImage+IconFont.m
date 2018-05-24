//
//  UIImage+IconFont.m
//
//  Created by zhangyan on 2018/5/23.
//  Copyright © 2018年 zhangyan. All rights reserved.
//

#import "UIImage+IconFont.h"
#import <CoreText/CoreText.h>

@implementation UIImage (IconFont)

/**
 通过IconFont的形式创建图片
 
 @param iconFontName iconFont的name
 @param fontSize 字体的大小
 @param text 文案
 @param color 颜色
 @return 创建的图片
 */
+ (UIImage *)imageWithIconFontName:(NSString *)iconFontName fontSize:(CGFloat)fontSize text:(NSString *)text color:(UIColor *)color
{
    
    CGFloat size = fontSize;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    UIFont *font = [self fontWithSize:realSize withFontName:iconFontName];
    UIGraphicsBeginImageContext(CGSizeMake(realSize, realSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if ([text respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        /**
         * 如果这里抛出异常，请打开断点列表，右击All Exceptions -> Edit Breakpoint -> All修改为Objective-C
         * See: http://stackoverflow.com/questions/1163981/how-to-add-a-breakpoint-to-objc-exception-throw/14767076#14767076
         */
        [text drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color}];
    } else {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, color.CGColor);
        [text drawAtPoint:CGPointMake(0, 0) withFont:font];
#pragma clang pop
    }
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    return image;
}


/**
 iconFont 转化font

 @param size 字体大小
 @param fontName 字体的名称
 @return 字体的font
 */
+ (UIFont *)fontWithSize:(CGFloat)size withFontName:(NSString *)fontName {
    
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (font == nil) {
        
        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:fontName withExtension:@"ttf"];
        [self registerFontWithURL: fontFileUrl];
        font = [UIFont fontWithName:fontName size:size];
        NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    }
    return font;
}

// 如果没有在info.plist中声明，在这注册一下也可以。
+ (void)registerFontWithURL:(NSURL *)url {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, nil);
    CGFontRelease(newFont);
}

@end
