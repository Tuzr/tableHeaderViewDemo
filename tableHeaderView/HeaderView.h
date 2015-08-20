//
//  HeaderView.h
//  tableHeaderView
//
//  Created by Jonathan on 2015/8/20.
//  Copyright (c) 2015年 tuzr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tv;
}

@property (nonatomic,strong) NSMutableArray *cellDataArray;

-(void)reloadData;

@end
