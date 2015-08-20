//
//  TableViewController.h
//  tableHeaderView
//
//  Created by tuzr on 2015/8/18.
//  Copyright (c) 2015年 tuzr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

@interface cellData : NSObject
@property (nonatomic,strong) NSString *text;
@end


@interface TableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tv;
    
    NSMutableArray *_cellDataArray;
    
    NSMutableArray *_selectArray;
    
    HeaderView *_hv;
    
    NSMutableDictionary *_indexPathDictionary;
}

@end