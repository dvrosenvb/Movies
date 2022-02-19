//
//  LoginViewController.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolLogin?
    
    //MARK: UIElements
    lazy var ivHead: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: UIManager.nameImageHeadLogin)
        iv.contentMode = .scaleAspectFill
        iv.alpha = UIManager.alphaStandard
        return iv
    }()
    
    lazy var ivLogo: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: UIManager.nameImageLogo)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var tfUserName: UITextField = {
        let tf = UITextField()
        let lfView = UIView()
        let rgView = UIView()
        lfView.frame.size.width = 10
        lfView.frame.size.height = 10
        rgView.frame.size.width = 10
        rgView.frame.size.height = 10
        
        tf.rightViewMode = .always
        tf.leftViewMode = .always
        tf.leftView = lfView
        tf.rightView = rgView
        
        tf.backgroundColor = UIColor.clear
        tf.layer.backgroundColor = UIManager.BASIC_WHITE.cgColor
        tf.layer.cornerRadius = UIManager.cornerRadiusBtn
        
        tf.font = UIManager.RegularFont(20)
        tf.returnKeyType = .next
        tf.placeholder = UIManager.txtPlaceholderUserName
        
        return tf
    }()
    
    lazy var tfPassword: UITextField = {
        let tf = UITextField()
        let lfView = UIView()
        let rgView = UIView()
        lfView.frame.size.width = 10
        lfView.frame.size.height = 10
        rgView.frame.size.width = 10
        rgView.frame.size.height = 10
        
        tf.rightViewMode = .always
        tf.leftViewMode = .always
        tf.leftView = lfView
        tf.rightView = rgView
        
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor.clear
        tf.layer.backgroundColor = UIManager.BASIC_WHITE.cgColor
        tf.layer.cornerRadius = UIManager.cornerRadiusBtn
        
        tf.font = UIManager.RegularFont(20)
        tf.returnKeyType = .next
        tf.placeholder = UIManager.txtPlaceholderPassword
        
        return tf
    }()
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = UIManager.cornerRadiusBtn
        btn.layer.backgroundColor = UIManager.GREEN.cgColor
        btn.setTitle(UIManager.txtButtonLogin, for: .normal)
        btn.tintColor = UIManager.BASIC_WHITE
        return btn
    }()
    
    lazy var lblStatus: UILabel = {
        let label = UILabel()
        label.font = UIManager.RegularFont(13)
        label.numberOfLines = 0
        label.textColor = UIManager.BLUE_SECONDARY
        label.text = UIManager.sampleText
        label.textAlignment = .center
        return label
    }()
    
    
    
    //MARK: Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installView()
    }
    
    public static func initWithNibName() -> LoginViewController {
        let bundle = Bundle(for: LoginViewController.self)
        let newView = LoginViewController(nibName: nil, bundle: bundle)
        return newView
    }
    
    //MARK: Functions
    func installView()  {
        view.backgroundColor = UIManager.BLUE_MAIN
            
        view.addSubview(ivHead)
        ivHead.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
        
        view.addSubview(ivLogo)
        ivLogo.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }
        
        view.addSubview(tfUserName)
        tfUserName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ivLogo.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(48)
        }
        
        view.addSubview(tfPassword)
        tfPassword.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tfUserName.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(48)
        }
        
        view.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tfPassword.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(48)
        }
        
        view.addSubview(lblStatus)
        lblStatus.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(btnLogin.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            
        }
        
        
        tfUserName.addTarget(self, action: #selector(primaryActionTrigeredTfUserName), for: .primaryActionTriggered)
        tfPassword.addTarget(self, action: #selector(primaryActionTrigeredTfPassword), for: .primaryActionTriggered)
        
        btnLogin.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        
        
        let tapOutside = UITapGestureRecognizer(target: self, action: #selector(primaryActionTrigeredTfPassword))
        
        view.addGestureRecognizer(tapOutside)
    }
    
    //MARK: Actions
    @objc func primaryActionTrigeredTfUserName(){
        tfPassword.becomeFirstResponder()
    }
    
    @objc func primaryActionTrigeredTfPassword(){
        view.endEditing(true)
    }
    
    @objc func actionLogin(){
        guard let nc = self.navigationController else { return }
        title = " "
        nc.navigationBar.isHidden = false
        presenter?.launchHome(navigationController: nc)
    }
    
    
    
}

