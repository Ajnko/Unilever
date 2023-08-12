//
//  SignInViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 13/05/23.
//

import UIKit
import SnapKit

protocol PhoneNumberDelegate {
    func getPhoneNumber(num: String)
}

class SignInViewController: UIViewController {
        
    var delegate: PhoneNumberDelegate?
    
    //MARK: - Title Label
    
    let titleLabel: UILabel = {
      let label = UILabel()
        label.text = "Sign In"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    //MARK: - Mobile number asking Label
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.text = "Enter Your Mobile Number"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - Mobile Phone Number Text Field
    
    let phoneNumberTextField: UITextField = {
       let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textField.layer.cornerRadius = 30
        textField.placeholder = " Enter your Mobile Number "
        return textField
    }()
    
    //MARK: - Next Button
    
    let nextButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.shadowRadius = 2
        button.layer.cornerRadius = 30
        button.layer.shadowOpacity = 0.2
        button.setTitle("NEXT", for: .normal)
        button.layer.shadowColor = UIColor.blue.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 15)
        return button
    }()
    
    //MARK: - Or Label
    
    let orLabel: UILabel = {
       let label = UILabel()
        label.text = "Or"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - Facebook or Instagram Log In Button
    
    let logInButton: UIButton = {
       let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemBackground
        button.contentHorizontalAlignment = .center
        button.setTitle("Log in with Facebook or Instagram", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.06433682889,
                                           green: 0.05462097377,
                                           blue: 0.609393239,
                                           alpha: 1), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        view.backgroundColor = .systemBackground
    }
    
    func initView(){
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.centerY).multipliedBy(0.4)
        }
        
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.delegate = self
        phoneNumberTextField.isUserInteractionEnabled = true
        phoneNumberTextField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.85)
            make.height.equalTo(view.snp.height).multipliedBy(0.07)
        }
        
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(phoneNumberTextField.snp.top).offset(-30)
        }
        
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextButttonTapped), for: .touchUpInside)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(30)
            make.width.equalTo(phoneNumberTextField.snp.width)
            make.height.equalTo(phoneNumberTextField.snp.height)
        }
        
        view.addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nextButton.snp.bottom).offset(20)
        }
        
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(orLabel.snp.bottom).offset(30)
            make.width.equalTo(phoneNumberTextField.snp.width)
            make.height.equalTo(phoneNumberTextField.snp.height)
        }
    }
    
    @objc func nextButttonTapped(){
        let vc = VerificationViewController()
        delegate?.getPhoneNumber(num: phoneNumberTextField.text ?? "")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Phone Number Formatter

extension SignInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formatter(mask: "+XXX (XX) XXX XX XX", phoneNumber: newString)
        delegate?.getPhoneNumber(num: textField.text ?? "no text")
        return false
    }
    
    func formatter(mask: String, phoneNumber: String) -> String {
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result: String = ""
        var index = number.startIndex
        
        for char in mask where index < number.endIndex {
            if char == "X" {
                result.append(number[index])
                index = number.index(after: index)
            }
            else {
                result.append(char)
            }
        }
        
        return result
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneNumberTextField.resignFirstResponder()
        return true
    }
}
