//
//  User.h
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "ServerObject.h"

@interface User : ServerObject

@property (strong, nonatomic) NSString *_id;
@property (strong, nonatomic) NSString *email;
@property (assign, nonatomic, getter=isCheckEmail) BOOL checkEmail;

@end
