//
//  CustomTextField.swift
//  EcomApp
//
//  Created by Le Minh Dang on 22/4/26.
//

import UIKit

class CustomTextField : UITextField {
    
    private var leadingIcon : UIImage
    private var hintText : String
    let padding = UIEdgeInsets(top: 20, left: 9, bottom: 20, right: 9 )
    private lazy var textField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = CGFloat(16)
        tf.leftView = textFieldLeadingIcon
        tf.tintColor = .black
        tf.leftViewMode = .always
        tf.attributedPlaceholder = NSAttributedString(string: self.hintText, attributes: [
            .foregroundColor: UIColor(hex: "#230A06") ?? UIColor.gray,
            .font: UIFont.roboto(size: 16, weight: .regular)
        ])
        tf.backgroundColor = .white
        return tf
    }()
    
    private lazy var textFieldLeadingIcon : UIView = {
        let image = UIImageView()
        image.image = leadingIcon
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        image.translatesAutoresizingMaskIntoConstraints = false
        let imageContainer = UIView()
        imageContainer.addSubview(image)
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = UIColor(hex: "#F67952")?.withAlphaComponent(0.1)
        imageContainer.layer.cornerRadius = CGFloat(16)
        image.snp.makeConstraints{
            make in
            make.edges.equalToSuperview().inset(12)
        }
        let paddingContainer = UIView()
        paddingContainer.addSubview(imageContainer)
        imageContainer.snp.makeConstraints{
            make in
            make.top.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(9)
        }
        return paddingContainer
    }()
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    init (placeHolder: String, leadingIcon: UIImage){
        self.hintText = placeHolder
        self.leadingIcon = leadingIcon
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
       layout()
    }
}


extension CustomTextField{
    func layout(){
        addSubview(textField)
        textField.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
    }
}


#Preview {
    CustomTextField(placeHolder: "Email", leadingIcon: UIImage.icLock)
}
