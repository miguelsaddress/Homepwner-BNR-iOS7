//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Miguel Angel Moreno Armenteros on 26/11/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
@property(nonatomic, weak) NSArray* allItems;

+(instancetype) sharedStore;
-(BNRItem*) createItem;
@end
