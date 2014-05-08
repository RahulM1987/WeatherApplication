//
//  ViewController.m
//  WeatherApplication
//
//  Created by Rahul Morade on 08/05/14.
//  Copyright (c) 2014 Rahul Morade. All rights reserved.
//

#import "ViewController.h"
#import "WeatherViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Result"])
    {
        WeatherViewController *vc=[segue destinationViewController];
        vc.city=_txt.text;
    }
    
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"Result"])
    {
        if(_txt.text.length)
            return YES;
        
        return NO;
    }
    
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



@end
