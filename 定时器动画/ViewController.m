//
//  ViewController.m
//  定时器动画
//
//  Created by 郭刚 on 2019/5/24.
//  Copyright © 2019 郭刚. All rights reserved.
//

#import "ViewController.h"
#import "testViewController.h"

@interface ViewController ()
{
    NSTimer *_timer;
    CGFloat shortTimeWidth;
}
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UIView *groundView;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (nonatomic,strong) UIView *animation_view;
@property (nonatomic,assign) NSUInteger secondNum;
@property (nonatomic,assign) NSUInteger loopNum;
@property (nonatomic,strong) NSArray *numArray;
//@property (nonatomic,assign) CGFloat shortTimeWidth;
@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"%@",[self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.numArray = @[@5,@2,@5,@3];
    [self.groundView addSubview:self.animation_view];
    
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:@{} repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer setFireDate:[NSDate distantFuture]];

    // Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}

- (IBAction)didClickedPush:(UIButton *)sender {
    testViewController *vc = [[testViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)didClickedStopBtn:(UIButton *)sender {
    //关闭定时器
    [_timer setFireDate:[NSDate distantFuture]];

}
- (IBAction)didClickedStartBtn:(UIButton *)sender {
    //开启定时器

    [UIView animateWithDuration:0.1 animations:^{
        self.secondNum = 0;
        self.loopNum = 0;
        shortTimeWidth = 1;
        self.animation_view.frame = CGRectMake(0, 0,1, CGRectGetHeight(self.groundView.frame));
    } completion:^(BOOL finished) {
        [self->_timer setFireDate:[NSDate distantPast]];
    }];
//  self.secondNum = [self.numArray[_loopNum] integerValue];
}

- (void)timerAction {
    
    if (0 == self.secondNum) {
        if (self.loopNum == 4 && self.numArray.count == _loopNum &&0 == self.secondNum) {
            [_timer setFireDate:[NSDate distantFuture]];
            return;
        }

        self.secondLabel.text = [NSString stringWithFormat:@"%@s",self.numArray[_loopNum]];
        self.secondNum = [self.numArray[_loopNum] integerValue];
        self.loopNum++;
    }
    
    CGFloat width = self.groundView.frame.size.width / 15;
    shortTimeWidth += width;
    
    NSString * percentNum =  [NSString stringWithFormat:@"%f",(shortTimeWidth / self.groundView.frame.size.width)*100];
    NSLog(@"------ %@   ------ %f", percentNum,shortTimeWidth );
    self.percentLabel.text = [NSString stringWithFormat:@"%@%%",@(floorf(percentNum.floatValue))];
    [UIView animateWithDuration:1 animations:^{
        self.animation_view.frame = CGRectMake(0, 0,self->shortTimeWidth, CGRectGetHeight(self.groundView.frame));

    } completion:^(BOOL finished) {
        
    }];

    self.secondLabel.text = [NSString stringWithFormat:@"%lus", (unsigned long)self.secondNum];
    self.secondNum --;

}


- (UIView *)animation_view {
    if (!_animation_view) {
        _animation_view = [[UIView alloc] init];
        _animation_view.backgroundColor = [UIColor blueColor];
    }
    return _animation_view;
}

@end
