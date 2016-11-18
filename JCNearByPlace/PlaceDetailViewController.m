//
//  PlaceDetailViewController.m
//  JCNearByPlace
//
//  Created by Student P_08 on 06/11/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "PlaceDetailViewController.h"
#import "CustomDetailTableViewCell.h"



@interface PlaceDetailViewController ()

@end

@implementation PlaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    placeDetail = [[NSMutableArray alloc]init];
    
   
    CLLocationCoordinate2D location = self.myMapView.userLocation.coordinate;
    
    MKCoordinateRegion region;
    
    location.latitude = self.selectedPlaceLat.intValue;
    
    location.longitude = self.selectedPlaceLng.intValue;
    
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc]init];
    
    pointAnnotation.coordinate = location;
    
    [self.myMapView addAnnotation:pointAnnotation];
    
    region.center = location;
    
    photoWidth = self.selectedPhotoWidth.intValue;
    photoRef = self.selectedPhotoReference;
    
    
    [self getPlaceDetailAPIKey:kGoogleAPIKey photoReference:photoRef width:photoWidth];
    
    
    
    [self getPlaceDetilWithAPIKey:kGoogleAPIKey placeType: self.selectedPlaceID];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)getPlaceDetilWithAPIKey:(NSString *)key
                    placeType:(NSString *)type

