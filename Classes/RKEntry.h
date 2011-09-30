//
//  RKEntry.h
//  PulseTest
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKMedia.h"

@interface RKEntry : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *author;
@property (nonatomic, retain) NSDate *publishedDate;
@property (nonatomic, retain) NSString *contentSnippet;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSArray *categories;
@property (nonatomic, retain) NSArray *mediaGroups;


@end
