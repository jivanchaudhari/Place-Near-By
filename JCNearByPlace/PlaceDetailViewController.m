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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return placeDetail.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Place_cell"];
    
    
    
    return cell;
    
}

@end
