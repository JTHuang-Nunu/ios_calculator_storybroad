//
//  ViewController.swift
//  0301 N
//
//  Created by Mac18 on 2023/3/1.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var InTheMiddleOfTyping = false
    var Isfloating = false
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if digit == "."{
            InTheMiddleOfTyping = true
        }
        if !(Isfloating && digit == "."){
            if InTheMiddleOfTyping{
                let textCurrentlyIndisplay = display.text!
                display.text = textCurrentlyIndisplay + digit
            } else{
                display.text = digit
                InTheMiddleOfTyping = true
            }
        }
        
        if digit == "."{
            Isfloating = true
        }
        
        
        print("\(digit) was touched")
    }
    
    var operand1 = 0.0
    var symbolOfOperation = ""
    
    @IBAction func perforomOperation(_ sender: UIButton) {
        let Operation = sender.currentTitle!
        switch Operation {
        case "AC":
            display.text = "0"
            InTheMiddleOfTyping = false
        case "√":
            let operand = Double(display.text!)!
            display.text = String(sqrt(operand))
            InTheMiddleOfTyping = false
        case "+":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            symbolOfOperation = "+"
        case "-":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            symbolOfOperation = "-"
        case "x":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            symbolOfOperation = "x"
        case "÷":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            symbolOfOperation = "÷"
        case "%":
            operand1 = Double(display.text!)!
            InTheMiddleOfTyping = false
            symbolOfOperation = "%"
        case "±":
            let operand = Double(display.text!)!
            display.text = String(-operand)
        case "=":
            if(symbolOfOperation != ""){
                let operand2 = Double(display.text!)!
                switch symbolOfOperation{
                case "+":
                    display.text = String(operand1 + operand2)
                case "-":
                    display.text = String(operand1 - operand2)
                case "x":
                    display.text = String(operand1 * operand2)
                case "÷":
                    display.text = String(operand1 / operand2)
                case "%":
                    display.text = String(Int(operand1) % Int(operand2))
                default:
                    break
            }
            }
            InTheMiddleOfTyping = false
            symbolOfOperation = ""
        default:
            break
    }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

