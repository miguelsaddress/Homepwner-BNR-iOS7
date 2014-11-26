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

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[BNRItemStore sharedStore] allItems] count];
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    NSArray* items = [[BNRItemStore sharedStore] allItems];
    BNRItem* item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}
@end
