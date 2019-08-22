//
//  ViewController.swift
//  Calculator
//
//  Created by Danielle Gomes on 2019-08-21.
//  Copyright © 2019 Danielle Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textInput: UITextField!
    
    @IBOutlet var clearButton: UIButton!

    @IBOutlet var sumButton: UIButton!

    @IBOutlet var subtractionButton: UIButton!

    @IBOutlet var multiplicationButton: UIButton!

    @IBOutlet var divisionButton: UIButton!

    @IBOutlet var resultButton: UIButton!
    
    var numbsAndOperatorsArray: [String] = []
    var isNewNumber: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        textInput.text = ""
        isNewNumber = true
        numbsAndOperatorsArray = []
    }
    
    @IBAction func oparatorButtonTapped(_ sender: UIButton) {
        if textInput.text! != "" {
            numbsAndOperatorsArray.append(textInput.text!)
        }
        numbsAndOperatorsArray.append(sender.title(for: .normal)!)
        isNewNumber = true

    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        if !isNewNumber {
            numbsAndOperatorsArray.append(textInput.text!)
        }
        textInput.text = arithmeticOperation(stringArrayOfNumsAndOperators1: numbsAndOperatorsArray)
        
        isNewNumber = true
        numbsAndOperatorsArray.removeAll()
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if isNewNumber {
            textInput.text = sender.title(for: .normal)!
            isNewNumber = false
        } else {
            textInput.text = textInput.text! + sender.title(for: .normal)!
        }
        
    }
    
    func arithmeticOperation(stringArrayOfNumsAndOperators1: [String]) -> String {
        var stringArrayOfNumsAndOperators = stringArrayOfNumsAndOperators1
        if Int(stringArrayOfNumsAndOperators[0]) == nil {
            stringArrayOfNumsAndOperators.remove(at: 0)
        }
        if stringArrayOfNumsAndOperators.count == 1 {
            return stringArrayOfNumsAndOperators[0]
        } else {
            return arithmeticOperation(stringArrayOfNumsAndOperators1: arithmeticOperationHelper(numsAndOperatorsArray: stringArrayOfNumsAndOperators))
        }
    }
    
    
    func arithmeticOperationHelper(numsAndOperatorsArray: [String]) -> [String] {
        var num1: Int = 0
        var num2: Int = 0
        var numsAndOperators = numsAndOperatorsArray
        
        for i in 0..<numsAndOperators.count {
            if numsAndOperators[i] == "x" {
                if i+1 == numsAndOperators.count {
                    numsAndOperators.remove(at: numsAndOperators.count - 1)
                } else {
                    num1 = Int(numsAndOperators[i-1])!
                    num2 = Int(numsAndOperators[i+1])!
                    numsAndOperators[i] = String(format: "%d", num1*num2)
                    numsAndOperators.remove(at: i+1)
                    numsAndOperators.remove(at: i-1)
                }
                
                return numsAndOperators
            }
            
            if numsAndOperators[i] == "/" {
                if i+1 == numsAndOperators.count {
                    numsAndOperators.remove(at: numsAndOperators.count - 1)
                } else {
                    num1 = Int(numsAndOperators[i-1])!
                    num2 = Int(numsAndOperators[i+1])!
                    numsAndOperators[i] = String(format: "%d", num1/num2)
                    numsAndOperators.remove(at: i+1)
                    numsAndOperators.remove(at: i-1)
                }
                return numsAndOperators
            }
            
        }
        
        for i in 0..<numsAndOperators.count {
            if numsAndOperators[i] == "+" {
                if i+1 == numsAndOperators.count {
                    numsAndOperators.remove(at: numsAndOperators.count - 1)
                } else {
                    num1 = Int(numsAndOperators[i-1])!
                    num2 = Int(numsAndOperators[i+1])!
                    numsAndOperators[i] = String(format: "%d", num1+num2)
                    numsAndOperators.remove(at: i+1)
                    numsAndOperators.remove(at: i-1)
                }
                
                return numsAndOperators
            }
            
            if numsAndOperators[i] == "-" {
                if i+1 == numsAndOperators.count {
                    numsAndOperators.remove(at: numsAndOperators.count - 1)
                } else {
                    num1 = Int(numsAndOperators[i-1])!
                    num2 = Int(numsAndOperators[i+1])!
                    numsAndOperators[i] = String(format: "%d", num1-num2)
                    numsAndOperators.remove(at: i+1)
                    numsAndOperators.remove(at: i-1)
                }
                return numsAndOperators
            }
            
        }
        return numsAndOperators
    }

}

