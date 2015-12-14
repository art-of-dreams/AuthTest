//
//  SuccessfulSignInViewController.h
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuccessfulSignInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *accessTokenLabel;
@property (weak, nonatomic) IBOutlet UILabel *refreshTokenlabel;
@property (weak, nonatomic) IBOutlet UILabel *expirationDateLabel;

@end
