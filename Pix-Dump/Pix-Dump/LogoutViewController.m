//
//  LogoutViewController.m
//  Pix-Dump
//
//  Created by Fhict on 04/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "LogoutViewController.h"

@interface LogoutViewController ()

@end

@implementation LogoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_logoutYes:(id)sender
{
    NSUserDefaults *loggedIn = [NSUserDefaults standardUserDefaults];
    [loggedIn setObject:@"NO" forKey:@"loggedin"];
    [loggedIn synchronize];
    NSString *logged = [loggedIn objectForKey:@"loggedin"];
    if([logged isEqualToString:@"NO"])
    {
        [self performSegueWithIdentifier:@"logout" sender:self];
    }
}
@end
