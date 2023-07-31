//
//  CustomUIViewController.swift
//  desafio
//
//  Created by Caio Cardozo on 28/07/23.
//

import UIKit

private var loaderView: UIView?

// Mark: - Loader
extension UIViewController {
    
    private func showLoader() {
        
        if loaderView == nil {
            // creating loaderView
            loaderView = UIView(frame: UIScreen.main.bounds)
            
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let viewBlur = UIVisualEffectView(effect: blurEffect)
            
            viewBlur.layer.cornerRadius = 10
            viewBlur.clipsToBounds = true
            
            viewBlur.frame = CGRect(x: 0, y: 0, width: 120, height: 100)
            loaderView?.addSubview(viewBlur)
            viewBlur.center = loaderView!.center
            // stackview for loader and text
            let stackView = UIStackView(frame: viewBlur.frame)
            stackView.spacing = 16
            stackView.axis = .vertical
            
            // loader
            let loader = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            loader.startAnimating()
            stackView.addArrangedSubview(loader)
            
            // add stackview as subview for centerView
            viewBlur.contentView.addSubview(stackView)
            
            // setup constraints
            stackView.translatesAutoresizingMaskIntoConstraints = false
            viewBlur.addConstraints([
                NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: viewBlur, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: viewBlur, attribute: .centerY, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: viewBlur, attribute: .leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: viewBlur, attribute: .trailing, multiplier: 1, constant: 0)
            ])
        }
        
        if self.navigationController ==  nil {
            self.view.addSubview(loaderView!)
        } else {
            self.navigationController?.view.addSubview(loaderView!)
        }
        
    }
    
    private func hideLoader () {
        if loaderView != nil {
            DispatchQueue.main.async {
                loaderView?.removeFromSuperview()
            }
        }
    }

    func setLoader(loading isLoading: Bool) {
        isLoading ? self.showLoader() : self.hideLoader()
    }
}

extension UIViewController {
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadCustomCloseButton(action: Selector) {
        let closeButton = UIButton(type: .custom)
        closeButton.setImage(UIImage(named: "icClose"), for: .normal)
        closeButton.addTarget(self, action: action, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: closeButton)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
}
