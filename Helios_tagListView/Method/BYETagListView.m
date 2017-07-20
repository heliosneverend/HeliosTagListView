//
//  TagListView.h
//  自定义流式标签
//
//  Created by mac on 16/9/6.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "BYETagListView.h"
#define HORIZONTAL_PADDING 7.0f
#define VERTICAL_PADDING   3.0f
#define LABEL_MARGIN       10.0f
#define BOTTOM_MARGIN      10.0f
#define Screen_Width ([[UIScreen mainScreen] bounds].size.width)
@implementation TagListView
{
    NSUInteger totalLineCount;
    CGFloat getTagHeight;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, Screen_Width, frame.size.height)];
    if (self) {
        totalHeight=0;
        self.frame=frame;
    }
    return self;
}
-(void)setTagWithTagArray:(NSArray*)arr{
    NSParameterAssert(_signalTagColor);
    self.backgroundColor =[UIColor greenColor];
    //清空当前所有的view
    if(self.subviews.count){
        for (UIButton *btn in self.subviews) {
            [btn removeFromSuperview];
        }
    }
    totalLineCount = 1;
    previousFrame = CGRectZero;
    for (int loop = 0; loop < arr.count; loop++) {
        NSString *str = arr[loop];
        UIButton *tag = [UIButton buttonWithType:UIButtonTypeCustom];
        tag.backgroundColor=_signalTagColor;
        [tag setTitleColor:self.tagFontColor forState:UIControlStateNormal];
        tag.titleLabel.font = [UIFont systemFontOfSize:13];
        [tag setTitle:str forState:UIControlStateNormal];
        tag.clipsToBounds=YES;
        [tag addTarget:self action:@selector(tagClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:12]};
        CGSize Size_str=[str sizeWithAttributes:attrs];
        Size_str.width += HORIZONTAL_PADDING*4-10;
        Size_str.height += VERTICAL_PADDING*2;
        tag.layer.cornerRadius= 2;
//        tag.layer.borderColor = [UIColor lightGrayColor].CGColor;
//        tag.layer.borderWidth = 1.f;
        CGRect newRect = CGRectZero;
        if (previousFrame.origin.x + previousFrame.size.width + Size_str.width + LABEL_MARGIN > Screen_Width) {
            if(totalLineCount == _maxLineCount){
                //达到最大行上限
                break;
            }else{
                newRect.origin = CGPointMake(10, previousFrame.origin.y + Size_str.height + BOTTOM_MARGIN);
                totalHeight +=Size_str.height + BOTTOM_MARGIN;
                totalLineCount++;
            }
        }
        else {
            newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + LABEL_MARGIN, previousFrame.origin.y);
        }
        newRect.size = Size_str;
        [tag setFrame:newRect];
        previousFrame=tag.frame;
        [self setHight:self andHight:totalHeight+Size_str.height + BOTTOM_MARGIN];
        [self addSubview:tag];
    }
    if(_GBbackgroundColor){
        self.backgroundColor=_GBbackgroundColor;
    }else{
        self.backgroundColor=[UIColor whiteColor];
    }
}
#pragma mark-改变控件高度
- (void)setHight:(UIView *)view andHight:(CGFloat)hight
{
    CGRect tempFrame = view.frame;
    tempFrame.size.height = hight;
    view.frame = tempFrame;
    
    if (self.tagHeightBlock)
    {
        self.tagHeightBlock(hight);
    }
}
-(void)tagClicked:(UIButton*)button
{
    if(self.tagCurrentClickTitleBlock){
        self.tagCurrentClickTitleBlock([button currentTitle]);
    }
}
@end
