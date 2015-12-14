//
//  AccessToken.m
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "AccessToken.h"

@implementation AccessToken

- (instancetype)initWithServerResponse:(NSDictionary *)responseObject
{
    self = [super initWithServerResponse:responseObject];
    if (self)
    {
        self.token = responseObject[@"access_token"];
        self.refreshToken = responseObject[@"refresh_token"];
        
        NSTimeInterval expiresIn = [responseObject[@"expires_in"] doubleValue];
        self.expirationDate = [NSDate dateWithTimeIntervalSinceNow:expiresIn];
    }
    return self;
}

@end
