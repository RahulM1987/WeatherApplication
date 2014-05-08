//
//  WeatherViewController.h
//  WeatherApplication
//
//  Created by Rahul Morade on 08/05/14.
//  Copyright (c) 2014 Rahul Morade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"
@interface WeatherViewController : UITableViewController


@property(nonatomic , retain) NSString *city;
@property (nonatomic,retain) NSArray * resultArray;
-(void)getWeather;


@end
