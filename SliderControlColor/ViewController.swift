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
    
    private var value:Float = 0
    private let minValue:Float = 0
    private let maxValue:Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultConfiguration()
        addTapGestureToHideKeyboard()
    }
    
    private func defaultConfiguration() {
        minMaxSliderValue()
        colorTrackSlider()
        configurationTextLabel()
        configurationTextField()
        colorView.layer.cornerRadius = 20
    }
    
    private func configurationTextLabel(){
        redLabel.text = "Red: \(String(format: "%.1f",redSlider.value))"
        greenLabel.text = "Green: \(String(format: "%.1f", greenSlider.value))"
        blueLabel.text = "Blue: \(String(format: "%.1f", blueSlider.value))"
    }
    private func configurationTextField(){
        redTextField.text = "\(String(format: "%.1f", redSlider.value))"
        greenTextField.text = "\(String(format: "%.1f", greenSlider.value))"
        blueTextField.text = "\(String(format: "%.1f", blueSlider.value))"
        configurationKeyboard(redTextField)
        configurationKeyboard(greenTextField)
        configurationKeyboard(blueTextField)
    }
    
    
    private func minMaxSliderValue(){
        redSlider.value = value
        greenSlider.value = value
        blueSlider.value = value
        redSlider.minimumValue = minValue
        redSlider.maximumValue = maxValue
        greenSlider.minimumValue = minValue
        greenSlider.maximumValue = maxValue
        blueSlider.minimumValue = minValue
        blueSlider.maximumValue = maxValue
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
    

    private func changedColorTextField(field:UITextField, slider: UISlider, label: UILabel, text: String) {
        let textFieldValue = Float(field.text ?? "")
        if field.text?.isEmpty == false && textFieldValue! <= 1.0 {
            slider.value = textFieldValue ?? 0
            label.text = "\(text): \(field.text!)"
        } else {
            field.text = String(value)
            allert()
        }
    }
    
    private func allert(){
        let allert = UIAlertController(title: "Attention",
                                       message: "Please enter a decimal value from 0 to 1",
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
    
    private func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        configurationTextLabel()
        configurationTextField()
        changedColorView()
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        configurationTextLabel()
        configurationTextField()
        changedColorView()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        configurationTextLabel()
        configurationTextField()
        changedColorView()
    }
    
    @IBAction func redTextAction(_ sender: UITextField) {
        changedColorTextField(field: sender, slider: redSlider, label: redLabel, text: "Red")
        changedColorView()
    }
    
    @IBAction func greenTextAction(_ sender: UITextField) {
        changedColorTextField(field: sender, slider: greenSlider, label: greenLabel, text: "Green")
        changedColorView()
    }
    
    @IBAction func blueTextAction(_ sender: UITextField) {
        changedColorTextField(field: sender, slider: blueSlider, label: blueLabel, text: "Blue")
        changedColorView()
    }
}

