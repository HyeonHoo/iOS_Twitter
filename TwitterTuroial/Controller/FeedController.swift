//
//  FeedController.swift
//  TwitterTuroial
//
//  Created by HyeonHo on 2023/07/06.
//

import UIKit

class FeedController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit //이미지 사이즈 맞추기.
        navigationItem.titleView = imageView
    }
}
