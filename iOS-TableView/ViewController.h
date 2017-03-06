//
//  ViewController.h
//  iOS-TableView
//
//  Created by Matthew Man on 6/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (copy,nonatomic) NSArray *greekLetters;


@end

