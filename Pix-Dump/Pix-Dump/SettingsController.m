//
//  SettingsController.m
//  Pix-Dump
//
//  Created by Fhict on 04/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "SettingsController.h"

@interface SettingsController ()

@end

@implementation SettingsController
@synthesize sl_wifioutlet = _wifi;
@synthesize sl_savedoutlet = _saved;

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
    // Do any additional setup after loading the view.
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

- (IBAction)sl_wifi:(id)sender
{
    if(_wifi.on)
    {
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setObject:@"YES" forKey:@"WifiSetting"];
        [settings synchronize];
    }
    else
    {
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setObject:@"NO" forKey:@"WifiSetting"];
        [settings synchronize];
    }
}

- (IBAction)sl_saved:(id)sender
{
    if(_saved.on)
    {
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setObject:@"YES" forKey:@"SavePost"];
        [settings synchronize];

    }
    else
    {
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        [settings setObject:@"NO" forKey:@"SavePost"];
        [settings synchronize];
    }
}
@end
