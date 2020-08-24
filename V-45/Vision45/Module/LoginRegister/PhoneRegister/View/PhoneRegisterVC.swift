//
//  PhoneRegisterVC.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/6/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import UIKit

final class PhoneRegisterVC: ErrorViewController {
    
    private lazy var presenter: PhoneRegisterPresenter = {
        return PhoneRegisterPresenter(view: self)
    }()
    
    @IBOutlet private weak var descriptionLabel: LabelMedium! {
        didSet {
            descriptionLabel.text = Strings.phoneRegisterDesc.value()
        }
    }
    @IBOutlet private weak var phoneNumberTextField: PhoneTextField!
    @IBOutlet private weak var submitButton: SubmitButton!
    
}

// MARK: - Methods

fileprivate extension PhoneRegisterVC {
    
    @IBAction func submitButtonPressed(_ sender: SubmitButton) {
        presenter.validate(phoneNumber: phoneNumberTextField.text ?? "")
    }
    
}

// MARK: - Life Cycle

extension PhoneRegisterVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.text = "09360909897"
        title = Strings.simNumber.value()
        descriptionLabel.fade(duration: 0.4, delay: 0.6)
        phoneNumberTextField.fade(duration: 0.4, delay: 0.0)
        submitButton.fade(duration: 0.4, delay: 0.3)
    }
    
}

// MARK: - View Implementation

extension PhoneRegisterVC: PhoneRegisterView {
    
    func goToMenu() {
        let viewController = MenuVC.instantiate(storyboard: .menu)
        self.show(viewController, sender: nil)
    }
    
}
