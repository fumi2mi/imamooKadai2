//
//  ViewController.swift
//  imamooKadai2
//
//  Created by Fumitaka Imamura on 2021/07/10.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var topTextField: UITextField!
    @IBOutlet private weak var bottomTextField: UITextField!
    @IBOutlet private weak var calcMethodSegmentedControll: UISegmentedControl!
    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func buttonPressed(_ sender: UIButton) {
        let number1 = Double(topTextField.text ?? "") ?? 0.0
        let number2 = Double(bottomTextField.text ?? "") ?? 0.0

        var resultString: String {
            switch calcMethodSegmentedControll.selectedSegmentIndex {
            case 0:
                return String(number1 + number2)
            case 1:
                return String(number1 - number2)
            case 2:
                return String(number1 * number2)
            case 3:
                if number2 == 0.0 {
                    return "割る数には0以外を入力してください"
                }
                return String(number1 / number2)
            default:
                return ""
            }
        }
        resultLabel.text = resultString
    }
}
