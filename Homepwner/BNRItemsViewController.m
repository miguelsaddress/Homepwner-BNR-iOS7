//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Miguel Angel Moreno Armenteros on 26/11/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

//designated initializer
-(instancetype) init {
    self = [super initWithStyle:UITableViewStylePlain];
    for (int i = 0; i<5; i++) {
        [[BNRItemStore sharedStore] createItem];
    }

    return self;
}

-(instancetype) initWithStyle:(UITableViewStyle)style {
    return [self init];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 1;
    if(section == 0){
        count = [[[BNRItemStore sharedStore] allItems] count];
    }
    return count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0) {
        return 60;
    }else{
        return 44;
    }
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if( indexPath.section == 0) {
        NSArray* items = [[BNRItemStore sharedStore] allItems];
        BNRItem* item = items[indexPath.row];
        cell.textLabel.text = [item description];
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:20];
    } else {
        cell.textLabel.text = @"No more items!";
    }
    return cell;
}
@end
