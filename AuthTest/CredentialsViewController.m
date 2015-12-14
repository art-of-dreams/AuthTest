//
//  CredentialsViewController.m
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "CredentialsViewController.h"
#import "MRProgressOverlayView.h"
#import "ServerManager.h"


static NSString *const kSuccessfulSignUpSegue = @"SuccessfulSignUpSegue";
static NSString *const kSuccessfulSignInSegue = @"SuccessfulSignInSegue";


@interface CredentialsViewController ()

@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *password;

@end

@implementation CredentialsViewController

#pragma mark - Lyfecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = (self.type == CredentialsViewControllerTypeSignUp) ? @"Sign Up" : @"Sign In";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Setters, Getters

- (NSString *)email
{
    return [self.emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)password
{
    return [self.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

#pragma mark - API

- (void)registerUserOnServer
{
    NSDictionary *params = @{ @"email" : self.email,
                              @"password" : self.password };
    
    MRProgressOverlayView *overlay = [self showOverlayForWindow];    
    [g_serverManager registerUserWithParameters:params completion:^(BOOL isSuccessfully, NSString *errorMessage) {
        [overlay dismiss:YES];
        
        if (isSuccessfully)
        {
            [self performSegueWithIdentifier:kSuccessfulSignUpSegue sender:nil];
        }
        else
        {
            [self handleErrorWithMessage:errorMessage];
        }
        
    }];
}

- (void)authorizeUserOnServer
{
    NSDictionary *params = @{ @"type" : @"password",
                              @"email" : self.email,
                              @"password" : self.password };
    
    MRProgressOverlayView *overlay = [self showOverlayForWindow];
    [g_serverManager authorizeUserWithParameters:params completion:^(BOOL isSuccessfully, NSString *errorMessage) {
        [overlay dismiss:YES];
        
        if (isSuccessfully)
        {
            [self performSegueWithIdentifier:kSuccessfulSignInSegue sender:nil];
        }
        else
        {
            [self handleErrorWithMessage:errorMessage];
        }
        
    }];
}

#pragma mark - Actions

- (IBAction)actionDone:(UIBarButtonItem *)sender
{
    if (![self isCredentialsValid])
        return;
    
    if (self.type == CredentialsViewControllerTypeSignUp)
    {
        [self registerUserOnServer];
    }
    else
    {
        [self authorizeUserOnServer];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.emailTextField])
    {
        [self.passwordTextField becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    
    return YES;
}

#pragma mark - Other methods

- (BOOL)isCredentialsValid
{
    if (self.email.length == 0 || self.password.length == 0)
    {
        [self handleErrorWithMessage:@"All fields are required"];
        return NO;
    }
    
    return YES;
}

- (void)handleErrorWithMessage:(NSString *)errorMessage
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oops!"
                                                                             message:errorMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (MRProgressOverlayView *)showOverlayForWindow
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    MRProgressOverlayView *overlay = [MRProgressOverlayView showOverlayAddedTo:window animated:YES];
    overlay.titleLabelText = @"";
    return overlay;
}

@end
