//
//  DataModel.swift
//  SwiftChinaLucky
//
//  Created by Ron on 26/6/14.
//  Copyright (c) 2014 HGG. All rights reserved.
//

import Foundation

struct DataModel {
    
    struct DataModelPrivate {
        static var userDefaultObj = NSUserDefaults(suiteName: "DataModel")
        static let kMaxNumber = "maxNumber"
        static let kMaxTime = "maxTime"
        static let kRandomSeq = "randomSeq"
    }

    static var maxTime:Int {
        get{
        
            var value = DataModelPrivate.userDefaultObj.integerForKey(DataModelPrivate.kMaxTime)
            value = max(value,5)
            return value;
        
        }
        set{
            
            DataModelPrivate.userDefaultObj.setInteger(newValue, forKey:DataModelPrivate.kMaxTime)
            DataModelPrivate.userDefaultObj.synchronize()
            
        }
    }
    
    static var maxNumber:Int {
        get{
            
            var value = DataModelPrivate.userDefaultObj.integerForKey(DataModelPrivate.kMaxNumber)
            value = max(value,100)
            return value;
            
        }
        set{
            
            DataModelPrivate.userDefaultObj.setInteger(newValue, forKey:DataModelPrivate.kMaxNumber)
            DataModelPrivate.userDefaultObj.synchronize()
            
        }
    }
    
    static func addNumber(newNumber: Int){
        var randomSeqObj : AnyObject! = DataModelPrivate.userDefaultObj.objectForKey(DataModelPrivate.kRandomSeq)
        if var randomInts = randomSeqObj as? Int[]{
            if(randomInts.count < DataModel.maxTime){
                randomInts.append(newNumber)
                DataModelPrivate.userDefaultObj.setObject(randomInts, forKey: DataModelPrivate.kRandomSeq)
            }
        }else {
            DataModelPrivate.userDefaultObj.setObject([newNumber], forKey: DataModelPrivate.kRandomSeq)
        }
        DataModelPrivate.userDefaultObj.synchronize()
    }
    
    static func pickAllRandomNumbers() -> Int[]?{
        var randomSeqObj : AnyObject! = DataModelPrivate.userDefaultObj.objectForKey(DataModelPrivate.kRandomSeq)
        if let randomInts = randomSeqObj as? Int[]{
            return randomInts
        }
        return nil
    }
    
    static func resetDatas(){
        DataModelPrivate.userDefaultObj.removeObjectForKey(DataModelPrivate.kRandomSeq)
        DataModelPrivate.userDefaultObj.synchronize()
    }
    
    static func createARandomNumber() -> Int{
        let randomNum = Int(arc4random_uniform(UInt32(DataModel.maxNumber)) + 1)
        if let randomSeq = DataModel.pickAllRandomNumbers() {
            if(contains(randomSeq, randomNum)){
                return DataModel.createARandomNumber()
            }
        }
        return randomNum
    }
    
}