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

    NSDictionary *parameters = @{@"email": email, @"password": password};
    [manager POST:@"http://www.igrouply.com/login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [_delegate loginResponse:responseObject];
         
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [_delegate loginResponse:[error description]];
    }];

}

@end
