//
//  ServerManager.m
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import "ServerManager.h"
#import "AFNetworking.h"
#import "User.h"
#import "AccessToken.h"


static NSString *const kBaseUrlString = @"http://video.md.uz/api/";


@interface ServerManager ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@property (strong, nonatomic, readwrite) User *currentUser;
@property (strong, nonatomic, readwrite) AccessToken *accessToken;

@end

@implementation ServerManager

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSURL *url = [NSURL URLWithString:kBaseUrlString];
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
        
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }
    return self;
}

+ (ServerManager *)sharedInstance
{
    static ServerManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ServerManager alloc] init];
    });
    
    return instance;
}

#pragma mark - Request methods

- (void)registerUserWithParameters:(NSDictionary *)params completion:(ServerManagerCompletionBlock)completion
{
    [self.sessionManager POST:@"users" parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"status code:%zd, response: %@", [self getStatusCodeFromTask:task], responseObject);
        
        NSString *errorMessage = [self getErrorMessageFromResponse:responseObject];
        if (!errorMessage)
        {
            self.currentUser = [[User alloc] initWithServerResponse:responseObject];
            if (completion) completion(YES, nil);
        }
        else
        {
            if (completion) completion(NO, errorMessage);
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (completion) completion(NO, error.localizedDescription);
        
    }];
}

- (void)authorizeUserWithParameters:(NSDictionary *)params completion:(ServerManagerCompletionBlock)completion
{
    [self.sessionManager POST:@"auth" parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"status code:%zd, response: %@", [self getStatusCodeFromTask:task], responseObject);
        
        NSString *errorMessage = [self getErrorMessageFromResponse:responseObject];
        if (!errorMessage)
        {
            self.accessToken = [[AccessToken alloc] initWithServerResponse:responseObject];
            if (completion) completion(YES, nil);
        }
        else
        {
            if (completion) completion(NO, errorMessage);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (completion) completion(NO, error.localizedDescription);
        
    }];
}

#pragma mark - Other methods

- (NSInteger)getStatusCodeFromTask:(NSURLSessionDataTask *)task
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    return response.statusCode;
}

- (NSString *)getErrorMessageFromResponse:(id)responseObject
{
    if (!responseObject[@"error"])
        return nil;
    
    return responseObject[@"error"][@"message"];
}

@end
