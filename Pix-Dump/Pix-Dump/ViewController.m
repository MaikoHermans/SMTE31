//
//  ViewController.m
//  Pix-Dump
//
//  Created by Fhict on 03/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "ViewController.h"
#import "CreatePostController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tbx_email = _email;
@synthesize tbx_password = _password;
@synthesize lbl_error = _error;

- (void)viewDidLoad
{
    [super viewDidLoad];
	_email.delegate = self;
    _password.delegate = self;
    
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
    _error.text = @"";
    if(_email.text && _email.text.length >0 && _password.text && _password.text.length >0)
    {
        [self performSegueWithIdentifier:@"login" sender:self];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
