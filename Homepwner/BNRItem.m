//
//  BNRItem.m
//  RandomItems
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 16/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

-(instancetype) initWithItemName:(NSString*)name
                  valueInDollars: (int) value
                    serialNumber: (NSString*) serialNumber
{
    if(self = [super init]){
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = serialNumber;
        
        //Setting the dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
        _itemKey = [[[NSUUID alloc] init] UUIDString];
    }
    return self;
}

-(instancetype) initWithName: (NSString*) name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

//Overriding the NSObject designated initializer to call BNRItem designated initializer
-(instancetype) init
{
    return [self initWithName:@"Item"];
}

+(instancetype) randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffly", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get the index of a random element of each array
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber: randomSerialNumber];
    
    return newItem;
}


-(NSString*) description
{
    NSString *descriptionString = [NSString stringWithFormat:@"%@ (%@) - [key: %@]: Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.itemKey,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

-(void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}
@end