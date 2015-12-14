//
//  CredentialsViewController.h
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CredentialsViewControllerTypeSignUp,
    CredentialsViewControllerTypeSignIn
} CredentialsViewControllerType;


@interface CredentialsViewController : UITableViewController

@property (assign, nonatomic) CredentialsViewControllerType type;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)actionDone:(UIBarButtonItem *)sender;

@end
