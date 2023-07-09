//
//  MainTabController.swift
//  TwitterTuroial
//
//  Created by HyeonHo on 2023/07/06.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Properties
        
    let actionButton: UIButton = { //모든 뷰컨트롤러에 보여주기 위해서 maintab에 작성합니다.
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
       // button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        configureUI()
        
       
    }
    //MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print(123)
    }
    
    
    //MARK: - Helpers
    
    func configureUI(){ //버튼의 제약조건을 설정합니다.
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside) 
        //클로저 내부에 addTarget을 추가할 때,self는 해당 클로저의 범위가 아닌 독립 실행 파일(MainTabController.self)을 참조하기 때문에 configureUI 메서드로 옮겼습니다.
        
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                            paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
                            //safeAreaLayoutGuide 모든 기기에서 동일한 위치에 만들기위해 사용합니다.
        actionButton.layer.cornerRadius = 56 / 2
    }
    
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
