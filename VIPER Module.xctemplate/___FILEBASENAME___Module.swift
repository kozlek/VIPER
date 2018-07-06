//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class ___VARIABLE_productName:identifier___Module: ___VARIABLE_productName:identifier___ModuleProtocol {
    
    var rootViewController: UIViewController? {
        return viewController
    }
    
    private var interactor: ___VARIABLE_productName:identifier___Interactor
    private var presenter: ___VARIABLE_productName:identifier___Presenter
    private var viewController: ___VARIABLE_productName:identifier___ViewController?
    private var completionHandler: (() -> Void)?
    
    // Uncomment in case of subclassing the NSObject
    /*override*/ init() {
        
        interactor = ___VARIABLE_productName:identifier___Interactor()
        presenter = ___VARIABLE_productName:identifier___Presenter()
        
        //super.init() // In case of subclassing NSObject
        
        // Interactor setup
        interactor.delegate = presenter

        // Presenter setup
        presenter.delegate = self
        presenter.interactor = interactor
        
        // View controller setup
        let storyboard = UIStoryboard(name: "___VARIABLE_productName:identifier___", bundle: Bundle.main)
        
         if let storyboardController = storyboard.instantiateInitialViewController() as? ___VARIABLE_productName:identifier___ViewController {
            
            viewController = storyboardController
            viewController?.delegate = presenter
            
            viewController?.container = self // Retain module, pin to viewController
            
            presenter.viewController = viewController
         }
    }
    
}

extension ___VARIABLE_productName:identifier___Module: ___VARIABLE_productName:identifier___PresenterDelegate {

    func didClose() {
        completionHandler?()
        viewController.container = nil // Release module
    }

}