//
//  StudyViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit
import SnapKit

class StudyViewController:UIViewController {
    
    //MARK: - UI component
    private let quizLabel : UILabel = {
        let label = UILabel()
        label.text = "감정학습 퀴즈"
        label.font = .titleMedium
        label.textColor = .text1
        return label
    }()
    
    let numView = numberView()
    let emotionView = selectView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary2
        setViewHierarchy()
        setLayout()
    }
    
    func setViewHierarchy(){
        view.addSubview(quizLabel)
        view.addSubview(numView)
        view.addSubview(emotionView)
        numView.backgroundColor = .background1
        emotionView.backgroundColor = .background1
    }
    
    func setLayout(){
        quizLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(24)
        }
        numView.snp.makeConstraints { make in
            make.top.equalTo(quizLabel.snp.bottom).offset(27)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview()
        }
        emotionView.snp.makeConstraints { make in
            make.top.equalTo(numView.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

