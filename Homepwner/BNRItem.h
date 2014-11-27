//
//  BNRItem.h
//  RandomItems
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 16/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, strong) NSDate *dateCreated;

+(instancetype) randomItem;


//Designated initializer for the BNRItem
-(instancetype) initWithItemName:(NSString*)name
                  valueInDollars: (int) value
                    serialNumber: (NSString*) serialNumber;

-(instancetype) initWithName: (NSString*) name;



@end