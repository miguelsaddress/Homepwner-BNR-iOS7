//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Miguel Angel Moreno Armenteros on 27/11/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"

@interface BNRDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BNRDetailViewController

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.nameField.text = self.item.itemName;
    self.serialField.text = self.item.serialNumber;
    self.valueField.text = [NSString stringWithFormat: @"%d", self.item.valueInDollars];
    
    static NSDateFormatter *formatter = nil;
    if (!formatter){
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateStyle = NSDateFormatterMediumStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [formatter stringFromDate:self.item.dateCreated];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //Not sure this is needed. It hides the keyboard if opened
    [self.view endEditing:YES];
    
    self.item.itemName = self.nameField.text;
    self.item.serialNumber = self.serialField.text;
    self.item.valueInDollars = [self.valueField.text intValue];
    
}

@end
