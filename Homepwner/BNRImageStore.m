//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Miguel Angel Moreno Armenteros on 27/11/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()
@property(nonatomic, strong) NSMutableDictionary* allImages;
@end

@implementation BNRImageStore


+(instancetype) sharedStore {
    static BNRImageStore* sharedStore;
    if(!sharedStore){
        sharedStore = [[self alloc ]initPrivate];
    }
    return sharedStore;
}

-(instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRImageStore sharedStore]"
                                 userInfo:nil];
}

-(instancetype) initPrivate {

    self = [super init];
    if(self){
        _allImages = [[NSMutableDictionary alloc]init];
    }
    return self;
    
}

-(void) setImage:(UIImage*) image forKey: (NSString*) key{
    [self.allImages setObject:image forKey:key];
}

-(UIImage*) imageForKey:(NSString*) key {
    return [self.allImages objectForKey:key];
}

-(void) deleteImageForKey:(NSString*) key{
    if(!key) return;
    [self.allImages removeObjectForKey:key];
}

@end
