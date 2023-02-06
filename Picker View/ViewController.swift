//
//  ViewController.swift
//  Picker View
//
//  Created by Aamer Essa on 14/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    var numbers = [Int]()
    var playCases = 1
    var selectedNumber = Int()
    var play1SelectrdNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateArray(rang: 500)
        pickerView.dataSource = self
        pickerView.delegate = self
        btn.isEnabled = false
        playerLabel.text = ""
        infoLabel.text = "Please select the range for the guessing game"
        btn.setTitle("Enter Range", for: .normal)
       
        
    }
    
    func generateArray(rang:Int) {
        
        for i in 1...rang {
            numbers.append(i)
        }
      
    }// end of generateArray()
   
    @IBAction func onClickBtn(_ sender: Any) {
       
        switch playCases {
            
        case 1:
           numbers.removeAll()
            generateArray(rang: selectedNumber)
            pickerView.reloadAllComponents()
            pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: numbers.count)
            pickerView.selectRow(0, inComponent: 0, animated: true)
            playerLabel.text = "Player 1"
            btn.setTitle("Enter Number", for: .normal)
            btn.isEnabled = false
            infoLabel.text = "Enter number for player2 to guess from 1 to \(numbers.count)"
            playCases += 1
            
        case 2:
            playerLabel.text = "Player 2"
            pickerView.selectRow(0, inComponent: 0, animated: true)
            btn.setTitle("Enter Guess", for: .normal)
            btn.isEnabled = false
            infoLabel.text = "Take a Guess (1 out of \(numbers.count)  or \(String(format:"%.2f",(1.0 / Double(numbers.count))*100))% chance)"
            playCases += 1
            play1SelectrdNumber = selectedNumber
        case 3:
            if play1SelectrdNumber != selectedNumber{
                playerLabel.text = "Incorrect 😢"
                infoLabel.text = "the chosen number was \(play1SelectrdNumber) and you guessed \(selectedNumber)"
                playCases += 1
                btn.setTitle("Play Again ", for: .normal )
            } else {
                playerLabel.text = "Congratulations 👏🏻🥳🎉"
                infoLabel.text = "You did it, you guessed correct"
                playCases += 1
                btn.setTitle("Play Again ", for: .normal )
            }
            
        case 4:
            numbers.removeAll()
             generateArray(rang: 500)
             pickerView.reloadAllComponents()
             pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: numbers.count)
             pickerView.selectRow(0, inComponent: 0, animated: true)
            playerLabel.text = ""
            infoLabel.text = "Please select the range for the guessing game"
            btn.setTitle("Enter Range", for: .normal)
            btn.isEnabled = false
            playCases = 1
        
        default:
            infoLabel.text = "Error"
        }// end of switch
        
      
        
    }// onClickBtn()
    
    
}

extension ViewController:UIPickerViewDelegate, UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return numbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return String(numbers[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNumber = numbers[row]
        btn.isEnabled = true
      
    }
    
}

