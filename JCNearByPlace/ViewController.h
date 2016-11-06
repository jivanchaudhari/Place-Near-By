//
//  ViewController.h
//  JCNearByPlace
//
//  Created by Student P_02 on 04/11/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#define kGoogleAPIKey @"AIzaSyDAYKFQOgnZZf40Z01qhu1VWNQ281Xh6Rk"
#define kLatitude 19.0760

#define kLongitude 72.8777



//https://maps.googleapis.com/maps/api/place/nearbysearch/xml?location=-33.8670522,151.1957362&radius=500&type=restaurant&key=AIzaSyDAYKFQOgnZZf40Z01qhu1VWNQ281Xh6Rk
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *placeTypes;
    
}

@property (strong, nonatomic) IBOutlet UITableView *placeTypeTableView;

@end

