//
//  CreatePostController.h
//  Pix-Dump
//
//  Created by Fhict on 03/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "ViewController.h"

@interface CreatePostController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lbl_user;

@property (strong, nonatomic) IBOutlet UITextView *tbx_post;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

- (IBAction)btn_copy:(UIButton *)sender;
- (IBAction)btn_pictures:(UIButton *)sender;

@end
