//
//  ConversationsController.swift
//  TwitterTuroial
//
//  Created by HyeonHo on 2023/07/06.
//

import UIKit

class ConversationsController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Meassages"
    }
}
