//
//  CustomCell.m
//  UniversalExample
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize pic;
@synthesize title;
@synthesize date;


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) dealloc
{
    [pic release];
    [title release];
    [date release];
    [super dealloc];
}

@end
