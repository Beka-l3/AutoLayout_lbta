//
//  SwipingController.swift
//  Auto Layout (LBTA)
//
//  Created by Bekzhan Talgat on 04.03.2022.
//

import UIKit


class SwipingController : UICollectionViewController {
    
    let pages = [
        Page(imageName: "Obito", headerString: "No one cared who I was until I put on a mask", bodyString: "Those who abandon their friends are even worse than scum. If I’m going to be called scum either way, I’d rather break the rules! And if that’s not being a proper shinobi, then I’ll destroy that idea!"),
        Page(imageName: "alonePurple", headerString: "it's ok to bloom alone", bodyString: "I do know what else I can say about it =)"),
        Page(imageName: "Itachi", headerString: "Any technique is worthless in front of my eyes", bodyString: "The greates shinobi of Konoha(aka hidden leaf village)"),
        Page(imageName: "carGirl", headerString: "I like when I see you driving at sunset", bodyString: "I wish my girlfriend could drive, so I could let her drive my car")
    ]
    
    private lazy var pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .yellow
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()
    
    private let previousButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("PREV", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.yellow, for: .normal)
        btn.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        
        return btn
    }()
    
    @objc private func handlePrev() {
        let prevItemIndex = max(pageControl.currentPage - 1, 0)
        collectionView?.scrollToItem(at: IndexPath(item: prevItemIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = prevItemIndex
        checkForStyle()
    }
    
    private let nextButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("NEXT", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.yellow, for: .normal)
        btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return btn
    }()
    
    @objc private func handleNext() {
        let nextItemIndex = min(pageControl.currentPage + 1, pages.count - 1)
        collectionView?.scrollToItem(at: IndexPath(item: nextItemIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = nextItemIndex
        checkForStyle()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControllers()
        
        collectionView?.backgroundColor = .black
        collectionView.register(PageCell .self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.isPagingEnabled = true
        
        checkForStyle()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
        checkForStyle()
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate { _ in
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            
            self.collectionViewLayout.invalidateLayout()
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        } completion: { (_) in
            
        }
    }
    
    
    
    fileprivate func setupBottomControllers() {
         
        let bottomStackView = UIStackView(arrangedSubviews: [
                previousButton,
                pageControl,
                nextButton
        ])
        bottomStackView.distribution = .fillEqually
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func checkForStyle() {
        
        switch pageControl.currentPage{
            case 0:
                previousButton.setTitleColor(.gray, for: .normal)
            case pages.count-1:
                nextButton.setTitleColor(.gray, for: .normal)
            default:
                nextButton.setTitleColor(.yellow, for: .normal)
                previousButton.setTitleColor(.yellow, for: .normal)
        }
    }
}

extension SwipingController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
