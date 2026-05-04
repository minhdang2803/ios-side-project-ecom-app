//
//  OnboardingUIView.swift
//  EcomApp
//
//  Created by Le Minh Dang on 6/4/26.
//

import Foundation
import UIKit

class OnboardingUIView: UIView {

    private var imageUrl: String
    private var currentPageIndex: Int
    private var title: String
    private var subtitle: String
    private var onTapSkip: (() -> Void)?
    private var onTapNext: (() -> Void)?

    init(imageUrl: String,
        title: String,
        subtitle: String,
        index: Int,
        onTapNext: (() -> Void)?,
        onTapSkip: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.title = title
        self.subtitle = subtitle
        self.currentPageIndex = index
        self.onTapNext = onTapNext
        self.onTapSkip = onTapSkip
        super.init(frame: .zero) // Hoặc frame cụ thể nếu cần
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var skipButton: UIButton = {
        var config = UIButton.Configuration.plain()
        var attribute = AttributeContainer()
        attribute.foregroundColor = .black
        attribute.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        config.attributedTitle = AttributedString("Skip", attributes: attribute)
        var button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onSkip), for: .touchUpInside)
        return button
    }()

    lazy var rowView: UIStackView = {
        var uistackView = UIStackView(arrangedSubviews: [processedPageLabel, skipButton])
        uistackView.axis = .horizontal
        uistackView.alignment = .center
        uistackView.distribution = .equalSpacing
        uistackView.translatesAutoresizingMaskIntoConstraints = false
        return uistackView
    } ()

    lazy var processedPageLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.currentPageIndex) + "/3"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: self.imageUrl)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    lazy var titleText: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var subtitleText: UILabel = {
        let label = UILabel()
        label.text = self.subtitle
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var buttonView: CustomButtonUIView = {
        let systemIcon: String = self.currentPageIndex == 1 ? "chevron.right" : "chevron.right.2"
        let buttonLabel: String = self.currentPageIndex == 3 ? "Get Started" : "Next"
        let button = CustomButtonUIView(text: buttonLabel, trailingIcon: systemIcon, backgroundColor: .orange, textColor: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.onTapped = { [weak self] in self?.onNext() }
        return button
    }()

}

extension OnboardingUIView {

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func layout() {
        addSubview(rowView)
        addSubview(imageView)
        addSubview(titleText)
        addSubview(subtitleText)
        addSubview(buttonView)


        rowView.snp.makeConstraints {
            make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        imageView.snp.makeConstraints { make in
            make.top.equalTo(rowView.snp.bottom).offset(56)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(25) // Dùng inset cho sạch code
        }

        titleText.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(38)
            make.leading.trailing.equalToSuperview().inset(16)
            // Không cần set height vì Label tự co giãn theo chữ (Intrinsic Content Size)
        }

        subtitleText.snp.makeConstraints { make in
            make.top.equalTo(titleText.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            // BỎ DÒNG make.bottom.equalTo(...) nếu bạn muốn nó đi theo titleText
        }

        buttonView.snp.makeConstraints {
            make in
            make.top.equalTo(subtitleText.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(78)
        }
    }
}

extension OnboardingUIView {
    @objc private func onNext() {
        self.onTapNext?()
    }

    @objc private func onSkip() {
        self.onTapSkip?()
    }
}

#Preview {
    OnboardingUIView(imageUrl: "onboarding_1",
        title: "Choose Product",
        subtitle: "A product is the item offered for sale. A product can be a service or an item. It can physical or in virtual or cyber form",
        index: 1,
        onTapNext: { },
        onTapSkip: { })
}
