//
//  SettingsController.h
//  Pix-Dump
//
//  Created by Fhict on 04/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "ViewController.h"

@interface SettingsController : ViewController

@property (weak, nonatomic) IBOutlet UISwitch *sl_wifioutlet;

@property (weak, nonatomic) IBOutlet UISwitch *sl_savedoutlet;

- (IBAction)sl_wifi:(id)sender;

- (IBAction)sl_saved:(id)sender;
@end
