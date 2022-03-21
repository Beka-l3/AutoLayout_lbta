//
//  PageCell.swift
//  Auto Layout (LBTA)
//
//  Created by Bekzhan Talgat on 05.03.2022.
//

import UIKit


class PageCell : UICollectionViewCell {
    
    var page : Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            ImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attString = NSMutableAttributedString(
                string: unwrappedPage.headerString,
                attributes: [
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
                    NSAttributedString.Key.foregroundColor : UIColor.white
                ]
            )
            attString.append(
                NSAttributedString(
                    string: "\n\n\n\(unwrappedPage.bodyString)",
                    attributes: [
                        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                        NSAttributedString.Key.foregroundColor : UIColor.gray
                    ]
                )
            )
            descriptionTextView.attributedText = attString
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let imageViewContainer : UIView = {
        let imgCnt = UIView()
        imgCnt.translatesAutoresizingMaskIntoConstraints = false
        
        return imgCnt
    }()
    
    private let ImageView : UIImageView = {
        let img = UIImageView(image: UIImage(named: "Obito"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    private let descriptionTextView : UITextView = {
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
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupLayout() {
        addSubview(imageViewContainer)
        NSLayoutConstraint.activate([
            imageViewContainer.topAnchor.constraint(equalTo: topAnchor),
            imageViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            imageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        imageViewContainer.addSubview(ImageView)
        NSLayoutConstraint.activate([
            ImageView.centerXAnchor.constraint(equalTo: imageViewContainer.centerXAnchor),
            ImageView.centerYAnchor.constraint(equalTo: imageViewContainer.centerYAnchor),
            ImageView.heightAnchor.constraint(equalTo: imageViewContainer.heightAnchor, multiplier: 0.5)
        ])
    
        addSubview(descriptionTextView)
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor, constant: 0),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
}
