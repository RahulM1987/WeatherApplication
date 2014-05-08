//
//  WeatherViewController.m
//  WeatherApplication
//
//  Created by Rahul Morade on 08/05/14.
//  Copyright (c) 2014 Rahul Morade. All rights reserved.
//

#import "WeatherViewController.h"
#import "Weather.h"
#import "ViewController.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getWeather];
    self.navigationItem.title = self.city ;


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)getWeather
{
    
   // NSString *webServiceURLString = @"http://api.openweathermap.org/data/2.5/forecast/daily?id=524901&cnt=14&APPID=xxxxx";
    
    NSString * webServiceURLString =  [NSString stringWithFormat: @"http://api.openweathermap.org/data/2.5/forecast/daily?id=524901&cnt=14&APPID=xxxxx",self.city];
    webServiceURLString = [webServiceURLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@ ",webServiceURLString);
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:webServiceURLString]];
    
    NSURLResponse * response =  nil ;
    NSError * error = nil ;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error)
    {
        NSLog(@"Error: %@ ", error);
        return;
    }
    
    NSDictionary * result =  [NSJSONSerialization JSONObjectWithData:data options:-1 error:nil];
    NSLog(@"Result : %@ ", result );
    
    
    self.resultArray = [result objectForKey:@"list"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    Weather *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary * item = self.resultArray[indexPath.row];
    
    NSNumber * temp = item[@"main"][@"temp"];
    float tempCelc = temp.floatValue / 33.8 ;
    
    NSString * desc = item[@"weather"][0][@"description"];
    NSNumber * dt = item[@"dt"];
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[dt longValue]];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"dd-MM-yyyy hh:mm"];
    
    cell.lb1.text = [df stringFromDate:date];
    cell.lb2.text = [NSString stringWithFormat:@"%.2f ",tempCelc];
    cell.lb3.text = desc;
    
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
