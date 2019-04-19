//
//  Presenter.swift
//  UIPageViewWithAnimationAndConstrains
//
//  Created by Artem Karmaz on 4/18/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class CarPresenter: UIViewController {
    
    private let carImage: UIImageView = {
        var myImageView = UIImageView()
        myImageView.layer.cornerRadius = 20
        myImageView.layer.masksToBounds = true
        myImageView.contentMode = .scaleAspectFit
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }()
    
    private let carName: UILabel = {
        let myLabel = UILabel()
        myLabel.textColor = .white
        myLabel.font = UIFont.systemFont(ofSize: 30)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    lazy var mySubView: [UIView] = [carImage, carName]
    
    init(carWith: CarWorker) {
        super.init(nibName: nil, bundle: nil)
        self.carImage.image = carWith.image
        self.carName.text = carWith.name
        
        view.backgroundColor = .purple
        
        mySubView.forEach {
            view.addSubview($0)
        }
        
        // CarImage Constraints
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250), // высота херни будет 250
            NSLayoutConstraint(item: carImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0) // по нулю
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carName, attribute: .top, relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50), // высота херни будет 250
            NSLayoutConstraint(item: carName, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
