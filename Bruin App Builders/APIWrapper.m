//
//  APIWrapper.m
//  Bruin App Builders
//
//  Created by William Gu on 8/18/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

#import "APIWrapper.h"
#import "APIURLs.h"

@implementation APIWrapper

-(void)postLogin:(NSString *)email andPassword:(NSString *)password
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer = responseSerializer;

    NSDictionary *parameters = @{@"email": email, @"password": password};
    [manager POST:API_POST_LOGIN parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSString class]]) {
            responseObject = @{@"message" : @"/"};
        }
        [_delegate loginResponse:responseObject];
         
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSDictionary *dictionary = @{@"info": error};
        [_delegate loginResponse:dictionary];
    }];

}

@end
