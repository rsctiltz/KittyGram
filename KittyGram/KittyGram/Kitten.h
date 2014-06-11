//
//  Kitten.h
//  KittyGram
//
//  Created by Ryan Tiltz on 6/10/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Kitten : PFObject < PFSubclassing>
+ (id)parseClassName;
@property PFFile *image;
@end