{
    
    //https://maps.googleapis.com/maps/api/place/details/xml?placeid=ChIJN1t_tDeuEmsRUsoyG83frY4&key=AIzaSyDAYKFQOgnZZf40Z01qhu1VWNQ281Xh6Rk
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/details/xml?placeid=%@&key=%@",type,key];
    
    
    NSLog(@"%@",urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *task = [mySession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            //alert
        }
        else {
            
            if (response) {
                
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                
                if (httpResponse.statusCode == 200) {
                    
                    if (data) {
                        
                        //xml parsing
                        
                        parser = [[NSXMLParser alloc]initWithData:data];
                        parser.delegate = self;
                        [parser parse];
                        
                    }
                    else {
                        //alert
                        
                        //  [self.listIndicator stopAnimating];
                        
                    }
                }
                else {
                    //alert
                    // [self.listIndicator stopAnimating];
                    
                }
                
            }
            else {
                //alert
                
                // [self.listIndicator stopAnimating];
                
            }
        }
        
        
    }];
    
    
    [task resume];
    
}
-(void)getPlaceDetailAPIKey:(NSString *)key
             photoReference:(NSString *) photoReferences
                      width: (double)width {
    
   // https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CnRtAAAATLZNl354RwP_9UKbQ_5Psy40texXePv4oAlgP4qNEkdIrkyse7rPXYGd9D_Uj1rVsQdWT4oRz4QrYAJNpFX7rzqqMlZw2h2E2y5IKMUZ7ouD_SlcHxYq1yL4KbKUv3qtWgTK0A6QbGh87GB3sscrHRIQiG2RrmU_jF4tENr9wGS_YxoUSSDrYjWmrNfeEHSGSc3FyhNLlBU&key=YOUR_API_KEY
   
    
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=%f&photoreference=%@&key=%@",width,photoReferences,key];

    NSLog(@"%@",urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        if (error) {
            //alert
            
        }
        else {
            if (response) {
                
                NSHTTPURLResponse *httpResponce = (NSHTTPURLResponse *)response;
                
                if (httpResponce.statusCode == 200) {
                    
                    NSData *imageData = [NSData dataWithContentsOfURL:location];
                    
                    UIImage *image = [UIImage imageWithData:imageData];
                    
 
                    [self performSelectorOnMainThread:@selector(updateImage:) withObject:image waitUntilDone:NO];
                    
                    NSLog(@"%@ hi",imageData);
                    
                }
                
                else {
                    NSLog(@"%ld",(long)httpResponce.statusCode);
                    NSData *imageData = [NSData dataWithContentsOfURL:location];
                    
                    UIImage *image = [UIImage imageWithData:imageData];
                    
                    
                    [self performSelectorOnMainThread:@selector(updateImage:) withObject:image waitUntilDone:NO];
                    

                    //alert
                }
            }
            
            else {
                //alert
            }
        }
    }];
    
    [task resume];
    
}
-(void)updateImage :(UIImage *) image {
    
    self.imageView.image = image;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return placeDetail.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Place_cell"];
    
    NSMutableDictionary *tempDictionary = [placeDetail objectAtIndex:indexPath.row];
    
    NSLog(@"%@",tempDictionary);
    
    NSString *placeName = [tempDictionary valueForKey:@"name"];
    
    NSLog(@"%@",placeName);
    
    NSString *address = [tempDictionary valueForKey:@"vicinity"];
    NSString *phoneNumber = [tempDictionary valueForKey:@"formatted_phone_number"];
    
    NSString *reviewName = [tempDictionary valueForKey:@"author_name"];
   
    NSString *time = [tempDictionary valueForKey:@"time"];

    NSString *name = [tempDictionary valueForKey:@"text"];
    
    
    
    double timeStamp = time.intValue;
    
    NSTimeInterval _interval  =   timeStamp;
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:_interval];
    
    NSDateFormatter *formatterHours= [[NSDateFormatter alloc] init];
    
    
    [formatterHours setLocale:[NSLocale currentLocale]];
    
    [formatterHours setDateFormat:@"hh:mm a"];
    
    NSString *hoursString = [formatterHours stringFromDate:date];
    
    NSLog(@"%@",hoursString);
    
    cell.labelOne.text = placeName;
    
    
    cell.labelThree.text = phoneNumber;
    
    cell.labelTwo.text = address;
    //cell.labelTwo.lineBreakMode =NSLineBreakByWordWrapping;
    
    //cell.labelTwo .numberOfLines = 5;
    
    cell.labelFour.text = reviewName;
    
    cell.labelFive.text = name;
    cell.labelSix.text = hoursString;
    
    
    return cell;
    
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    

    if ([elementName isEqualToString:@"result"]) {
        detailDictionary = [[NSMutableDictionary alloc]init];
        
    }
    else if ([elementName isEqualToString:@"name"]) {
        dataString = [[NSMutableString alloc]init];
        
    }
    else if ([elementName isEqualToString:@"vicinity"]) {
        dataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"formatted_phone_number"]) {
        dataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"review"]) {
        dataString = [[NSMutableString alloc]init];
        
    }
    else if ([elementName isEqualToString:@"author_name"]) {
        dataString = [[NSMutableString alloc]init];
    }

    else if ([elementName isEqualToString:@"time"]) {
        dataString = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"text"]) {
        dataString = [[NSMutableString alloc]init];
    }
    

    }
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    dataString = string;
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"result"]) {
        
        [placeDetail addObject:detailDictionary];
        
    }
    else if ([elementName isEqualToString:@"name"]) {
        
        [detailDictionary setValue:dataString forKey:@"name"];
        
    }
    else if ([elementName isEqualToString:@"vicinity"]) {
        
        [detailDictionary setValue:dataString forKey:@"vicinity"];
        
    }
    else if ([elementName isEqualToString:@"formatted_phone_number"]) {
        
        [detailDictionary setValue:dataString forKey:@"formatted_phone_number"];
        
    }
    else if ([elementName isEqualToString:@"review"]) {
        
        [detailDictionary setValue:dataString forKey:@"review"];
        
    }
    else if ([elementName isEqualToString:@"author_name"]) {
        
        [detailDictionary setValue:dataString forKey:@"author_name"];
        
    }
   
    else if ([elementName isEqualToString:@"text"]) {
        
        [detailDictionary setValue:dataString forKey:@"text"];
    }
    else if ([elementName isEqualToString:@"time"]) {
        
        [detailDictionary setValue:dataString forKey:@"time"];
        
    
    }
        
    
    else if([elementName isEqualToString:@"PlaceDetailsResponse"]){
        
        
        [self performSelectorOnMainThread:@selector(updateTableView) withObject:nil waitUntilDone:NO];
        
    }
    
    
 

}
-(void)updateTableView {
    
    [self.detailTableView reloadData];
    
    
}



@end
