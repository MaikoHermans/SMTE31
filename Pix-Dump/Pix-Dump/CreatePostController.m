//
//  CreatePostController.m
//  Pix-Dump
//
//  Created by Fhict on 03/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "CreatePostController.h"
#import "SWRevealViewController.h"
#import "Reachability.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface CreatePostController ()
{
    Reachability *internetReachableFoo;
}
@end

@implementation CreatePostController
@synthesize tbx_post = _post;
@synthesize lbl_user = _user;
NSString *connection;
NSString *connectedto;

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
    NSUserDefaults *loggedIn = [NSUserDefaults standardUserDefaults];
    NSString *username = [loggedIn objectForKey:@"user"];
    _user.text = username;
    _post.delegate = self;
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [[self navigationController] setNavigationBarHidden:YES];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self animateTextView: YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [_post resignFirstResponder];
    [self animateTextView:NO];
}

- (void) animateTextView:(BOOL) up
{
    const int movementDistance =70; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    int movement= movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_post resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_pictures:(UIButton *)sender
{
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Open Gallery", @"Take Picture", nil];
    
    actionsheet.tag = 100;
    
    [actionsheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 100) {
        switch(buttonIndex)
        {
            case 0:
                [self OpenGallery];
                break;
            case 1:
                [self OpenCamera];
                break;
        }
        NSLog(@"Index = %d - Title = %@", buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
    }
}

- (void)OpenCamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (void)OpenGallery
{
    /*UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
	
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	
    
	[self presentModalViewController:picker animated:YES];*/
    
    QBImagePickerController *imagePickerController = [[QBImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsMultipleSelection = YES;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
    //imagePickerController.groupTypes = @[
      //                                   @(ALAssetsGroupSavedPhotos),
        //                                 @(ALAssetsGroupPhotoStream),
          //                               @(ALAssetsGroupAlbum)
            //                             ];
    [self presentViewController:navigationController animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
    UIImage *image = [info valueForKey: UIImagePickerControllerOriginalImage];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    
}

- (void)dismissImagePickerController
{
    if (self.presentedViewController) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self.navigationController popToViewController:self animated:YES];
    }
}

- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController
{
    NSLog(@"*** qb_imagePickerControllerDidCancel:");
    
    [self dismissImagePickerController];
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

- (IBAction)btn_copy:(UIButton *)sender
{
    [self testInternetConnection];
    [self ConnectedTo];
    
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    NSString *wifisetting = [setting objectForKey:@"WifiSetting"];
    
        if([connection isEqualToString:@"true"])
        {
            if([wifisetting isEqualToString:@"YES"] && [connectedto isEqualToString:@"wifi"])
            {
                [self CopyUploadPost];
            }
            else if([wifisetting isEqualToString:@"YES"] && [connectedto isEqualToString:@"3g"])
            {
                UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"You are not connected to wifi" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [mes show];
            }
            else if([wifisetting isEqualToString:@"NO"])
            {
                [self CopyUploadPost];
            }
        }
        else
        {
            UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"You need a internet connection to log in." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [mes show];
        }
}

- (void)CopyUploadPost
{
    
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:NO];
    }];
    return [super canPerformAction:action withSender:sender];
}

- (void)testInternetConnection
{
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            connection = @"true";
        });
    };
    
    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            connection = @"false";
        });
    };
    
    [internetReachableFoo startNotifier];
}

- (void)ConnectedTo
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if (status == ReachableViaWiFi)
    {
        connectedto = @"wifi";
    }
    else if (status == ReachableViaWWAN)
    {
        connectedto = @"3g";
    }
}

@end
