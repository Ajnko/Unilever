//
//  VerificationViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 14/05/23.
//

import UIKit
import SnapKit

class VerificationViewController: UIViewController, PhoneNumberDelegate {
    
    var delegate: PhoneNumberDelegate?
    //MARK: - TitleLabel
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    let nextButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.shadowRadius = 2
        button.layer.cornerRadius = 30
        button.layer.shadowOpacity = 0.2
        button.setTitle("NEXT", for: .normal)
        button.layer.shadowColor = UIColor.blue.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 15)
        button.addTarget(self, action: #selector(nextButttonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getPhoneNumber(num: titleLabel.text ?? "No text")
        view.backgroundColor = .systemBackground
    }
    
    func initView(){
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.centerY).multipliedBy(0.3)
        }
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.height.equalTo(view.snp.height).multipliedBy(0.07)
        }
    }
    
    func getPhoneNumber(num: String) {
        titleLabel.text = num
    }
    
    @objc func nextButttonTapped(){
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    



}
