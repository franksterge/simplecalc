//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    let operators = ["+", "-", "*", "/", "%", "count", "avg", "fact"];
    public func calculate(_ args: [String]) -> Int {
        var result = 0;
        for element in args {
            if operators.contains(element) { //check if there is operator in the argument
                let ope = element
                if grammarChecker(args, ope) {
                    let opeIndex = args.firstIndex(of: ope);
                    switch ope {
                    case operators[0]:
                        result = Int(args[opeIndex! - 1])! + Int(args[opeIndex! + 1])!
                    case operators[1]:
                        result = Int(args[opeIndex! - 1])! - Int(args[opeIndex! + 1])!
                    case operators[2]:
                        result = Int(args[opeIndex! - 1])! * Int(args[opeIndex! + 1])!
                    case operators[3]:
                        result = Int(args[opeIndex! - 1])! / Int(args[opeIndex! + 1])!
                    case operators[4]:
                        result = Int(args[opeIndex! - 1])! % Int(args[opeIndex! + 1])!
                    case operators[5]:
                        result = args.count - 1
                    case operators[6]:
                        if args.count != 1 {
                            var sum = 0
                            for i in 0...args.count - 2 {
                                sum += Int(args[i])!
                            }
                            result = sum / (args.count - 1)
                        }
                    default:
                        if args.count == 2 {
                            result = fact(Int(args[0])!)
                        }
                    }
                }
                
            }
        }
        return result;
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    //check if the index of the operator is legal.
    //Legal index:
    //    basic operators: between two numbers;
    //    complex operators: at the end.
    private func grammarChecker(_ args: [String], _ ope: String) -> Bool {
        let opeIndex = operators.firstIndex(of: ope)!;
        switch opeIndex {
        case 0...4:
            return args.firstIndex(of: ope) != 0 && args.firstIndex(of: ope) != args.count - 1
        default:
            return args.firstIndex(of: ope) == args.count - 1
        }
    }
    
    //find the factorial for the given integer and return the result.
    private func fact(_ num: Int) -> Int {
        switch num {
        case 0:
            return 1
        default:
            return num * fact(num - 1)
        }
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

