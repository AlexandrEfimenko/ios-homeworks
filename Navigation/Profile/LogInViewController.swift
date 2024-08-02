//
//  LogInViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 17.02.2024.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var contentView: UIView  = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    } ()


    private lazy var logoVK: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "LogoVk")
        logo.translatesAutoresizingMaskIntoConstraints = false

        return logo
    } ()


    private lazy var loginTextField: UITextField = {
       let login = UITextField()
        login.placeholder = " Email or phone"
        login.textColor = .black
        login.font = .systemFont(ofSize: 16, weight: .medium)
        login.autocapitalizationType = .none
        login.translatesAutoresizingMaskIntoConstraints = false
        // login.addTarget(self, action: #selector(loginTextChanged), for: .editingChanged)
        login.keyboardType = .default

        return login
    } ()

    private lazy var passwordTextField: UITextField = {
       let pass = UITextField()
        pass.placeholder = " Password"
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.autocapitalizationType = .none
        pass.font = .systemFont(ofSize: 16, weight: .medium)
        pass.isSecureTextEntry = true

        return pass
    } ()

    private lazy var line: UIView = {
        let line =  UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightGray

        return line
    } ()

    private lazy var loginPasswordStackView: UIStackView = {
         let stack = UIStackView()
         stack.translatesAutoresizingMaskIntoConstraints = false
         stack.axis = .vertical
         stack.distribution =  .fillProportionally

         stack.addArrangedSubview(loginTextField)
         stack.addArrangedSubview(line)
         stack.addArrangedSubview(passwordTextField)

         stack.layer.cornerRadius = 10
         stack.layer.borderColor = UIColor.lightGray.cgColor
         stack.layer.borderWidth = 0.5
         stack.backgroundColor = .systemGray6
         stack.tintColor = UIColor(named: "AccentColor")

         return stack
    } ()


    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitle("Log In...", for: .selected)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "AccentColor")

        //button.titleLabel?.textColor = .white
        // button.titleLabel?.textAlignment = .center
        // button.backgroundImage(for: UIControl.State.disabled)
        button.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)

        button.isUserInteractionEnabled = true

        return button
    } ()

    
    private lazy var scrollView: UIScrollView  = {
        let scroll = UIScrollView()

        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false

        return scroll
    } ()


    var loginDelegate: LoginViewControllerDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(logoVK)
        contentView.addSubview(loginPasswordStackView)
        contentView.addSubview(loginButton)

        navigationController?.navigationBar.isHidden = true
        setupConstraints()

        loginTextField.text = "Alex" // для быстрого тестирования todo
        passwordTextField.text = "123"
    }


    override func viewWillAppear(_ animated: Bool) {
        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObservers()
    }

    override func viewWillLayoutSubviews() {
       // loginView.frame = view.frame
    }

    

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            loginPasswordStackView.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            loginPasswordStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginPasswordStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginPasswordStackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: loginPasswordStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            line.heightAnchor.constraint(equalToConstant: 1)
        ])

         contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        //contentView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
    }


    @objc func tapLoginButton(button: UIButton) {
        guard let loginDelegate = self.loginDelegate else { return }

        if  let login = loginTextField.text, let password = passwordTextField.text  {
            if loginDelegate.check(login: login, password: password) {

                let profileViewModel = ProfileViewModel()
                let currentUser: User? = profileViewModel.getCurrentUser(login: login)

                if currentUser != nil {
                    let profileViewController = ProfileViewController(profileModelView: profileViewModel)
                    navigationController?.pushViewController(profileViewController, animated: true)
                    return
                }

            }
        }

        button.alpha = 0.5
        let alertController = UIAlertController(title: "Ошибка авторизации", message: "проверьте правильность логина и пароля", preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .default){_ in button.alpha = 1.0}
        alertController.addAction(action)

        present(alertController, animated: true)
    }


    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self, selector: #selector(willShowKeyboard(_:) ),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)

        notificationCenter.addObserver(
            self, selector: #selector(willHideKeyboard(_:) ),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }


    @objc
    private func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height

        scrollView.contentInset.bottom = keyboardHeight ?? 0.0
    }

    @objc
    private func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }

    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
