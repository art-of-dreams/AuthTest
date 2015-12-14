//
//  ViewController.m
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "StartViewController.h"
#import "CredentialsViewController.h"


static NSString *const kSignUpSegue = @"SignUpSegue";
static NSString *const kSignInSegue = @"SignInSegue";


@interface StartViewController ()

@end

@implementation StartViewController

#pragma mark - Lyfecycle

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CredentialsViewController *vc = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:kSignUpSegue])
    {
        vc.type = CredentialsViewControllerTypeSignUp;
    }
    else if ([segue.identifier isEqualToString:kSignInSegue])
    {
        vc.type = CredentialsViewControllerTypeSignIn;
    }
}

@end
