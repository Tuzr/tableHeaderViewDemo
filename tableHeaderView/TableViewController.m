//
//  TableViewController.m
//  tableHeaderView
//
//  Created by tuzr on 2015/8/18.
//  Copyright (c) 2015年 tuzr. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

-(id)init
{
    self = [super init];
    if(self) {
        _tv = [[UITableView alloc] initWithFrame:CGRectZero];
        _tv.dataSource = self;
        _tv.delegate = self;
        
        _hv = [[HeaderView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self reloadData];
}

-(void)reloadData
{
    _cellDataArray = [NSMutableArray array];
    _selectArray = [NSMutableArray array];
    
    _indexPathDictionary = [NSMutableDictionary dictionary];
    
    for(int i=0 ; i<6 ; i++) {
        NSString *text = [NSString stringWithFormat:@"text %d",i];
        [_cellDataArray addObject:text];
    }
    
    
}

-(void)loadView
{
    [super loadView];
    
    self.view = _tv;
    self.title = @"HeaderViewDemo";
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"cell"];
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
        
    cell.textLabel.text = [_cellDataArray objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [_cellDataArray objectAtIndex:indexPath.row];
        
    if([_selectArray containsObject:text]) {
        [_selectArray removeObject:text];
    }else{
        [_selectArray addObject:text];
    }

    _hv.cellDataArray = _selectArray;
    [_hv reloadData];
    
    _hv.frame = CGRectMake(0, 0, CGRectGetWidth(_tv.frame), 44 * _selectArray.count);
    _tv.tableHeaderView = _hv;
}

@end