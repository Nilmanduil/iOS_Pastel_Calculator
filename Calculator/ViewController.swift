//
//  ViewController.swift
//  Calculator
//
//  Created by Thibault Goudouneix on 23/10/2017.
//  Copyright © 2017 Thibault Goudouneix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    
    var inputNumber: Int = 0
    var storedNumber: Int = 0
    var operation: String?
    
    @IBAction func didPressZero(_ sender: Any) {
        didPressDigit(digit: 0)
    }
    @IBAction func didPressOne(_ sender: Any) {
        didPressDigit(digit: 1)
    }
    @IBAction func didPressTwo(_ sender: Any) {
        didPressDigit(digit: 2)
    }
    @IBAction func didPressThree(_ sender: Any) {
        didPressDigit(digit: 3)
    }
    @IBAction func didPressFour(_ sender: Any) {
        didPressDigit(digit: 4)
    }
    @IBAction func didPressFive(_ sender: Any) {
        didPressDigit(digit: 5)
    }
    @IBAction func didPressSix(_ sender: Any) {
        didPressDigit(digit: 6)
    }
    @IBAction func didPressSeven(_ sender: Any) {
        didPressDigit(digit: 7)
    }
    @IBAction func didPressEight(_ sender: Any) {
        didPressDigit(digit: 8)
    }
    @IBAction func didPressNine(_ sender: Any) {
        didPressDigit(digit: 9)
    }
    func didPressDigit(digit: Int) {
        if inputNumber == 0 {
            inputNumber = digit
        } else {
            let strInput: String = String(describing: inputNumber) + String(describing: digit)
            
            print(inputNumber)
            print(digit)
            
            inputNumber = Int(strInput)!
        }
        refreshNumber()
    }
    
    func refreshNumber() {
        resultLabel.text = (inputNumber == 0 ? "" : String(describing: inputNumber))
        storeLabel.text = String(describing: storedNumber)
    }
    
    
    @IBAction func didPressOperator(_ sender: Any) {
        guard let operatorButton = sender as? UIButton else {
            return
        }
        
        let operation : String = (operatorButton.titleLabel?.text)!
        operationLabel.text = operation
        
        if storedNumber == 0 {
            toStorage()
        } else {
            var result: Int = 0
            if inputNumber == 0 {
                return;
            }
            switch operation {
                case "+":
                    result = storedNumber + inputNumber
                case "-":
                    result = storedNumber - inputNumber
                case "X":
                    result = storedNumber * inputNumber
                case "÷":
                    result = storedNumber / inputNumber
                default:
                    return;
            }
            storedNumber = result
            inputNumber = 0
            operationLabel.text = ""
            refreshNumber()
        }
    }
    
    func toStorage() {
        storedNumber = inputNumber
        inputNumber = 0
        refreshNumber()
    }
    
    @IBAction func didPressEqual(_ sender: Any) {
        let operation : String = operationLabel.text!
        
        if storedNumber == 0 {
            toStorage()
        } else {
            var result: Int = 0
            switch operation {
            case "+":
                result = storedNumber + inputNumber
                storedNumber = result
                inputNumber = 0
                operationLabel.text = ""
            case "-":
                result = storedNumber - inputNumber
                storedNumber = result
                inputNumber = 0
                operationLabel.text = ""
            case "X":
                if inputNumber == 0 {
                    return;
                } else {
                    result = storedNumber * inputNumber
                    storedNumber = result
                    inputNumber = 0
                    operationLabel.text = ""
                }
                
            case "÷":
                if inputNumber != 0 {
                    result = storedNumber / inputNumber
                    storedNumber = result
                    inputNumber = 0
                    operationLabel.text = ""
                }
            default:
                toStorage()
            }
            refreshNumber()
        }
    }
    
    @IBAction func didPressCancel(_ sender: Any) {
        inputNumber = 0
        resultLabel.text = ""
        storedNumber = 0
        storeLabel.text = ""
        operationLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // self.view.backgroundColor = .red
            }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resultLabel.alpha = 0
        self.operationLabel.alpha = 0
        self.storeLabel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2) {
            self.resultLabel.alpha = 1
            self.operationLabel.alpha = 1
            self.storeLabel.alpha = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.backgroundColor = .yellow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

