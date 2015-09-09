//
//  APIURLs.h
//  Bruin App Builders
//
//  Created by William Gu on 8/18/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

#ifndef Bruin_App_Builders_APIURLs_h
#define Bruin_App_Builders_APIURLs_h

//replace with www.igrouply.com in production (note www. so it doesn't route)
//pass in variables are CASE-SENSITIVE, pass in JSON format.
// :variableName denotes the string you should append onto the call


#define DOMAIN_ROOT @"https://gsm.herokuapp.com"

#define API_LOGIN_STATUS @"/api/appLoginStatus" //returns _id with id or 0 for not logged in

//Login user
#define API_POST_LOGIN @"/login"  //pass in email : ..,  password: ..

//Create account
#define API_POST_CREATE_ACCOUNT @"/createAccount" //pass in email, password,  phoneNumber, firstName, lastName



//Requires logged in user to access endpoints

#define API_GET_LOGOUT @"/logout"


//Get all users
#define API_GET_USERS @"/api/users" //add "/:userID" to get specific user

#define API_GET_SEARCH_USERS @"/api/searchUsers" //add /:searchText to search users

//Gets conversations user is a part of
#define API_GET_MESSAGES @"/api/messages" //add /:convoID to get messages for thread

//add ?level=# (REQUIRED) to get all groups user is in for that level
#define API_GET_GROUPS @"/api/groups" //add /:groupID to get specific group info


//Get all events user is invited to
#define API_GET_EVENTS @"/api/events" //add /all to get all events

//Creates a new message thread with user and passed in user
#define API_POST_MESSAGES @"/api/messages" //pass in _id, fullName
    //Add /:convoID and pass in text to send message to message thread

//Edit account info
#define API_POST_USERS "/api/users" //add /:userID pass in topFiveTime (string), canOffer (array), wants (array)







//***********

#endif
