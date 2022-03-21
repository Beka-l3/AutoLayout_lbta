//
//  ViewController.swift
//  Auto Layout (LBTA)
//
//  Created by Bekzhan Talgat on 04.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let imageViewContainer : UIView = {
        let imgCnt = UIView()
        imgCnt.translatesAutoresizingMaskIntoConstraints = false
        
        return imgCnt
    }()
    
    let ImageView : UIImageView = {
        let img = UIImageView(image: UIImage(named: "Obito"))
//        img.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let descriptionTextView : UITextView = {
        let txt = UITextView()
        txt.backgroundColor = .black
    
        let attString = NSMutableAttributedString(
            string: "No one cared who I was until I put on a mask",
            attributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
        )
        attString.append(
            NSAttributedString(
                string: "\n\nThose who abandon their friends are even worse than scum. If I’m going to be called scum either way, I’d rather break the rules! And if that’s not being a proper shinobi, then I’ll destroy that idea!",
                attributes: [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                    NSAttributedString.Key.foregroundColor : UIColor.gray
                ]
            )
        )
        txt.attributedText = attString
        
        txt.textAlignment = .center
        txt.isEditable = false
        txt.isScrollEnabled = false
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    private let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .yellow
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()
    
    private let previousButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("PREV", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.yellow, for: .normal)
        
        return btn
    }()
    
    private let nextButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("NEXT", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitleColor(.yellow, for: .normal)
        
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupLayout()
        setupBottomControllers()
    }
    
    
    private func setupLayout() {
        view.addSubview(imageViewContainer)
        NSLayoutConstraint.activate([
            imageViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            imageViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            imageViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        imageViewContainer.addSubview(ImageView)
        NSLayoutConstraint.activate([
            ImageView.centerXAnchor.constraint(equalTo: imageViewContainer.centerXAnchor),
            ImageView.centerYAnchor.constraint(equalTo: imageViewContainer.centerYAnchor),
            ImageView.heightAnchor.constraint(equalTo: imageViewContainer.heightAnchor, multiplier: 0.5)
        ])
    
        view.addSubview(descriptionTextView)
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor, constant: 0),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
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

}

