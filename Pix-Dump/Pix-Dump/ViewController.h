//
//  ViewController.h
//  Pix-Dump
//
//  Created by Fhict on 03/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *tbx_email;

@property (strong, nonatomic) IBOutlet UITextField *tbx_password;

@property (strong, nonatomic) IBOutlet UILabel *lbl_error;

- (IBAction)btn_login:(UIButton *)sender;

@end
