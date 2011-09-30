//
//  AsynchronousImageView.h
//  PulseTest
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AsynchronousImageView : UIImageView 
{
    NSURLConnection *connection;
    NSMutableData *data;
    UIActivityIndicatorView * waiting;
}

- (void)loadImageFromURLString:(NSString *)theUrlString;

@property (nonatomic, retain) UIActivityIndicatorView * waiting;

@end