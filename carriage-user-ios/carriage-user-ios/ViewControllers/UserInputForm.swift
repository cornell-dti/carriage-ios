//
//  UserInputForm.swift
//  Carriage
//
//

import UIKit
import SnapKit

var firstNameInput: String! = ""
var lastNameInput: String! = ""
var timeInput: String! = ""
var locationInput: String! = ""

class UserInputForm: UIViewController {
    
    var userFirstNameField: UITextField!
    var userLastNameField: UITextField!
    var userPickupTimeField: UITextField!
    var userPickupLocationField: UITextField!
    
    var submitButton: UIButton!
    
    var newUser: UserInputModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "User Input Form"
        
        newUser = UserInputModel(userFirstName: "", userLastName: "", pickUpTime: "", pickUpLocation: "")
        
        userFirstNameField = UITextField()
        userFirstNameField.translatesAutoresizingMaskIntoConstraints = false
        userFirstNameField.placeholder = "First Name"
        userFirstNameField.textColor = .black
        userFirstNameField.addTarget(self, action: #selector(firstNameFieldDidChange(textField:)), for: .editingChanged)
        view.addSubview(userFirstNameField)
        
        userLastNameField = UITextField()
        userLastNameField.translatesAutoresizingMaskIntoConstraints = false
        userLastNameField.placeholder = "Last Name"
        userLastNameField.textColor = .black
        userFirstNameField.addTarget(self, action: #selector(lastNameFieldDidChange), for: .editingChanged)
        view.addSubview(userLastNameField)
        
        userPickupTimeField = UITextField()
        userPickupTimeField.translatesAutoresizingMaskIntoConstraints = false
        userPickupTimeField.placeholder = "Pickup Time"
        userPickupTimeField.textColor = .black
        userFirstNameField.addTarget(self, action: #selector(timeFieldDidChange), for: .editingChanged)
        view.addSubview(userPickupTimeField)
        
        userPickupLocationField = UITextField()
        userPickupLocationField.translatesAutoresizingMaskIntoConstraints = false
        userPickupLocationField.placeholder = "Pickup Location"
        userPickupLocationField.textColor = .black
        userFirstNameField.addTarget(self, action: #selector(locationFieldDidChange), for: .editingChanged)
        view.addSubview(userPickupLocationField)
        
        submitButton = UIButton()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Submit", for: .normal)
        //TODO: set up objc function to change user upon input depending on text fields
        submitButton.addTarget(self, action: #selector(submitUserData), for: .touchUpInside)
        submitButton.backgroundColor = .red
        view.addSubview(submitButton)
        
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        
        let box = UIView()
        view.addSubview(box)
        
        box.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        NSLayoutConstraint.activate([
            userFirstNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userFirstNameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
            userFirstNameField.heightAnchor.constraint(equalToConstant: 25),
            userFirstNameField.widthAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate([
            userLastNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userLastNameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25),
            userLastNameField.heightAnchor.constraint(equalToConstant: 25),
            userLastNameField.widthAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate([
            userPickupTimeField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPickupTimeField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 25),
            userPickupTimeField.heightAnchor.constraint(equalToConstant: 25),
            userPickupTimeField.widthAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate([
            userPickupLocationField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPickupLocationField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75),
            userPickupLocationField.heightAnchor.constraint(equalToConstant: 25),
            userPickupLocationField.widthAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 125),
            submitButton.heightAnchor.constraint(equalToConstant: 25),
            submitButton.widthAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    //TODO: abstract these functions!
    
    @objc func firstNameFieldDidChange(textField: UITextField) {
        if (textField.text == textField.placeholder) {
            //TODO error message
        }
        else {
            firstNameInput = textField.text!
        }
    }
    
    @objc func lastNameFieldDidChange(textField: UITextField) {
        if (textField.text == textField.placeholder) {
            //TODO error message
        }
        else {
            lastNameInput = textField.text!
        }
    }
    
    @objc func timeFieldDidChange(textField: UITextField) {
        if (textField.text == textField.placeholder) {
            //TODO error message
        }
        else {
            timeInput = textField.text!
        }
    }
    
    @objc func locationFieldDidChange(textField: UITextField) {
        if (textField.text == textField.placeholder) {
            //TODO error message
        }
        else {
            locationInput = textField.text!
        }
    }
    
    @objc func submitUserData() {
        
        let newUser = UserInputModel(userFirstName: "", userLastName: "", pickUpTime: "", pickUpLocation: "")
        
        //UITextFields do not differentiate between nil and ""
        if (firstNameInput == "" || lastNameInput == "" || locationInput == "" || timeInput == "") {
            //TODO throw some error message that user has not inputed all info
        }
            
        else {
            newUser.userFirstName = firstNameInput
            newUser.userLastName = lastNameInput
            newUser.pickUpTime = timeInput
            newUser.pickUpLocation = locationInput
        }
    }
    
}
