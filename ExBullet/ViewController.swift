//
//  ViewController.swift
//  ExBullet
//
//  Created by 김종권 on 2024/07/28.
//

import UIKit

class ViewController: UIViewController {
    private let label = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 30)
        l.numberOfLines = 0
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        addText()
    }
    
    private func addText() {
        let text = """
        • 첫 번째 텍스트 입니다. 이것은 bullet 테스트, 과연 긴 텍스트가 있을 때 indent가 어떻게 적용될 것인가 테스트 해봅니다. iOS 앱 블로그 알아가기 jake에서 살펴봅니다.
        • 두 번째 텍스트 입니다.
        """
        
        let bulletTextIndent = {
            let l = UILabel()
            l.text = "•"
            l.font = self.label.font
            return l.sizeThatFits(.zero).width * 5/3 // 5/3은 "•" 인덴트 길이를 보며 임의로 맞춘 값
        }()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = bulletTextIndent

        // NSAttributedString을 사용하여 스타일 적용
        let attributedText = NSAttributedString(string: text, attributes: [
            .paragraphStyle: paragraphStyle
        ])

        // UILabel에 설정된 NSAttributedString 적용
        label.attributedText = attributedText
        label.text = text
    }
}
