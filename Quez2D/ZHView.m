//
//  ZHView.m
//  Quez2D
//
//  Created by ZZZZZ on 15/11/6.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "ZHView.h"

@interface ZHView()

// 大数组
@property (nonatomic, strong)NSMutableArray *totalPathPoints;

@end


@implementation ZHView
// 懒加载
- (NSMutableArray *)totalPathPoints{
    if (_totalPathPoints == nil) {
        _totalPathPoints = [NSMutableArray array];
    }
    return _totalPathPoints;
}

// 清屏按钮事件
- (void)clearBtn{
    
    NSLog(@"来到了View里面的清屏");
    [self.totalPathPoints removeAllObjects];
    
    // 重新绘制一次
    [self setNeedsDisplay];
}

// 回退按钮事件
- (void)backBtn{
    
    NSLog(@"来到了View里面的回退");

    [self.totalPathPoints removeLastObject];
    
    // 重新绘制一次
    [self setNeedsDisplay];
}

// 确定起点
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    
    // ************** 下面这两句有的时候不是等价的 *************************
    CGPoint startPos= [touch locationInView:touch.view];
    // CGPoint currentPos= [touch locationInView:self];
    // ************ 上面这两句不行的话可以交换一下写 ************************
    
    
    // 每次的触摸开始就新建一个新的数组来存放这次触摸的所有点(这次触摸过程的路径)
    NSMutableArray *pathPoints = [NSMutableArray array];
    
    [pathPoints addObject:[NSValue valueWithCGPoint:startPos]];
    
    // 添加这次路径的所有的点到我们的大的数组中
    [self.totalPathPoints addObject:pathPoints];
    [self setNeedsDisplay];
    
}

// 连线
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    CGPoint currentPos= [touch locationInView:touch.view];
    
    // 取出这次路径对应的数组
    NSMutableArray *pathPoints =[self.totalPathPoints lastObject];
    [pathPoints addObject:[NSValue valueWithCGPoint:currentPos]];
    [self setNeedsDisplay];
}

// 连线
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint endPos= [touch locationInView:touch.view];
    
    // 取出这次路径对应的数组
    NSMutableArray *pathPoints =[self.totalPathPoints lastObject];
    [pathPoints addObject:[NSValue valueWithCGPoint:endPos]];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    for (NSMutableArray *pathPoints in self.totalPathPoints) {
        for (int i = 0; i < pathPoints.count; i++) {// 一条路径
            CGPoint pos = [pathPoints[i] CGPointValue];
            if (i == 0) {
                CGContextMoveToPoint(ctx, pos.x, pos.y);
            }else{
                CGContextAddLineToPoint(ctx, pos.x, pos.y);
            }
        }
    }
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextSetLineWidth(ctx, 5);
    CGContextStrokePath(ctx);
    
}

@end
