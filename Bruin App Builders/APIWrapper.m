//
//  APIWrapper.m
//  Bruin App Builders
//
//  Created by William Gu on 8/18/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

#import "APIWrapper.h"
#import "APIURLs.h"

@interface APIWrapper()

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

@implementation APIWrapper

+ (id)sharedManager {
    static APIWrapper *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setupManager];
    }
    return self;
}

-(void)getLoginStatus
{
    NSDictionary *parameters = nil;
    NSString *getURL;
    getURL = [NSString stringWithFormat:@"%@%@", DOMAIN_ROOT,API_LOGIN_STATUS];
   
    [_manager GET:getURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        [_delegate loginStatus:responseObject];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSDictionary *dictionary = @{@"info": error};
        [_delegate loginStatus:dictionary];
    }];
}

-(void)postLogin:(NSString *)email andPassword:(NSString *)password
{
 

    NSDictionary *parameters = @{@"email": email, @"password": password};
    
    NSString *postURL = [NSString stringWithFormat:@"%@%@", DOMAIN_ROOT,API_POST_LOGIN];

    [_manager POST:postURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
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

-(void)getUser:(NSString *)userID
{
    NSDictionary *parameters = nil;
    NSString *getURL;
    if (userID){
        getURL = [NSString stringWithFormat:@"%@%@/%@", DOMAIN_ROOT,API_GET_USERS,userID];
    } else {
        getURL = [NSString stringWithFormat:@"%@%@", DOMAIN_ROOT,API_GET_USERS];
    }
    NSLog(@"URL: %@", getURL);
    [_manager GET:getURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
  
        [_delegate userArrayResponse:responseObject];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSArray *errorArray = @[];
        [_delegate userArrayResponse:errorArray];
    }];
}

-(void)getEvent:(NSString *)eventID
{
    NSDictionary *parameters = nil;
    NSString *getURL;
    if (eventID){
        getURL = [NSString stringWithFormat:@"%@%@/%@", DOMAIN_ROOT,API_GET_EVENTS,eventID];
    } else {
        getURL = [NSString stringWithFormat:@"%@%@", DOMAIN_ROOT,API_GET_EVENTS];
    }
    [_manager GET:getURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        [_delegate eventArrayResponse:responseObject];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSArray *errorArray = @[];
        [_delegate eventArrayResponse:errorArray];
    }];
}

-(void)getMessages:(NSString *)convoID
{
    NSDictionary *parameters = nil;
    NSString *getURL;
    if (convoID){
        getURL = [NSString stringWithFormat:@"%@%@/%@", DOMAIN_ROOT,API_GET_MESSAGES,convoID];
    } else {
        getURL = [NSString stringWithFormat:@"%@%@", DOMAIN_ROOT,API_GET_MESSAGES];
    }
    [_manager GET:getURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        [_delegate messageArrayResponse:responseObject];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSArray *errorArray = @[];
        [_delegate messageArrayResponse:errorArray];
    }];
}


-(void)postEditProfile:(NSString *)topFiveTime canOffer:(NSArray *)canOfferArray wants:(NSArray *)wantsArray
{
    NSDictionary *parameters = @{@"topFiveTime":topFiveTime,@"canOffer":canOfferArray,@"wants":wantsArray};
    
    NSString *postURL = [NSString stringWithFormat:@"%@%@/%@",DOMAIN_ROOT,API_POST_USERS,@"me"];
    
    [_manager POST:postURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        //[_delegate loginResponse:responseObject];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        //[_delegate loginResponse:dictionary];
    }];
    
}

#pragma mark - Helper methods

-(void)setupManager
{
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    //AFHTTPResponseSerializer *responseSerializerHTTP = [AFHTTPResponseSerializer serializer];
    _manager.responseSerializer = responseSerializer;
    _manager.responseSerializer.acceptableContentTypes =  [_manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
}

@end
