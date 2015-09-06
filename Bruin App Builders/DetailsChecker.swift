//
//  DetailsChecker.swift
//  Bruin App Builders
//
//  Created by Suchit Panjiyar on 9/5/15.
//  Copyright (c) 2015 Gu Studios. All rights reserved.
//

import Foundation

class Checker
{
    func isUserNameWrong(un : String) -> Bool
    {
        var twoParts = split(un) {$0 == "@"}
        if (twoParts.count != 2)
        {
            return true
        }
        var dotChecker = split(twoParts[1]) {$0 == "."}
        if dotChecker.count <= 1
        {
            return true
        }
        return false
    }
    
    func isPhoneNumberWrong(un : String) -> Bool
    {
        if count(un) != 10
        {
            return false
        }
        return un.toInt() != nil
    }
    
    
//    private var numberOfGroupsSuggested : Int = 5
//    private var numberofgeneralsuggestions : Int = 10
//    
//     Will, Gotta reset these after some time
//    
//    func isGroupSuggestionLeft() -> Bool
//    {
//        return numberOfGroupsSuggested > 0
//    }
//    
//    func isGeneralSuggestionLeft() -> Bool
//    {
//        return numberofgeneralsuggestions > 0
//    }
//    
//    func groupSuggested()
//    {
//        numberOfGroupsSuggested--
//    }
//    
//    func generalSuggestions()
//    {
//        numberofgeneralsuggestions--
//    }
    
}