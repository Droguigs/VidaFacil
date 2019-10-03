//
//  AlertBuilder.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

enum AlertStyle: Int {
    case alert
    case actionSheet
}

class AlertBuilder {
    
    private var alert: UIAlertController!
    private var buttons: [AlertButtonAction] = []
    
    init(title: String? = nil, message: String? = nil) {
        self.alert = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: AlertBuilder.style(.alert))
    }
    
    init(title: String? = nil, message: String? = nil, style: AlertStyle) {
        self.alert = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: AlertBuilder.style(style))
    }
    
    func add(button: AlertButtonAction) -> AlertBuilder {
        self.buttons.append(button)
        return self
    }
    
    func show(controller: UIViewController, animated: Bool, completion: (() -> ())? = nil, anchorView: UIView? = nil) {
        for button in self.buttons {
            let btnStyle = self.buttonStyle(button)
            let action = UIAlertAction(title: button.title, style: btnStyle, handler: { (UIAlertAction) in
                if let completion = button.completion {
                    completion()
                }
            });
            self.alert.addAction(action)
        }
        
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        if deviceIdiom == .pad {
            let hasAnchorView = anchorView != nil
            if let presenter = alert.popoverPresentationController {
                if let view = hasAnchorView ? anchorView! : UIApplication.shared.delegate?.window??.rootViewController?.view {
                    presenter.sourceView = view
                    presenter.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                    if !hasAnchorView {
                        presenter.permittedArrowDirections = []
                    }
                } else {
                    return
                }
            }
        }
        controller.present(self.alert, animated: true, completion: nil)
    }
    
    private func buttonStyle(_ button: AlertButtonAction) -> UIAlertAction.Style {
        switch button.style {
        case .cancel:
            return UIAlertAction.Style.cancel
        case .destructive:
            return UIAlertAction.Style.destructive
        default:
            return UIAlertAction.Style.default
        }
    }
    
    private static func style(_ style: AlertStyle) -> UIAlertController.Style {
        switch style {
        case .alert:
            return UIAlertController.Style.alert
        case .actionSheet:
            return UIAlertController.Style.actionSheet
        }
    }
}
