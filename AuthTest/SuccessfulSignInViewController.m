//
//  SuccessfulSignInViewController.m
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "SuccessfulSignInViewController.h"
#import "ServerManager.h"
#import "AccessToken.h"

@interface SuccessfulSignInViewController ()

@end

@implementation SuccessfulSignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.accessTokenLabel.text = [NSString stringWithFormat:@"Token: %@", g_accessToken.token];
    self.refreshTokenlabel.text = [NSString stringWithFormat:@"Refresh token: %@", g_accessToken.refreshToken];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd.MM.yyyy HH:mm:ss";
    self.expirationDateLabel.text = [NSString stringWithFormat:@"Expiration date: %@", [formatter stringFromDate:g_accessToken.expirationDate]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
