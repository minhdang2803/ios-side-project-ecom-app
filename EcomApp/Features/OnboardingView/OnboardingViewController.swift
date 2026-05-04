//
//  ViewController.swift
//  EcomApp
//
//  Created by Le Minh Dang on 6/4/26.
//

import UIKit
import SnapKit
class OnboardingViewController: UIViewController {
    
    var viewModel: OnboardingViewModel! = nil
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // Cho phép 1 trang chiếm hết toàn bộ màn hình
        layout.minimumLineSpacing = 0
        layout.minimumLineSpacing = 0

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        setUpPageView()
    }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func setUpPageView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            make in
            make.edges.equalToSuperview()
        }
        collectionView.register(OnboardingUIViewCell.self, forCellWithReuseIdentifier: OnboardingUIViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingUIViewCell.identifier, for: indexPath) as? OnboardingUIViewCell else {
            return UICollectionViewCell()
        }
            
        cell.setup(imageUrl: "onboarding_\(indexPath.row + 1)", title: "Choose Product", subtitle: "A product is the item offered for sale. A product can be a service or an item. It can be physical or in virtual or cyber form", index: (indexPath.row + 1),
                   onTapNext: {self.scrollToNext()},
                   onTapSkip: {self.scrollToPrevious()}
        )
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    // Step 1: Lấy full width của CollectionView
    // Step 2: Lấy vị trí trang hiện tại bằng toạ độ x/fullWidth
    func scrollToNext(){
        let onboardingFullWidth = collectionView.bounds.width
        guard onboardingFullWidth > 0 else {return}
        
        let currentPageIndex = Int(round(collectionView.contentOffset.x/onboardingFullWidth))
        let nextIndex = currentPageIndex + 1
        guard nextIndex < collectionView.numberOfItems(inSection: 0) else {
            self.viewModel.goToLoginPage()
            return
        }
        let nextOffset = CGPoint(x:( CGFloat(nextIndex) * onboardingFullWidth), y:collectionView.contentOffset.y)
        collectionView.setContentOffset(nextOffset, animated: true)
    }
    
    func scrollToPrevious(){

    }
}


#Preview {
    let vc = OnboardingViewController() // Khởi tạo ViewController của bạn
    return vc
}
