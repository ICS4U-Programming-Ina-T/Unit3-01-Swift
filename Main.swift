//
// Main.swift
//
// Created by Ina Tolo
// Created on 2022-4-26
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The Main program implements an application that
// gets input from user then references classes that
// performs standard Stack commands (push, pop, peek,
// and search).

import Foundation

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("Not a valid choice.\n")
}

class MyIntStack {
    // properties
    var stack: [Int]

    // default constructor
    init() {
        stack = []
    }

    // adds int to the stack
    func stackPush(userNum: Int) {
        stack.append(userNum)
        // for testing purposes only
        print("*** \(userNum) added to the stack.")
    }
}

class MyStringStack {
    // properties
    var stack: [String]

    // default constructor
    init() {
        stack = []
    }

    // adds string to the stack
    func stackPush(string: String) {
        stack.append(string)
        // for testing purposes only
        print("*** \(string) added to the stack.")
    }
}

// main part of code

// create an empty int stack
var myIntStack = MyIntStack()

// create an empty string stack
var myStringStack = MyStringStack()

// declaring variables
var userOption1Low: String = ""
var userOption2Low: String = ""
var userOption1Up: String = ""
var userOption2Up: String = ""
var userNumString: String = ""
var userCountString: String = ""
var userString: String = ""
var userNumInt: Int = 0
var userCountInt: Int = 0
var elementNum: Int = 0
let error = "Not a valid choice.\n"

while userOption1Up != "PUSH"
    || userOption1Up != "POP" || userOption1Up != "PEEK"
    || userOption1Up != "CLEAR" {

    // gets command input from the user
    print("Which command would you like to execute (push, pop, search, or peek)?: ", terminator: "")
    userOption1Low = readLine()!

    userOption1Up = userOption1Low.uppercased()

    // checks which of the commands to execute
    if userOption1Up == "PUSH" {

        while userCountInt <= 1 {
            // gets input for number of elements in the stack
            print("How many elements would you like to add?: ", terminator: "")
            userCountString = readLine()!

            do {
                userCountInt = Int(userCountString) ?? -1234567890

                if  userCountInt != Int(userCountString) {
                    try catchString()
                }

                if userCountInt <= 0 {
                    print("Not a valid choice.\n")
                    continue
                }

                while userOption2Up != "INT" || userOption2Up != "STRING" {

                    // gets users option for which stack to use
                    print("Which stack would you like to use? (Int or String): ", terminator: "")
                    userOption2Low = readLine()!

                    userOption2Up = userOption2Low.uppercased()

                    // checks which stack to use
                    if userOption2Up == "INT" {
                        while elementNum != userCountInt {
                            print()
                            print("Enter an integer you would like to add to the stack: ", terminator: "")
                            userNumString = readLine()!

                            do {
                                userNumInt = Int(userNumString) ?? -1234567890

                                if userNumInt != Int(userNumString) {
                                    try catchString()
                                }
                                // calls int stack class that holds the push function
                                myIntStack.stackPush(userNum: userNumInt)

                                // increments counter
                                elementNum += 1
                            } catch MyError.runtimeError(let errorMessage) {
                                print(errorMessage)
                            }
                        }
                        break
                    } else if userOption2Up == "STRING" {
                        while elementNum != userCountInt {
                            print()
                            print("Enter a string you would like to add to the stack: ", terminator: "")
                            userString = readLine()!

                            // calls string stack class that holds the push function
                            myStringStack.stackPush(string: userString)

                            // increments counter
                            elementNum += 1
                        }
                        break
                    } else {
                        print("Not a valid choice.\n")
                    }
                }
            } catch MyError.runtimeError(let errorMessage) {
                print(errorMessage)
            }
        }
        break
    } else if userOption1Up == "POP" {
        // fill in code later
        break
    } else if userOption1Up == "PEEK" {
        // fill in code later
        break
    } else if userOption1Up == "CLEAR" {
        // fill in code later
        break
    } else {
        print("Not a valid choice.\n")
    }
}
