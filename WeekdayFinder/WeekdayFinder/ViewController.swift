//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 Kseniia Prytkova. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTF.delegate = self
        monthTF.delegate = self
        yearTF.delegate = self
    }

//    limit number of symbols for each text field respectively
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        if textField == dateTF {
            return count <= 2
        } else if textField == monthTF {
            return count <= 2
        } else if textField == yearTF {
            return count <= 4
        } else {
            return count <= 0
        }
    }
    
    func isStringContainsOnlyNumbers(string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    @IBAction func findDay(_ sender: UIButton) {
//        check if text fields do not contain an empty strings
        guard let day = dateTF.text, !day.isEmpty, let month = monthTF.text, !month.isEmpty, let year = yearTF.text, !year.isEmpty, let intDay = Int(day), let intMonth = Int(month) else {
            resultLabel.text = "Your input is invalid (empty fields)"; return }
        
        if isStringContainsOnlyNumbers(string: day), isStringContainsOnlyNumbers(string: month), isStringContainsOnlyNumbers(string: year) {
            if 1...31 ~= intDay, 1...12 ~= intMonth {
                dateComponents.day = Int(day)
                dateComponents.month = Int(month)
                dateComponents.year = Int(year)

                dateFormatter.dateFormat = "EEEE"

                guard let date = calendar.date(from: dateComponents) else { return }

                let weekday = dateFormatter.string(from: date)

                resultLabel.text = weekday
            } else {
                resultLabel.text = "Your input is invalid (out of range)"
            }
        } else {
            resultLabel.text = "Your input is not a number!"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
