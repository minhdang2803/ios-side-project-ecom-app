//
//  BaseView.swift
//  EcomApp
//
//  Created by Le Minh Dang on 11/4/26.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented - Use programmatic UI")
    }
    
    /// Thêm subviews vào view chính
    func setupHierarchy() {
        // Ghi đè ở subclass
    }
    
    /// Thiết lập Auto Layout
    func setupConstraints() {
        // Ghi đè ở subclass
    }
    
    /// Cấu hình màu sắc, font, logic ban đầu
    func setupConfigurations() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
