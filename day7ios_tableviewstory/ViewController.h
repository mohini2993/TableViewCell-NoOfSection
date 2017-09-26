//
//  ViewController.h
//  day7ios_tableviewstory
//
//  Created by Student 01 on 12/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "nextViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *Friendstableview;
@property NSArray *friendsArray;
@property NSArray *imageArray;
@property NSArray *studentArray;





@end

