//
//  UpdateDateViewController.m
//  Homepwner
//
//  Created by Miguel Angel Moreno Armenteros on 27/11/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import "UpdateDateViewController.h"
#import "BNRItem.h"

@interface UpdateDateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation UpdateDateViewController

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.datePicker.date = self.item.dateCreated;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.item.dateCreated = self.datePicker.date;
    NSLog(@"DATE: %@", self.item);
}

@end
