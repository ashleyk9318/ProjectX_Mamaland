//
//  RegistrationViewController.swift
//  ParentingSNS
//
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    // MARK: Label
    
    private let createAccount: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.text = "Create Account"
        label.textColor = .greyishBrown()
        label.font = .circular(size: 24)
        
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.text = "Email"
        label.textColor = .warmGrey()
        label.font = .circularBold(size: 12)
                
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.text = "Full Name"
        label.textColor = .warmGrey()
        label.font = .circularBold(size: 12)
        
        return label
    }()
    
//    private let firstNameLabel: UILabel = {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        label.text = "First Name"
//        label.textColor = .systemGray
//        label.font = UIFont(name: "CircularStd-Black", size: 12)
//
//        return label
//    }()
//
//    private let lastNameLabel: UILabel = {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        label.text = "Last Name"
//        label.textColor = .systemGray
//        label.font = UIFont(name: "CircularStd-Black", size: 12)
//
//        return label
//    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.text = "Username"
        label.textColor = .warmGrey()
        label.font = .circularBold(size: 12)
        
        return label
    }()
    
    private let usernameInfoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 1, y: 0, width: 10, height: 0))
        label.text = "You can use letters, numbers, and underscores."
        label.textColor = .warmGrey()
        label.font = .circularBook(size: 12)

        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.text = "Password"
        label.textColor = .warmGrey()
        label.font = .circularBold(size: 12)
        
        return label
    }()
    
    private let confirmLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.text = "Confirm Password"
        label.textColor = .warmGrey()
        label.font = .circularBold(size: 12)
        
        return label
    }()
    
    let checkbox = Checkbox(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    
    private let agreeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        label.numberOfLines = 0
        label.text = "By signing up you accept the Terms of Services and \nPrivacy Policy"
        label.font = UIFont(name: "CircularStd-Black", size: 12)
        
        return label
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let labelText = NSMutableAttributedString(string: "Already have an account? Sign In",
                                                  attributes: [.font: UIFont(name: "CircularStd-Book", size: 12.0),
                                                               .foregroundColor: UIColor.greyishBrown()])
//        labelText.addAttribute(.font, value: UIFont(name: "CircularStd-Bold", size: 12.0),
//                               range: _NSRange(location: 25, length: 7))
        
        label.text = "Already have an account?"
        label.font = UIFont(name: "CircularStd-Black", size: 12)
        
        return label
    }()
    
    
    
    // MARK: Field
    
   private let emailField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Email"
//        field.layer.masksToBounds = true
        field.setPadding()
        field.returnKeyType = .next
        return field
    }()
    
    private let nameField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Full Name"
        field.setPadding()
        field.returnKeyType = .next
        field.layer.masksToBounds = true
        return field
    }()
    
