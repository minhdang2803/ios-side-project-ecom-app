//
//  BaseViewController.swift
//  EcomApp
//
//  Created by Le Minh Dang on 22/4/26.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController<VM>: UIViewController {
    
    // MARK: - Properties
    let viewModel: VM
    let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttributes()
        setupLayout()
        bindViewModel()
    }
    
    /// Setup background colors, navigation titles, etc.
    func setupAttributes() {
        view.backgroundColor = .systemBackground
    }
    
    /// Add subviews and setup AutoLayout constraints
    func setupLayout() {
        // Implementation in subclasses
    }
    
    /// Bind ViewModel inputs and outputs using RxSwift
    func bindViewModel() {
        // Implementation in subclasses
    }
}
