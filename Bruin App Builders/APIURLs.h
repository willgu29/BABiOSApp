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


//Login user
#define API_POST_LOGIN @"https://gsm.herokuapp.com/login"  //pass in email : ..,  password: ..

//Create account
#define API_POST_CREATE_ACCOUNT @"https://gsm.herokuapp.com/createAccount" //pass in email, password,  phoneNumber, firstName, lastName

//Requires logged in user to access endpoints


    //Get all users
#define API_GET_USERS @"https://gsm.herokuapp.com/api/users" //add "/:email" to get specific user








//***********

#endif
