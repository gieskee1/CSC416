//
//  main.swift
//  PickUpSticks
//
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
func getStickAmount(boundary: Int, player: Int) -> Int {
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


var totalSticks:Int = getTotalSticks()
var playerNum:Int = 1
var sticks = 0
var upperBoundary:Int = 3
while (totalSticks > 0){
    print("There are \(totalSticks) sticks on the board.")
    if totalSticks <= 3 {
        if totalSticks == 3 {
            upperBoundary = 2
        }else{
            upperBoundary = 1
        }
        
    }
    var sticks = getStickAmount(upperBoundary,player: playerNum)
    totalSticks = totalSticks - sticks
    if totalSticks > 0 {
        if (playerNum == 1){
            playerNum = 2
        }else {
            playerNum = 1
        }
    }
}

print("Player \(playerNum): you lose.")












