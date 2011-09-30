//
//  AsynchronousImageView.m
//  PulseTest
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import "AsynchronousImageView.h"

@implementation AsynchronousImageView
@synthesize waiting;

- (void)loadImageFromURLString:(NSString *)theUrlString
{
    [self.image release], self.image = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:theUrlString] 
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad 
                                         timeoutInterval:30.0];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.waiting = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.waiting setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
    [waiting startAnimating];
    [self addSubview:waiting];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection 
{
    self.image = [UIImage imageWithData:data];
    [data release], data = nil;
    [connection release], connection = nil;
    [self.waiting stopAnimating];
    [self.waiting removeFromSuperview];
}


- (void)connection:(NSURLConnection *)theConnection 
    didReceiveData:(NSData *)incrementalData 
{
    if (data == nil)
        data = [[NSMutableData alloc] initWithCapacity:2048];
    
    [data appendData:incrementalData];
}

- (void) dealloc
{
    [waiting release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
