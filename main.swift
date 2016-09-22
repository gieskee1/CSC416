//
//  main.swift
//  PickUpSticks
//      2 Player game of picking up 1-3 sticks from a pile of 10-100 sticks
//  Created by Elizabeth Gieske on 9/7/16.
//  Due Date: 9/14
//

import Foundation

//this function finds how many sticks are on the table
func getTotalSticks() -> Int {
    var total:Int = 0
    var initialTry:Bool = true
    while (total > 100 || total < 10){
        if initialTry {
            print("How many sticks are there on the table initially (10-100)?")
        } else {
            print("Please enter a number between 10 and 100")
        }
        let input = readLine(stripNewline: true)
        if let i = Int(input!) { //keyboard
            total = i
        }else{
            total = 0
        }
        initialTry = false
    }
    return total
}

//this function accepts how many sticks the user wants to pick up.
func getStickAmount(boundary: Int) -> Int {
    let player = 1
    var stickAmount:Int = boundary + 1
    var initialTry:Bool = true
    while (stickAmount > boundary || stickAmount < 1){
        if initialTry {
            print("Player \(player): How many sticks do you want to take (1-\(boundary))?  ")
        } else {
            print("Please enter a number between 1 and \(boundary)")
        }
        let input = readLine(stripNewline: true)
        if let i = Int(input!) { //keyboard
            stickAmount = i
        }else{
            stickAmount = boundary + 1
        }
        initialTry = false
    }
    return stickAmount
}




//main

print("Welcome to the game of sticks!")
var playAgain = 1 //boolean if user wants to play again

var stickLeftArray :[Int] = []
var stickCPUTakesArray :[Int] = [] //two arrays are parallel
var stickDict: [Int:[Int]] = [:]

for curKey in 1...100{
    if (curKey == 1){
        stickDict[curKey] = [1]
    } else if (curKey == 2){
        stickDict[curKey] = [1,2]
    }else{
        stickDict[curKey] = [1,2,3]
    }
}
//print(stickDict[54]!.count)
//var diceRoll = Int(arc4random_uniform(UInt32(3)))

while playAgain == 1 {
var totalSticks:Int = getTotalSticks()
var curPlayer = "Player 1"
var sticks = 0
var upperBoundary:Int = 3
while (totalSticks > 0){
    print("There are \(totalSticks) sticks on the board.")
    if totalSticks <= 2 {
        if totalSticks == 2 {
            upperBoundary = 2
        }else{
            upperBoundary = 1
        }
        
    }
    if (curPlayer == "Player 1"){
        var sticks = getStickAmount(upperBoundary)
        totalSticks = totalSticks - sticks
    }
    if (curPlayer == "CPU"){
        var sticks = Int(arc4random_uniform(UInt32(3)))+1
        totalSticks = totalSticks - sticks
        if (totalSticks != 0){
            stickLeftArray.append(totalSticks)
            stickCPUTakesArray.append(sticks)
        }
    }

  
    if totalSticks > 0 {
        if (curPlayer == "Player 1"){
            curPlayer = "CPU"
        }else {
            curPlayer = "Player 1"
        }
    }
    
}

print("\(curPlayer): you lose.")

    if (curPlayer == "Player 1"){
        for i in 0...(stickLeftArray.count-1){
            var rowNum = stickLeftArray[i]
            print(rowNum)
            var element = stickCPUTakesArray[i]
            stickDict[rowNum]!.append(element)
        }
    }
    
 
print("Would you like to play again? (yes = 1; no = 0)")
var correctInput = 0

while correctInput == 0 {
    let input = readLine(stripNewline: true)
    if let i = Int(input!) { //keyboard
        if ( i == 0) || (i == 1){
            playAgain = i
            correctInput = 1
        }else{
        print("Please enter 1 if yes; 0 if no.")
        }
    }else{
        print("Please enter 1 if yes; 0 if no.")
    }
}
    
    
}

/*

print(stickDict[1]!)
print(stickDict[2]!)
print(stickDict[3]!)
print(stickDict[4]!)
print(stickDict[5]!)
print(stickDict[6]!)
print(stickDict[7]!)
print(stickDict[8]!)
print(stickDict[9]!)
print(stickDict[10]!)

*/




