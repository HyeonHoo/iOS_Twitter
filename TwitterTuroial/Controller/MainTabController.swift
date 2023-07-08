//
//  MainTabController.swift
//  TwitterTuroial
//
//  Created by HyeonHo on 2023/07/06.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
       
    }
    
    //MARK: - Helpers
    
    func configureViewControllers(){
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)

        let explore = ExploreController()
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        viewControllers = [nav1, nav2, nav3, nav4 ] // 뷰 컨트롤러 속성 배열을 설정
    }

    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> //네비게이션 이미지와 이동을 위한 도움 함수.
    UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        
        
        if #available(iOS 15.0, *) {    //iOS 15 이상버전 부터 다크모드 라이트 모드 설정때문에 네비게이션 배경색 적용을 위한 코드
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = .white
                appearance.shadowColor = .clear
                nav.navigationBar.standardAppearance = appearance
                nav.navigationBar.scrollEdgeAppearance = appearance
            } else {
                nav.navigationBar.barTintColor = .white
                nav.navigationBar.shadowImage = UIImage()
                
            }
            
            return nav
        }


}
