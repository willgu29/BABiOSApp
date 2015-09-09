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
-(void)loginStatus:(NSDictionary *)status; //_id or _id = 0
-(void)loginResponse:(NSDictionary *)status;
-(void)userArrayResponse:(NSArray *)userArray;
-(void)eventArrayResponse:(NSArray *)eventArray;
-(void)messageArrayResponse:(NSArray *)messageArray;


@end

@interface APIWrapper : NSObject

+ (id)sharedManager;


@property (nonatomic, assign) id delegate;


-(void)getLoginStatus;
-(void)postLogin:(NSString *)email andPassword:(NSString *)password;
-(void)getUser:(NSString *)userID; //pass nil to get all users
-(void)getEvent:(NSString *)eventID; //pass all to get all events (else nil to get events user invited to)
-(void)getMessages:(NSString *)convoID; //pass nil to get message threads, convoID to get messages
-(void)postEditProfile:(NSString *)topFiveTime canOffer:(NSArray *)canOfferArray wants:(NSArray *)wantsArray;


-(instancetype)init;

@end
