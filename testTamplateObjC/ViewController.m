//
//  ViewController.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 28.06.2023.
//

#import "ViewController.h"
#import "Rectangle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Rectangle* rec = [[Rectangle alloc] init];
    [rec setHeight: 10];
    NSLog(@"%i", rec.height);
    
    self.navigationItem.title = @"Maps";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}


@end
