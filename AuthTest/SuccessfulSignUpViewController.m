//
//  SuccessfulSignUpViewController.m
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "SuccessfulSignUpViewController.h"
#import "ServerManager.h"
#import "User.h"

@interface SuccessfulSignUpViewController ()

@end

@implementation SuccessfulSignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userIdLabel.text = [NSString stringWithFormat:@"User ID: %@", g_currentUser._id];
    self.userEmailLabel.text = [NSString stringWithFormat:@"Email: %@", g_currentUser.email];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
