//
//  PlaceDetailViewController.h
//  JCNearByPlace
//
//  Created by Student P_08 on 06/11/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>


@interface PlaceDetailViewController : ViewController<UITableViewDelegate,UITableViewDataSource,MKMapViewDelegate,NSXMLParserDelegate>

{
    NSMutableArray *placeDetail;
    NSXMLParser *parser;
    NSString *dataString;
    NSDictionary *detailDictionary;

    
    int photoWidth;
    NSString *photoRef;
    
}
@property NSString *selectedPlaceDetail;


@property NSString *selectedPlaceID;
@property NSString *selectedPlaceLat;
@property NSString *selectedPlaceLng;
@property NSString *selectedPhotoReference;
@property NSString *selectedPhotoWidth;

@property (strong, nonatomic) IBOutlet MKMapView *myMapView;




@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITableView *detailTableView;


@end
