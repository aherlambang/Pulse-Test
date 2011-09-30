//
//  RKMedia.h
//  PulseTest
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKMedia : NSObject

@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *medium;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *thumbnails;

@end
