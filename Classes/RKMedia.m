//
//  RKMedia.m
//  PulseTest
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "RKMedia.h"

@implementation RKMedia
@synthesize url;
@synthesize medium;
@synthesize title;
@synthesize thumbnails;

- (void) dealloc
{
    [url release];
    [medium release];
    [title release];
    [thumbnails release];
    [super dealloc];
}

@end
