//
//  OnboardingUIViewCell.swift
//  EcomApp
//
//  Created by Le Minh Dang on 6/4/26.
//

import UIKit
import SnapKit

class OnboardingUIViewCell : UICollectionViewCell{
    static let identifier = "OnboardingUIViewCell"
    
    func setup(imageUrl: String, title: String, subtitle: String, index: Int, onTapNext : @escaping ()->Void, onTapSkip: @escaping ()->Void){
        contentView.subviews.forEach { $0.removeFromSuperview() }
        let view = OnboardingUIView(imageUrl: imageUrl, title: title, subtitle: subtitle, index: index, onTapNext: onTapNext, onTapSkip: onTapSkip)
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        view.snp.makeConstraints{
            make in
            make.edges.equalTo(contentView)
        }
    }
}
