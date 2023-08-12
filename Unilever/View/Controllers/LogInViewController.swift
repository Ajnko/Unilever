//
//  ViewController.swift
//  Unilever
//
//  Created by Abdulbosid Jalilov on 13/05/23.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {
    
    //MARK: - Logo Image
    
    let logoImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Unilever")
        return image
    }()
    
    //MARK: - Sign In Button
    
    let signInButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.06433682889, green: 0.05462097377, blue: 0.609393239, alpha: 1)
        button.layer.cornerRadius = 30
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.2
        button.layer.shadowColor = UIColor.blue.cgColor
        button.setTitle("SIGN IN", for: .normal)
        button.layer.shadowOffset = CGSize(width: 0, height: 15)
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
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
    
    //MARK: - Additional Label
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        label.text = "Sign in with Facebook or Instagram"
        return label
    }()
    
    //MARK: - Facebook Button
    
    let facebookButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2576254904, green: 0.4038530886, blue: 0.6994090676, alpha: 1)
        button.layer.cornerRadius = 30
        button.contentHorizontalAlignment = .center
        button.setTitle("Sign in with Facebook", for: .normal)
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
    
    //MARK: - Instagram Button
    
    let instagramButton: UIButton = {
       let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemBackground
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitle("Sign in with Instagram", for: .normal)
        button.setImage(UIImage(named: "instagram"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        view.backgroundColor = .systemBackground
    }
    
    func initView(){
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.centerY).multipliedBy(0.4)
            make.width.equalTo(view.snp.width).multipliedBy(0.6)
            make.height.equalTo(view.snp.height).multipliedBy(0.2)
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.85)
            make.height.equalTo(view.snp.height).multipliedBy(0.07)
        }
        
        view.addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(30)
        }
        
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(orLabel.snp.bottom).offset(30)
        }
        
        view.addSubview(facebookButton)
        facebookButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(25)
            make.width.equalTo(signInButton.snp.width)
            make.height.equalTo(signInButton.snp.height)
        }
        
        view.addSubview(instagramButton)
        instagramButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(facebookButton.snp.bottom).offset(20)
            make.width.equalTo(signInButton.snp.width)
            make.height.equalTo(signInButton.snp.height)
        }
    }
    
    @objc func signInButtonTapped(){
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

