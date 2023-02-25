//
//  PracticeViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit
import SnapKit

class PracticeViewController:UIViewController {
    
    static var countPage = 0
    private var isButtonTap = false
    lazy var labelArr: [UILabel] = [
        topNumberView.one,
        topNumberView.two,
        topNumberView.three,
        topNumberView.four,
        topNumberView.five,
        topNumberView.six,
        topNumberView.seven,
        topNumberView.eight,
        topNumberView.nine,
        topNumberView.ten,
    ]
    
    private let photoView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smilePicture.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let takePhotoButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("촬영하러 가기", for: .normal)
        btn.setTitleColor(.text1, for: .normal)
        btn.backgroundColor = .primary1
        btn.layer.cornerRadius = 20
        btn.titleLabel?.font = .bodyLarge
        return btn
    }()
    
    private let topNumberView = TopNumberView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setNavigationController()
        setViewHierarchy()
        setLayout()
    }
    
    //MARK: - Function
    
    func setViewHierarchy(){
        view.addSubview(topNumberView)
        view.addSubview(photoView)
        view.addSubview(takePhotoButton)
    }
    
    func setLayout(){
        topNumberView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(106)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(110)
        }
        
        photoView.snp.makeConstraints { make in
            make.top.equalTo(topNumberView.emotionLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(326)
            make.width.equalTo(343)
        }
        
        takePhotoButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-143)
            make.height.equalTo(55)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setButtonEvent(){

    }
    
    func setNavigationController(){
        let backButton = UIBarButtonItem()
        backButton.title = "감정학습 퀴즈"
        self.navigationController?.navigationBar.tintColor = UIColor.text1
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func buttonOn(button: UIButton){
        button.backgroundColor = .primary4
        button.layer.borderColor = UIColor.primary2.cgColor
        button.layer.borderWidth = 2
    }
    
    func buttonOff(button: UIButton){
        button.backgroundColor = .primary2
        button.layer.borderColor = UIColor.primary2.cgColor
    }
    
    func submitQuiz(){
        let alert = UIAlertController(title: "퀴즈를 제출할까요?", message: "퀴즈를 제출하면 답안을 수정할 수 없어요. 제출하시겠습니까?", preferredStyle: UIAlertController.Style.alert)

        let accecptAction = UIAlertAction(title: "네", style: .default, handler: { okAction in
            let nextVC = ScoreViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        })
        
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: { okAction in
            self.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(noAction)
        alert.addAction(accecptAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showToast(message : String, font: UIFont) {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    
    //MARK: - @objc
    
    @objc func nextButtonTapEvent(){
        if(isButtonTap){
            StudyViewController.countPage+=1
            
            if(StudyViewController.countPage == 10){
                StudyViewController.countPage = 0
                submitQuiz()
            } else{
                labelArr[StudyViewController.countPage].textColor = .primary1
                labelArr[StudyViewController.countPage-1].textColor = .text1
                isButtonTap = false
            }
        } else{
            showToast(message: "사진을 찍어주세요!", font: .bodyLarge)
        }
    }
}
