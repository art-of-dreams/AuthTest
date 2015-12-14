//
//  ServerObject.h
//  AuthTest
//
//  Created by Denis on 14.12.15.
//  Copyright © 2015 Denis Vasilyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerObject : NSObject

- (instancetype)initWithServerResponse:(NSDictionary *)responseObject;

@end
