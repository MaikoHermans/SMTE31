//
//  ViewController.m
//  Pix-Dump
//
//  Created by Fhict on 03/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "ViewController.h"
#import "CreatePostController.h"
#import "AFNetworking.h"
#import "Reachability.h"

@interface ViewController ()
{
    Reachability *internetReachableFoo;
}

@end

@implementation ViewController
@synthesize tbx_email = _email;
@synthesize tbx_password = _password;
@synthesize lbl_error = _error;
NSString *result = nil;
NSString *connection = nil;

- (void)loadView
{
    [super loadView];
    NSUserDefaults *loggedIn = [NSUserDefaults standardUserDefaults];
    NSString *loggedValue = [loggedIn objectForKey:@"loggedin"];
    
    if([loggedValue isEqualToString:@"YES"])
    {
        UIViewController *vc = [self presentedViewController];
        
        if ([vc isKindOfClass:[ViewController class]])
        {
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_email.delegate = self;
    _password.delegate = self;
    
    
    NSUserDefaults *loggedIn = [NSUserDefaults standardUserDefaults];
    NSString *wifisetting = [loggedIn objectForKey:@"WifiSetting"];
    NSString *savepost = [loggedIn objectForKey:@"SavePost"];
    
    if(![wifisetting isEqualToString:@"NO"] && ![savepost isEqualToString:@"NO"])
    {
        [loggedIn setObject:@"YES" forKey:@"WifiSetting"];
        [loggedIn setObject:@"YES" forKey:@"SavePost"];
        [loggedIn synchronize];
    }
    
    NSString *loggedValue = [loggedIn objectForKey:@"loggedin"];
    NSString *log = [loggedIn objectForKey:@"logged"];
    
    if([loggedValue isEqualToString:@"YES"] && [log isEqualToString:@"YES"])
    {
        UIViewController *vc = [self presentedViewController];
        
        if ([vc isKindOfClass:[ViewController class]])
        {
            [self performSegueWithIdentifier:@"login" sender:self];
        }

    }
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_email resignFirstResponder];
    [_password resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField)
    {
        [textField resignFirstResponder];
    }
    return NO;
}

-(IBAction)btn_login:(UIButton *)sender
{
    result = nil;
    _error.text = @"";
    if(_email.text && _email.text.length >0 && _password.text && _password.text.length >0)
    {
        [self testInternetConnection];
        
        if(![connection isEqualToString:@"false"])
        {
            [self loadJsonData];
            if([result isEqualToString:@"Correct"])
            {
                [self performSegueWithIdentifier:@"login" sender:self];
            }
        }
        else
        {
            UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You need a internet connection to log in." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            
            [mes show];
        }
    }
    else if(_email.text && _email.text.length > 0)
    {
        _error.text = @"Please be sure to enter a email";
    }
    else if(_password.text && _password.text.length > 0)
    {
        _error.text = @"Please be sure to enter a password";
    }
    else
    {
        _error.text = @"Please be sure to enter a email and password" ;
    }
}

- (void)testInternetConnection
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    if(status == NotReachable)
    {
        connection = @"false";
    }
    
    else if (status == ReachableViaWiFi)
    {
        connection = @"wifi";
    }
    else if (status == ReachableViaWWAN)
    {
        connection = @"3g";
    }
}

- (void) login
{
    if([result isEqualToString:@"Correct"])
    {
        NSUserDefaults *loggedIn = [NSUserDefaults standardUserDefaults];
        [loggedIn setObject:@"YES" forKey:@"loggedin"];
        [loggedIn setObject:@"YES" forKey:@"logged"];
        [loggedIn synchronize];
        [self performSegueWithIdentifier:@"login" sender:self];
    }
    else
    {
        _error.text = @"Email, password combination is unknown";
    }
}

- (void) loadJsonData
{
    //jsonwait = nil;
    //r = 0;
    NSString *link = [[[@"http://pix-dump.com/iOS/RequestData.aspx?user=" stringByAppendingString:_email.text] stringByAppendingString:@"&?password="] stringByAppendingString:_password.text];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //The server returns an invalid header. This fixes that problem.
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/x-javascript"];
    
    [manager GET:link parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //This code is executed when the result was ok.
        NSString *jsonresult = [responseObject objectForKey:@"Result"];
        NSString *jsonuser = [responseObject objectForKey:@"Username"];
        if([jsonresult isEqualToString:@"Correct"])
        {
            NSUserDefaults *loggedIn = [NSUserDefaults standardUserDefaults];
            [loggedIn setObject:jsonuser forKey:@"user"];
            [loggedIn synchronize];

          result = @"Correct";
        }
        else
        {
            result = @"Incorrect";
        }
        [self login];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        //This code is executed when there was an error.
        NSLog(@"Error: %@", error);
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
