//
//  ViewController.m
//  JCNearByPlace
//
//  Created by Student P_02 on 04/11/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "ViewController.h"
#import "PlaceListViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = [NSString stringWithFormat:@"SEARCH PLACES"];
    
    placeTypes = @[@"accounting",
                   @"airport",
                   @"amusement_park",
                   @"aquarium",
                   @"art_gallery",
                   @"atm",
                   @"bakery",
                   @"bank",
                   @"bar",
                   @"beauty_salon",
                   @"bicycle_store",
                   @"book_store",
                   @"bowling_alley",
                   @"bus_station",
                   @"cafe",
                   @"campground",
                   @"car_dealer",
                   @"car_rental",
                   @"Car_repair",
                   @"Car_wash",
                   @"Casino",
                   @"Cemetery",
                   @"Church",
                   @"City_hall",
                   @"Clothing_store",
                   @"Convenience_store",
                   @"Courthouse",
                   @"Dentist",
                   @"Department_store",
                   @"Doctor",
                   @"Electrician",
                   @"Electronics_store",
                   @"Embassy",
                   @"Establishment (deprecated)",
                   @"Finance (deprecated)",
                   @"Fire_station",
                   @"Florist",
                   @"Food (deprecated)",
                   @"Funeral_home",
                   @"Furniture_store",
                   @"Gas_station",
                   @"General_contractor (deprecated)",
                   @"Grocery_or_supermarket (deprecated)",
                   @"Gym",
                   @"Hair_care",
                   @"Hardware_store",
                   @"Health (deprecated)",
                   @"Hindu_temple",
                   @"Home_goods_store",
                   @"Hospital",
                   @"Insurance_agency",
                   @"Jewelry_store",
                   @"Laundry",
                   @"Lawyer",
                   @"Library",
                   @"Liquor_store",
                   @"Local_government_office",
                   @"Locksmith",
                   @"Lodging",
                   @"Meal_delivery",
                   @"Meal_takeaway",
                   @"Mosque",
                   @"Movie_rental",
                   @"Movie_theater",
                   @"Moving_company",
                   @"Museum",
                   @"Night_club",
                   @"Painter",
                   @"Park",
                   @"Parking",
                   @"Pet_store",
                   @"Pharmacy",
                   @"Physiotherapist",
                   @"Place_of_worship (deprecated)",
                   @"Plumber",
                   @"Police",
                   @"Post_office",
                   @"Real_estate_agency",
                   @"Restaurant",
                   @"Roofing_contractor",
                   @"Rv_park",
                   @"School",
                   @"Shoe_store",
                   @"Shopping_mall",
                   @"Spa",
                   @"Stadium",
                   @"Storage",
                   @"Store",
                   @"Subway_station",
                   @"Synagogue",
                   @"Taxi_stand",
                   @"Train_station",
                   @"Transit_station",
                   @"Travel_agency",
                   @"University",
                   @"Veterinary_care",
                   @"Zoo"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return placeTypes.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [placeTypes objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *place = [placeTypes objectAtIndex:indexPath.row];
    
    NSString *placeType = [place stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    PlaceListViewController *placeListViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PlaceListViewController"];
    
    placeListViewController.selectedPlaceType = placeType.lowercaseString;
    
    [self.navigationController pushViewController:placeListViewController animated:YES];
    
}

@end
