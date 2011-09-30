//
//  RKEntry.m
//  PulseTest
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "RKEntry.h"

@implementation RKEntry

@synthesize title;
@synthesize link;
@synthesize author;
@synthesize publishedDate;
@synthesize contentSnippet;
@synthesize content;
@synthesize categories;
@synthesize mediaGroups;


- (void) dealloc
{
    [title release];
    [link release];
    [author release];
    [publishedDate release];
    [contentSnippet release];
    [content release];
    [categories release];
    [mediaGroups release];
    [super dealloc];
}
@end
