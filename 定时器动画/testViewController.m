//
//  testViewController.m
//  定时器动画
//
//  Created by 郭刚 on 2019/5/24.
//  Copyright © 2019 郭刚. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)dealloc {
    NSLog(@"释放!!!!!!!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
