//
//  AccessToken.h
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "ServerObject.h"

@interface AccessToken : ServerObject

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *refreshToken;
@property (strong, nonatomic) NSDate *expirationDate;

@end
