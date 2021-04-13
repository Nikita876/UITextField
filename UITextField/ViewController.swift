//
//  ViewController.swift
//  UITextField
//
//  Created by Никита Коголенок on 21.12.20.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 0
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 3
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        textField.placeholder = "Enter your name"
        textField.backgroundColor = .white
        
        button.setTitle("Done", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
    }
    // MARK: - Action
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected!"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected!"
            label.textColor = .yellow
        case 2:
            label.text = "The third segment is selected!"
            label.textColor = .green
        default:
            print("Something wrong!")
        }
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        guard textField.text?.isEmpty == false else { return }
        
        if Double(textField.text!) != nil {
            let alert = UIAlertController(title: "Wrong format", message: "Please,enter your name!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            print("Name format is wrong!")
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
}

