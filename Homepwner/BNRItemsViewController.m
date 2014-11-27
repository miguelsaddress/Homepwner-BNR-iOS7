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

@interface BNRItemsViewController()
@property(nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController

//designated initializer
-(instancetype) init {
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

-(instancetype) initWithStyle:(UITableViewStyle)style {
    return [self init];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.tableHeaderView = self.headerView;
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

-(UIView*) headerView {
    if(!_headerView){
       [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    
    return _headerView;
}

-(IBAction)addItem:(id)sender{
    BNRItem* item = [[BNRItemStore sharedStore] createItem];
    NSInteger lastRowIndex = [[[BNRItemStore sharedStore] allItems] indexOfObject:item];
    NSIndexPath* indexPath = [NSIndexPath indexPathForItem:lastRowIndex inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

-(IBAction)toggleEditingMode:(UIButton*)sender {
    if(self.tableView.isEditing){
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.tableView setEditing:NO animated:YES];
    }else{
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.tableView setEditing:YES animated:YES];
    }
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BNRItem* item = [[[BNRItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];

        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

-(NSString*) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
        return @"Remove";
}


@end
