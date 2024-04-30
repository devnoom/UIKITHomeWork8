//
//  LoginPageViewController.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 29.04.24.
//

import UIKit
class LoginPageViewController: UIViewController {

    // MARK: - Variables
    let viewModel = LoginPageViewModel()
    
    // MARK: - UI Components
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Avatar")
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    let usernameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return userNameLabel
    }()
    let passwordLabel: UILabel = {
       let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    let repeatPasswordLabel: UILabel = {
        let repeatPasswordLabel = UILabel()
        repeatPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        return repeatPasswordLabel
    }()
    let usernameTextField: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        return usernameTextField
    }()
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    let repeatPasswordTextField: UITextField = {
        let repeatPasswordTextField = UITextField()
        repeatPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        return repeatPasswordTextField
    }()
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)

        return loginButton
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
           
            if viewModel.isNewUser() {
                // If it's a new user, show the login page
                // (No need to check for isFirstLogin)
            } else {
                // If it's not a new user, navigate to the next page directly
                let mainPageVC = CountryMainPageController()
                self.navigationController?.pushViewController(mainPageVC, animated: true)
            }
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
            imageView.addGestureRecognizer(tapGesture)
        }

    // MARK: - UI Setup
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordLabel)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(loginButton)
        
        usernameLabel.text = "მომხმარებლის სახელი"
        usernameTextField.placeholder = "შეიყვანეთ მომხმარებლის სახელი"
        passwordLabel.text = "პაროლი"
        passwordTextField.placeholder = "შეიყვანეთ პაროლი"
        repeatPasswordLabel.text = "გაიმეორეთ პაროლი"
        repeatPasswordTextField.placeholder = "განმეორებით შეიყვანეთ პაროლი"
        loginButton.setTitle("შესვლა", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 25
        
        imageView.backgroundColor = .black
        //selectImageButton.backgroundColor = .white
       
            usernameTextField.textColor = .darkGray
            passwordTextField.textColor = .darkGray
            repeatPasswordTextField.textColor = .darkGray
            
            usernameTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
            passwordTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
            repeatPasswordTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
    
        usernameTextField.layer.cornerRadius = 30
        passwordTextField.layer.cornerRadius = 30
        repeatPasswordTextField.layer.cornerRadius = 30

            
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            usernameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            repeatPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            repeatPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repeatPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            repeatPasswordTextField.topAnchor.constraint(equalTo: repeatPasswordLabel.bottomAnchor, constant: 5),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
// MARK: - Login Function
    @objc func loginButtonTapped(_ sender: UIButton) {
            guard let username = usernameTextField.text, !username.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty,
                  let repeatPassword = repeatPasswordTextField.text, !repeatPassword.isEmpty else {
                showAlert(message: "Please fill in all fields.")
                return
            }
            
            if password == repeatPassword {
                if viewModel.isNewUser() {
                    // If it's a new user, save credentials and show welcome alert
                    viewModel.saveCredentials(username: username, password: password)
                    viewModel.saveImageInfo("Information about chosen image")
                    showWelcomeAlert()
                } else {
                    // If it's an existing user, validate credentials
                    if viewModel.validateLogin(username: username, password: password) {
                        // If credentials are correct, navigate to next page
                        let mainPageVC = CountryMainPageController()
                        self.navigationController?.pushViewController(mainPageVC, animated: true)
                    } else {
                        // If credentials are incorrect, show alert
                        showWrongPasswordAlert()
                    }
                }
            } else {
                // If passwords don't match, show alert
                showAlert(message: "Passwords do not match.")
            }
        }
    
    func showWrongPasswordAlert() {
            let alert = UIAlertController(title: "Error", message: "Incorrect username or password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }


    func isNewUser(username: String) -> Bool {
        // Check if the user is new based on UserDefaults
        if UserDefaults.standard.string(forKey: "username") == nil {
            // If the username doesn't exist in UserDefaults, it's a new user
            // Save the username to UserDefaults for future reference
            UserDefaults.standard.set(username, forKey: "username")
            return true
        } else {
            // If the username exists in UserDefaults, it's an existing user
            return false
        }
    }

    // MARK: - Allerts
    func showWelcomeAlert() {
        let alert = UIAlertController(title: "სალამი 🙋🏻‍♂️", message: "წარმატებით დარეგისტრირდი", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "გასაგებლარია", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func showWrongAccount() {
        let alert = UIAlertController(title: "სალამი 🙋🏻‍♂️", message: "რაცხა შეგყავს არასწორად", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "გასაგებლარია", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Image View Tapped
    @objc func imageViewTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    // MARK: - Image Selection
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

#Preview {
    LoginPageViewController()
}
