//
//  PlaceListViewController.h
//  JCNearByPlace
//
//  Created by Student P_02 on 04/11/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface PlaceListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate,NSXMLParserDelegate>
{
    CLLocationManager *myLocationManager;
    NSString *currentLatitude;
    NSString *currentLongitude;
    
    NSMutableArray *placeList;
    NSMutableDictionary *placeDictionary;
    NSMutableDictionary *latLongDictionary;
    
    
    NSXMLParser *parser;
    
    NSString *dataString;
    
    
}

@property NSString *selectedPlaceType;

@property (strong, nonatomic) IBOutlet UITableView *placeListTableView;

@end
