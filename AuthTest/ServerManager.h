//
//  ServerManager.h
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ServerManagerCompletionBlock)(BOOL isSuccessfully, NSString *errorMessage);

@class User, AccessToken;


@interface ServerManager : NSObject

@property (strong, nonatomic, readonly) User *currentUser;
@property (strong, nonatomic, readonly) AccessToken *accessToken;

+ (ServerManager *)sharedInstance;

- (void)registerUserWithParameters:(NSDictionary *)params completion:(ServerManagerCompletionBlock)completion;
- (void)authorizeUserWithParameters:(NSDictionary *)params completion:(ServerManagerCompletionBlock)completion;

@end


#define g_serverManager [ServerManager sharedInstance]
#define g_currentUser [ServerManager sharedInstance].currentUser
#define g_accessToken [ServerManager sharedInstance].accessToken