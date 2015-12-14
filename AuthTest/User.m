//
//  User.m
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithServerResponse:(NSDictionary *)responseObject
{
    self = [super initWithServerResponse:responseObject];
    if (self)
    {
        self._id = responseObject[@"id"];
        self.email = responseObject[@"email"];
        self.checkEmail = [responseObject[@"checkemail"] boolValue];
    }
    return self;
}

@end