//    private let firstNameField: UITextField = {
//        let field =  UITextField()
//        field.placeholder = "First Name"
//        field.returnKeyType = .next
//        field.leftViewMode = .always
//        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        field.autocapitalizationType = .none
//        field.autocorrectionType = .no
//        field.layer.masksToBounds = true
//        field.layer.cornerRadius = Constants.cornerRadius
////        field.backgroundColor = .secondarySystemBackground
////        field.layer.borderWidth = 1.0
////        field.layer.borderColor = UIColor.secondaryLabel.cgColor
//        return field
//    }()
//
//    private let lastNameField: UITextField = {
//        let field =  UITextField()
//        field.placeholder = "Last Name"
//        field.returnKeyType = .next
//        field.leftViewMode = .always
//        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        field.autocapitalizationType = .none
//        field.autocorrectionType = .no
//        field.layer.masksToBounds = true
////        field.layer.cornerRadius = Constants.cornerRadius
////        field.backgroundColor = .secondarySystemBackground
////        field.layer.borderWidth = 1.0
////        field.layer.borderColor = UIColor.secondaryLabel.cgColor
//        return field
//    }()
    
    private let usernameField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Username"
        field.setPadding()
        field.returnKeyType = .next
        field.layer.masksToBounds = true
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.setPadding()
        field.returnKeyType = .next
        field.layer.masksToBounds = true
        return field
    }()
    
    private let confirmField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Confirm Password"
        field.setPadding()
        field.returnKeyType = .continue
        field.layer.masksToBounds = true
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        let title = NSMutableAttributedString(string: "Sign Up",
                                              attributes: [.font: UIFont(name: "CircularStd-Bold", size: 16.0),
                                                           .foregroundColor: UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .warmGrey()
//        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
//        button.layer.masksToBounds = true
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self,
                                 action: #selector(didTapRegister),
                                 for: .touchUpInside)
        
        
        emailField.delegate = self
        emailField.setBottomBorder()
        usernameField.delegate = self
        nameField.delegate = self
//        firstNameField.delegate = self
//        lastNameField.delegate = self
        passwordField.delegate = self
        confirmField.delegate = self
        
        addSubviews()
        addButtonActions()
        
        view.backgroundColor = .systemBackground
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox))
        checkbox.addGestureRecognizer(gesture)
    }
    
    private func addSubviews() {
        view.addSubview(createAccount)
        view.addSubview(emailLabel)
        view.addSubview(emailField)
        view.addSubview(nameLabel)
        view.addSubview(nameField)
//        view.addSubview(firstNameLabel)
//        view.addSubview(firstNameField)
//        view.addSubview(lastNameLabel)
//        view.addSubview(lastNameField)
        view.addSubview(usernameLabel)
        view.addSubview(usernameField)
        view.addSubview(usernameInfoLabel)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(confirmLabel)
        view.addSubview(confirmField)
        view.addSubview(checkbox)
        view.addSubview(agreeLabel)
        view.addSubview(registerButton)
        view.addSubview(signInLabel)
        view.addSubview(signInButton)
    }
    
    private func addButtonActions() {
        signInButton.addTarget(self,
                               action: #selector(didTapSignInButton),
                               for: .touchUpInside)

    }
    
    @objc private func didTapSignInButton() {
        self.dismiss(animated: true, completion: nil)
//        let vc = RegistrationViewController()
//        vc.dismiss(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        createAccount.frame = CGRect(x: 24, y: view.safeAreaInsets.top + 76, width: view.width - 40, height: 31)
        emailLabel.frame = CGRect(x: 24, y: createAccount.bottom + 36, width: view.width - 40, height: 15)
        emailField.frame = CGRect(x: 24, y: emailLabel.bottom + 8, width: view.width - 40, height: 21)
        nameLabel.frame = CGRect(x: 24, y: emailField.bottom + 29, width: view.width - 40, height: 15)
        nameField.frame = CGRect(x: 24, y: nameLabel.bottom + 8, width: view.width - 40, height: 21)
//        firstNameLabel.frame = CGRect(x: 24, y: emailField.bottom + 24, width: view.width - 40, height: 15)
//        firstNameField.frame = CGRect(x: 24, y: firstNameLabel.bottom + 8, width: view.width - 40, height: 25)
//        lastNameLabel.frame = CGRect(x: 24, y: firstNameField.bottom + 24, width: view.width - 40, height: 15)
//        lastNameField.frame = CGRect(x: 24, y: lastNameLabel.bottom + 8, width: view.width - 40, height: 25)
        usernameLabel.frame = CGRect(x: 24, y: nameField.bottom + 29, width: view.width - 40, height: 15)
        usernameField.frame = CGRect(x: 24, y: usernameLabel.bottom + 8, width: view.width - 40, height: 21)
        usernameInfoLabel.frame = CGRect(x: 24, y: usernameField.bottom + 9, width: view.width - 40, height: 15)
        passwordLabel.frame = CGRect(x: 24, y: usernameInfoLabel.bottom + 29, width: view.width - 40, height: 15)
        passwordField.frame = CGRect(x: 24, y: passwordLabel.bottom + 8, width: view.width - 40, height: 21)
        confirmLabel.frame = CGRect(x: 24, y: passwordField.bottom + 29, width: view.width - 40, height: 15)
        confirmField.frame = CGRect(x: 24, y: confirmLabel.bottom + 8, width: view.width - 40, height: 21)
        checkbox.frame = CGRect(x: 24, y: confirmField.bottom + 29, width: 16, height: 16)
        agreeLabel.frame = CGRect(x: 48, y: confirmField.bottom + 29, width: view.width - 40, height: 30)
        registerButton.frame = CGRect(x: 24, y: confirmField.bottom  + 95, width: view.width - 40, height: 40)
        signInLabel.frame = CGRect(x: 97, y: registerButton.bottom + 36, width: 150, height: 15)
        signInButton.frame = CGRect(x: signInLabel.right + 5, y: registerButton.bottom + 36, width: 80, height: 12)
    }
    
    @objc private func didTapRegister() {
        emailField.resignFirstResponder()
        nameField.resignFirstResponder()
//        firstNameField.resignFirstResponder()
//        lastNameField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let name = nameField.text, !name.isEmpty,
//              let firstName = firstNameField.text, !firstNameField.isEmpty,
//              let lastName = lastNameField.text, !lastNameField.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8,
              let confirm = confirmField.text, !confirm.isEmpty, confirm == password,
              let username = usernameField.text, !username.isEmpty else {
                return
        }
        
        AuthManager.shared.registerNewUser(name: name, username: username, email: email, password: password) { registered in
            DispatchQueue.main.async {
                if registered {
                    //succeeded
                }
                else {
                    //failed
                }
            }

        }
    }
    
    @objc private func didTapCheckbox() {
        checkbox.toggle()
    }
}

extension RegistrationViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            nameField.becomeFirstResponder()
        } else if textField == nameField{
            usernameField.becomeFirstResponder()
        } else if textField == usernameField{
            passwordField.becomeFirstResponder()
        } else if textField == passwordField{
            confirmField.becomeFirstResponder()
        } else {
            didTapRegister()
        }
        return true
    }
}

extension UITextField {
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    func setPadding() {
        self.textColor = .pinkishGrey()
        self.font = .circularBook(size: 14)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.leftViewMode = .always
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = Constants.cornerRadius
//        self.backgroundColor = .secondarySystemBackground
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    func setBottomBorder() {
//        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        
    }
}

