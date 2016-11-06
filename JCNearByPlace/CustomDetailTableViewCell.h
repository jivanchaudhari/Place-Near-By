//
//  CustomDetailTableViewCell.h
//  JCNearByPlace
//
//  Created by Student P_08 on 06/11/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelPlaceName;
@property (strong, nonatomic) IBOutlet UILabel *labelDistance;

@property (strong, nonatomic) IBOutlet UILabel *labelOpenClose;

@property (strong, nonatomic) IBOutlet UILabel *labelAddress;
@property (strong, nonatomic) IBOutlet UILabel *labelReview;


@end
