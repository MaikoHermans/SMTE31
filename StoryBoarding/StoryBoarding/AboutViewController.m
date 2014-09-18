//
//  AboutViewController.m
//  StoryBoarding
//
//  Created by Fhict on 11/09/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AboutViewController

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

- (IBAction)selectedText:(id)sender {
    //read the text from the IBOutlet. make sure you use the name you gave to the IBoutlet of the textfield
    NSString* selected = self.textField.text;
    
    //Create an AlertView. This view can show a dialog.
    UIAlertView *alertView =
    [[UIAlertView alloc] initWithTitle:@"Your text is:" message:selected delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
    //Actualy show the dialog by sending the 'show' message
    [alertView show];
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

@end
