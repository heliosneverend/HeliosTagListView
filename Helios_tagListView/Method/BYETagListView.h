//
//  TagListView.h
//  自定义流式标签
//
//  Created by mac on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef void (^ClicBlock)(NSString*);
@interface TagListView : UIView{
    
    CGRect previousFrame ;
    int totalHeight ;
}
/**
 * 整个view的背景色
 */
@property(nonatomic,retain)UIColor *GBbackgroundColor;
/**
 *  设置单一颜色
 */
@property(nonatomic)UIColor *signalTagColor;
//设置tag字体颜色
@property(nonatomic)UIColor *tagFontColor;
/**
 *  设置最大行数
 */
@property(nonatomic,assign)NSUInteger maxLineCount;
/**
 *  设置字体
 */
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,copy)ClicBlock clickBlock;
@property (nonatomic, copy) void(^tagHeightBlock)(CGFloat tagHeight);
@property (nonatomic, copy) void(^tagCurrentClickTitleBlock)(NSString *titleStr);
/**
 *  标签文本赋值
 */
-(void)setTagWithTagArray:(NSMutableArray *)arr;
@end
