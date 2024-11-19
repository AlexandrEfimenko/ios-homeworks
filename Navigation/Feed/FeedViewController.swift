//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Ефименко on 24.07.2023.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {

    let viewModel: FeedViewModel
    private let posts: [Post]
    var timer: Timer?
    var timeLeft = 60


    private lazy var postButton = CustomButton(title: "Пост 1", backgroundColor: nil, titleColor: .systemBlue, action: try? getActionButton(indexPost: 0))


    private lazy var postButton2 = CustomButton(title: "Пост 2", backgroundColor: nil, titleColor: .systemBlue,
                                            action: try? getActionButton(indexPost: 1))


    private lazy var infoButton: UIButton = {
        let view = UIButton()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.setTitle("info view open", for: .normal)
          view.setTitleColor(.blue, for: .normal)
          view.addTarget(self, action: #selector(infoViewButtonTapped), for: .touchUpInside)
          return view
      }()


    func getActionButton(indexPost: Int) throws -> () -> Void  {

        guard indexPost > posts.count  else  { throw  MyError.invalidArray}

        let post: Post = posts[indexPost]

        let action = {
            self.viewModel.onShowPost!(post)
        }

        return action
    }


    private lazy var stackView: UIStackView = {
           let stack = UIStackView()
           stack.translatesAutoresizingMaskIntoConstraints = false
           stack.axis = .vertical

           stack.addArrangedSubview(postButton)
           stack.addArrangedSubview(postButton2)

           stack.spacing = 10
           stack.isUserInteractionEnabled = true

           return stack
       }()


     private lazy var passwordTitle: UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Пароль:"
           return view
       }()

    private lazy var passwordView: UITextField = {
           let view = UITextField()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.placeholder = "Введите пароль..."
           view.layer.borderWidth = 2.0
           return view
       }()

    private lazy var passwordCheckLabel: UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.textColor = .red
           return view
       }()


    private lazy var checkGuessButton = CustomButton(title: "check Guess", backgroundColor: .systemBlue, titleColor: .white,
            action:  {

            if let textPassword = self.passwordView.text {
                let isValid = self.viewModel.check(word: textPassword)

                if isValid {
                    self.passwordCheckLabel.text = "пароль верный"
                    self.passwordCheckLabel.textColor = .green
                } else {
                    self.passwordCheckLabel.text = "пароль не верный"
                    self.passwordCheckLabel.textColor = .red
                }

            } else {
                self.passwordCheckLabel.text = "пароль пустой"
                self.passwordCheckLabel.textColor = .red
            }


            if self.timer == nil {
                self.timer = Timer(timeInterval: 1.0, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)

                RunLoop.current.add(self.timer!, forMode: .common)
            }

        }
        )


    private lazy var timeLabel: UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.textColor = .black
           view.font = .systemFont(ofSize: 14)
           return view
       }()


    private lazy var buttonMap: UIButton = {
        let view = UIButton()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.setTitle("Открыть карту", for: .normal)
           view.setTitleColor(.magenta, for: .normal)
           view.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
           return view
       }()



    init(viewModel: FeedViewModel, posts: [Post]) {
        self.viewModel = viewModel
        self.posts = posts
        super.init(nibName: nil, bundle: nil)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Лента"
        view.backgroundColor = .white

        view.addSubview(passwordTitle)
        view.addSubview(passwordView)
        view.addSubview(passwordCheckLabel)
        view.addSubview(checkGuessButton)
        view.addSubview(timeLabel)

        view.addSubview(infoButton)
        view.addSubview(buttonMap)

        setupConstraints()

        timeLabel.text = ""
    }
    


    fileprivate func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide


        NSLayoutConstraint.activate([
            passwordTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5.0),
            passwordTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10.0),
            passwordTitle.heightAnchor.constraint(equalToConstant: 30),


            passwordView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10.0),
            passwordView.leadingAnchor.constraint(equalTo: passwordTitle.trailingAnchor, constant: 5.0),
            passwordView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10.0),
            passwordView.widthAnchor.constraint(equalToConstant: 250),
            passwordView.heightAnchor.constraint(equalToConstant: 30),

            checkGuessButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 10.0),
            checkGuessButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 30),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 200),


            passwordCheckLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 10.0),
            passwordCheckLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            passwordCheckLabel.heightAnchor.constraint(equalToConstant: 30),
            passwordCheckLabel.widthAnchor.constraint(equalToConstant: 100),


            timeLabel.topAnchor.constraint(equalTo: passwordCheckLabel.bottomAnchor, constant: 10.0),
            timeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5.0),
            timeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5.0),
            timeLabel.heightAnchor.constraint(equalToConstant: 30.0),
            //timeLabel.widthAnchor.constraint(equalToConstant: 100)


            infoButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10.0),
            infoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10.0
            ),

            infoButton.heightAnchor.constraint(equalToConstant: 50),
            infoButton.widthAnchor.constraint(equalToConstant: self.view.frame.width),

            buttonMap.topAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: 10.0),
            buttonMap.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10.0
            ),

            buttonMap.heightAnchor.constraint(equalToConstant: 50),
            buttonMap.widthAnchor.constraint(equalToConstant: self.view.frame.width)

        ])
    }

    @objc func onTimer() {

        if timeLeft == 60 {
            checkGuessButton.isEnabled = false
            checkGuessButton.alpha = 0.5
        }


        timeLeft -= 1
        timeLabel.text = "Через \(timeLeft) сек. вы можете повторно проверить пароль"

        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
            timeLeft = 60
            timeLabel.text = ""
            checkGuessButton.isEnabled = true
            checkGuessButton.alpha = 1.0
        }
    }


    @objc func infoViewButtonTapped() {
        let vc = NewInfoViewController()
        present(vc, animated: true)
    }

    @objc func mapButtonTapped() {
        let vc = MapLocationViewController()
        present(vc, animated: true)
    }


}

