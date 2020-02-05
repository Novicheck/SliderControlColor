//
//  ViewController.swift
//  SliderControlColor
//
//  Created by Denis on 01.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultConfiguration()
    }
    
    private func defaultConfiguration() {
        colorTrackSlider()
        configurationTextLabel()
        configurationTextField()
        colorView.layer.cornerRadius = 20
    }
    
    private func configurationTextLabel(){
        redLabel.text = "\(String(format: "%.1f",redSlider.value))"
        greenLabel.text = "\(String(format: "%.1f", greenSlider.value))"
        blueLabel.text = "\(String(format: "%.1f", blueSlider.value))"
    }
    private func configurationTextField(){
        redTextField.text = "\(String(format: "%.1f", redSlider.value))"
        greenTextField.text = "\(String(format: "%.1f", greenSlider.value))"
        blueTextField.text = "\(String(format: "%.1f", blueSlider.value))"
        configurationKeyboard(redTextField)
        configurationKeyboard(greenTextField)
        configurationKeyboard(blueTextField)
    }
    
    private func colorTrackSlider(){
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        redSlider.maximumTrackTintColor = .black
        greenSlider.maximumTrackTintColor = .black
        blueSlider.maximumTrackTintColor = .black
    }
    
    private func changedColorView() {
        let backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                      green: CGFloat(greenSlider.value),
                                      blue: CGFloat(blueSlider.value), alpha: 1)
        colorView.backgroundColor = backgroundColor
    }
    

    
    @IBAction func SliderChanged(_ sender: UISlider) {
        configurationTextLabel()
        configurationTextField()
        changedColorView()
    }
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        if let value = Float(text) {
            switch textField.tag {
            case 0:
                redSlider.setValue(value, animated: true)
                configurationTextLabel()
            case 1:
                greenSlider.setValue(value, animated: true)
                configurationTextLabel()
            case 2:
                blueSlider.setValue(value, animated: true)
                configurationTextLabel()
            default:
                break
            }
            changedColorView()
        } else {
            textField.text = "0.0"
            allert()
        }
    }
}

extension ViewController {
    
    private func allert(){
        let allert = UIAlertController(title: "Attention",
                                       message: "Please enter a decimal value \n from 0 to 1",
                                       preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        allert.addAction(action)
        present(allert, animated: true, completion: nil)
    }
    
    private func configurationKeyboard(_ textField: UITextField){
        textField.keyboardType = .decimalPad
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.items = [flexBarButton,doneBarButton]
        textField.inputAccessoryView = keyboardToolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
