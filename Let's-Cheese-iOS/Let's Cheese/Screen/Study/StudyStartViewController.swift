//
//  StudyStartViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/22.
//

import Foundation
import UIKit
import SnapKit

class StudyStartViewController:UIViewController {
    
    //MARK: - UI component
    private let startLabel : UILabel = {
        let label = UILabel()
        label.text = "감정학습 퀴즈를 시작하시겠습니까?"
        label.font = .titleLarge
        label.textColor = .text1
        return label
    }()
    
    private let startButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("시작하기", for: .normal)
        btn.backgroundColor = .primary1
        btn.setTitleColor(.text1, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private let backButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("돌아가기", for: .normal)
        btn.backgroundColor = .background3
        btn.setTitleColor(.text1, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setNavigationController()
        setViewHierarchy()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Function
    func setViewHierarchy(){
        view.addSubview(startLabel)
        view.addSubview(startButton)
        view.addSubview(backButton)
    }
    
    func setLayout(){
        startLabel.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(-165)
            make.centerX.equalToSuperview()

        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(backButton.snp.top).offset(-20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(75)

        }
        
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-126)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(75)
        }
    }
    
    func setButtonEvent(){
        startButton.addTarget(self, action: #selector(startQuizEvent), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(touchBackButtonEvent), for: .touchUpInside)
    }
    
    func setNavigationController(){
        let backButton = UIBarButtonItem()
        backButton.title = "감정학습 퀴즈"
        self.navigationController?.navigationBar.tintColor = UIColor.text1
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - @objc
    @objc func startQuizEvent(){
        StudyViewController.countPage = 0
        let nextVC = StudyViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func touchBackButtonEvent(){
        let nextVC = TabBarController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


