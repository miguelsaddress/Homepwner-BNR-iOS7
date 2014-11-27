//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Miguel Angel Moreno Armenteros on 27/11/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;

-(void) setImage:(UIImage*) image forKey: (NSString*) key;
-(UIImage*) imageForKey:(NSString*) key;
-(void) deleteImageForKey:(NSString*) key;

@end
