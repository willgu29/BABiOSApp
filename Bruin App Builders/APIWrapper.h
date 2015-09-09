//
//  APIWrapper.h
//  Bruin App Builders
//
//  Created by William Gu on 8/18/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@class APIWrapperDelegate;
@protocol APIWrapperDelegate <NSObject>

@optional
-(void)loginResponse:(NSDictionary *)status;
-(void)userArrayResponse:(NSArray *)userArray;
-(void)eventArrayResponse:(NSArray *)eventArray;

@end

@interface APIWrapper : NSObject

+ (id)sharedManager;


@property (nonatomic, assign) id delegate;



-(void)postLogin:(NSString *)email andPassword:(NSString *)password;
-(void)getUser:(NSString *)userID; //pass nil to get all users
-(void)getEvent:(NSString *)eventID; //pass all to get all events (else nil to get events user invited to)


-(instancetype)init;

@end
