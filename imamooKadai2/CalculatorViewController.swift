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

    override func viewDidLoad() {
        // UISegmentedControllの見た目を課題に近づけるようにトライ
        // 非選択の背景色を透過させるには画像を使う必要があるようなので断念
        calcMethodSegmentedControll.selectedSegmentTintColor = UIColor.systemBlue
        calcMethodSegmentedControll.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected
        )
        calcMethodSegmentedControll.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .normal
        )
        calcMethodSegmentedControll.layer.borderWidth = 2
        calcMethodSegmentedControll.layer.borderColor = UIColor.systemBlue.cgColor
    }

    @IBAction private func buttonPressed(_ sender: UIButton) {
        let number1 = Double(topTextField.text ?? "") ?? 0.0
        let number2 = Double(bottomTextField.text ?? "") ?? 0.0
        let index = calcMethodSegmentedControll.selectedSegmentIndex

        var resultString: String {
            switch calcMethodSegmentedControll.titleForSegment(at: index) {
            case "+":
                return String(number1 + number2)
            case "-":
                return String(number1 - number2)
            case "×":
                return String(number1 * number2)
            case "÷":
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
