//
//  RegisterInfoView.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 22.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit
protocol RegisterInfoViewDelegate: class {
    func registerButtonTapped()
    func signInButtonTapped()
}
class RegisterInfoView: UIView {

    @IBOutlet weak var creatAccounButton: UIButton!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    
     weak var delegate: RegisterInfoViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
   required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    @IBAction private func createAccountAction(_ sender: Any) {
        delegate?.registerButtonTapped()
    }
    
    @IBAction private func signInAction(_ sender: Any) {
        delegate?.signInButtonTapped()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed("RegisterInfoView", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.frame
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    
}
