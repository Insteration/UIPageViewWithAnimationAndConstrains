//
//  Interactor.swift
//  UIPageViewWithAnimationAndConstrains
//
//  Created by Artem Karmaz on 4/18/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class CarInteractor: UIPageViewController {
    
    var cars = [CarWorker]()
    var vcArray = [UIViewController]()
    
    let bmw = UIImage(named: "bmw")
    let audi = UIImage(named: "audi")
    let porsche = UIImage(named: "porshe")
    
    override func viewDidLoad() {
        buildCars()
        vcArray = buildArraysOfPresenterViewControllers()
    }
    
    func buildCars() {
        let firstCar = CarWorker(name: "BMW", image: bmw!)
        let secondCar = CarWorker(name: "AUDI", image: audi!)
        let thirdCar = CarWorker(name: "PORSCHE", image: porsche!)
        cars.append(firstCar)
        cars.append(secondCar)
        cars.append(thirdCar)
    }
    
    func buildArraysOfPresenterViewControllers() -> [UIViewController] {
        let arrayPresenterViewController: [CarPresenter] = {
            var carVC = [CarPresenter]()
            
            for car in cars {
                carVC.append(CarPresenter(carWith: car))
            }
            
            return carVC
        }()
     
        return arrayPresenterViewController
    }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        view.backgroundColor = .black
        setViewControllers([vcArray[0]], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarInteractor: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcArray.firstIndex(of: viewController as! CarPresenter) else { return nil }
        let previusIndex = vcIndex - 1
        guard previusIndex >= 0 else { return nil }
        guard vcArray.count > previusIndex else {return nil}
        return vcArray[previusIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = vcArray.firstIndex(of: viewController as! CarPresenter) else { return nil }
        let nextIndex = vcIndex + 1
        guard vcArray.count > nextIndex else { return nil }
        return vcArray[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
