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

-(void)loginResponse:(NSString *)status;

@end

@interface APIWrapper : NSObject


@property (nonatomic, assign) id delegate;
-(void)postLogin:(NSString *)email andPassword:(NSString *)password;
@end
