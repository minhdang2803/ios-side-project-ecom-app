//
//  CustomButton.swift
//  EcomApp
//
//  Created by Le Minh Dang on 6/4/26.
//


import Foundation
import UIKit

class CustomButtonUIView: UIButton {

    var layoutTextColor: UIColor?
    var layoutBgColor: UIColor?
    var layoutText: String
    var trailingIcon: String?
    var onTapped: (() -> Void)?

    lazy var button: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        // Set background color cho button
        buttonConfig.baseBackgroundColor = self.layoutBgColor ?? .systemOrange
        // Set icon cho button
        if let tralingImage = self.trailingIcon {
            buttonConfig.image = UIImage(systemName: tralingImage)
        }

        // Vị trí của icon trong button leading/trailing
        buttonConfig.imagePlacement = .trailing
        // thêm padding cho text của button
        buttonConfig.imagePadding = 8
        // Set borderRadius cho button
        buttonConfig.cornerStyle = .capsule

        // Styling cho text
        // Set màu cho text
        var stylingContainer = AttributeContainer()
        stylingContainer.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        stylingContainer.foregroundColor = self.layoutTextColor ?? .white
        // Set text
        buttonConfig.attributedTitle = AttributedString(self.layoutText, attributes: stylingContainer)
        // Styling cho
        // buttonConfig.attributedSubtitle = AttributedString(self.layoutText, attributes: stylingContainer)

        let button = UIButton(configuration: buttonConfig)
        button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()

    @objc func onButtonTapped() {
        onTapped?()
    }

    init(text: String, trailingIcon: String?, backgroundColor: UIColor?, textColor: UIColor?) {
        self.layoutTextColor = textColor
        self.layoutBgColor = backgroundColor
        self.layoutText = text
        self.trailingIcon = trailingIcon
        super.init(frame: .zero)
        style()
        layout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomButtonUIView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func layout() {
        addSubview(button)
        button.snp.makeConstraints {
            make in
            make.edges.equalToSuperview()
        }
    }
}


#Preview {
    let view = CustomButtonUIView(text: "Tại sao con lại khóc?", trailingIcon: "chevron.right", backgroundColor: .systemOrange, textColor: .white)
    view
}
