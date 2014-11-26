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

@end
