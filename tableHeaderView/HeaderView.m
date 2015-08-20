//
//  HeaderView.m
//  tableHeaderView
//
//  Created by Jonathan on 2015/8/20.
//  Copyright (c) 2015年 tuzr. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        _tv = [[UITableView alloc] initWithFrame:CGRectZero];
        _tv.dataSource = self;
        _tv.delegate = self;
        [self addSubview:_tv];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _tv.frame = self.bounds;
}

-(void)reloadData
{
    [_tv reloadData];
}

#pragma mark UITableViewDataSource
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
    
    cell.textLabel.font = [UIFont fontWithName:@"arial" size:22];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
