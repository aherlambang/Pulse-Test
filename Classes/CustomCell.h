//
//  CustomCell.h
//  UniversalExample
//
//  Created by Aditya Herlambang on 9/30/11.
//  Copyright 2011 University of Arizona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView * pic;
@property (nonatomic, retain) IBOutlet UITextView * title;
@property (nonatomic, retain) IBOutlet UILabel * date;

@end
