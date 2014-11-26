//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Miguel Angel Moreno Armenteros on 26/11/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
@property(nonatomic) NSMutableArray* privateItems;

@end

@implementation BNRItemStore

+(instancetype) sharedStore {
    static BNRItemStore *sharedStore;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"You must use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

-(instancetype) initPrivate {
    self = [super init];
    if(self){
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(BNRItem*) createItem {
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

-(NSArray*) allItems {
    return self.privateItems;
}

-(void) removeItem: (BNRItem *) item {
    [self.privateItems removeObjectIdenticalTo:item];
}

-(void)moveItemAtIndex:(NSUInteger)fromIndex toIndex: (NSUInteger)toIndex {
    if(fromIndex == toIndex) return;
    
    BNRItem* auxItem = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:auxItem atIndex:toIndex];
}

@end
