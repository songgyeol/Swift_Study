# Swift_Study
211129_NavigationView #1 [view vs nvview]
//viewcontroller와 navigationview

//일반적인 뷰의 사례
import UIKit

class RootViewController: UIViewController {
    ...
    
    func showFirstViewController() {
        // 선언
        let firstVC = UIViewController()
        
        // 화면 띄우기
        self.present(firstVC, animated: true)
    }
    
    ...
}

//네비게이션뷰의 루트뷰컨트롤러 설정
import UIKit

class RootViewController: UIViewController {
    ...
    
    func showNavigationController() {
        // 선언
        let firstVC = UIViewController()
        let naviC = UINavigationController(rootViewController: firstVC)
        
        // 화면 띄우기
        self.present(naviC, animated: true)
    }
    
    ...
}




211129_Table Header
//  TabOneViewController.swift
//  TabBarTest
//
//  Created by 송결 on 2021/11/28.
//

import UIKit

class TabOneViewController: UIViewController {
    let tableHeader = UITableViewHeaderFooterView()
    let table = UITableView()
    let user: [User] = [User(mainMenu: UIImage(named: "슈퍼시드.png")!),
                        User(mainMenu: UIImage(named: "프리미엄.png")!),
                        User(mainMenu: UIImage(named: "클래식.png")!),
                        User(mainMenu: UIImage(named: "사이드디시.png")!),
                        User(mainMenu: UIImage(named: "음료.png")!),
                        User(mainMenu: UIImage(named: "피클소스.png")!)]
    
    let logoimage = #imageLiteral(resourceName: "logo")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        layout()
        attribute()
        headerViewLayout()
        //테이블 경계?!
        //        table.estimatedSectionHeaderHeight = 10
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension TabOneViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        
        cell.mainMenu.image = user[indexPath.row].mainMenu
        // cell.name.text = user[indexPath.row].name
        
        return cell
    }
    
    func headerViewLayout() {
        tableHeader.backgroundView = UIImageView.init(image: logoimage)
        tableHeader.backgroundColor = .darkGray
        tableHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableHeader.widthAnchor.constraint(equalToConstant: 300),
            tableHeader.heightAnchor.constraint(equalToConstant: 300)
        ])
        tableHeader.layoutIfNeeded()
        
    }
    
    
    func layout() {
        view.addSubview(table)
        //cell 간격
        table.rowHeight = 100
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        
    }
    
    func attribute() {
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        table.delegate = self
        table.dataSource = self
        table.tableHeaderView = tableHeader
    }
    
    // func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //   return 300
    
    
    
    
    
}




211128_Custom Tabbar
TabBar Basic
//#1 Viewcontroller
import UIKit


class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = TabOneViewController()
        let tabOneBarItem = UITabBarItem(title: "Domino's", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = TabTwoViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Wish List", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}



//#2 TabOneViewController
import UIKit

class TabOneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        self.title = "Domino's"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}



//#3 TabTwoViewController
import UIKit

class TabTwoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        self.title = "Wish List"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



211127_Custom Tabbar
class CustomTabBarController : UITabBarController {

        override func viewDidLoad() {
        super.viewDidLoad()
            
            
            self.tabBar.tintColor = .red
            self.tabBar.unselectedItemTintColor = .blue
            
            let firstVC = UINavigationController(rootViewController: ViewController())
            firstVC.tabBarItem.selectedImage = UIImage(systemName: "domino's")
            firstVC.tabBarItem.title = "Recent"
            firstVC.tabBarItem.image = UIImage(systemName: "domino's.fill")
            
            let wishView = UIViewController()
            wishView.view.backgroundColor = .yellow
            wishView.tabBarItem.title = "Wish List"
            wishView.tabBarItem.image = UIImage(systemName: "whshView.fill")
            
            viewControllers = [firstVC, wishView]
            
        }
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

            if let windowScene = scene as? UIWindowScene {
                let why = UIWindow(windowScene: windowScene)

                why.rootViewController = CustomTabBarController()

                why.makeKeyAndVisible()
            }
        }
    
}


211126_DreamPlus 2기_ 세번째 스터디
도미노앱 진행상황, 오더매니져 등
다음 스터디때는 서로 진행하고 있는 업무 및 공부 목표 정해서 달성해오기

211125_Tablew View..restart
1. ViewControlloer File
//
//  ViewController.swift
//  TableViewTest123
//
//  Created by 송결 on 2021/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    numberOfRowsInSection을 매개 변수로 받는 함수는 TableView에 나타내질 정보의 갯수를 리턴 합니다.
//    cellForRowAt을 매개변수로 받는 함수는 해당 셀에 어떤 데이터를 나타낼지를 리턴 합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        
        cell.mainMenu.image = user[indexPath.row].mainMenu
        cell.name.text = user[indexPath.row].name
        
        return cell
    }
    
    
    let table = UITableView()
    // let testArray = ["a", "b", "c", "d", "e", "f","g", "h", "i"]
    
    let user: [User] = [User(mainMenu: UIImage(named: "슈퍼시드.png")!, name: "슈퍼시드"),
                        User(mainMenu: UIImage(named: "프리미엄.png")!, name: "프리미엄"),
                        User(mainMenu: UIImage(named: "클래식.png")!, name: "클래식"),
                        User(mainMenu: UIImage(named: "사이드디시.png")!, name: "사이드디시"),
                        User(mainMenu: UIImage(named: "음료.png")!, name: "음료"),
                        User(mainMenu: UIImage(named: "피클소스.png")!, name: "피클소스")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        layout()
        attribute()
        
        func layout() {
            view.addSubview(table)
            //cell 간격
            table.rowHeight = 70
            table.translatesAutoresizingMaskIntoConstraints = false
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            
            
        }
        
        func attribute() {
            table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
            
        }
        
        
    }
    
}




2. CustomCell File
//
//  CustomCell.swift
//  TableViewTest123
//
//  Created by 송결 on 2021/11/23.
//

import UIKit

struct User {
    let mainMenu: UIImage
    let name: String
}

class CustomCell: UITableViewCell {
    //아이디 선언
    static let cellId = "CellId"
    //셀에 들어갈 요소들 선언
    let mainMenu = UIImageView()
    let name = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layout() {
        //            1. 위에서 선언한 두 요소를 뷰에 addSubview 해줍니다.
        //            2. 우선 뷰의 leadingAnchor로 부터 10pt 간격
        //            2-1 . centerYAnchor를 통해 이미지가 뷰의 Y축 가운데에 놓이도록 설정
        //            2-2. 가로 세로 크기 60 고정
        //            3. profile 의 trailingAnchor로 부터 10pt 간격
        //            3-1. centerYAnchor를 통해 이미지가 뷰의 Y축 가운데에 놓이도록 설정
        self.addSubview(mainMenu)
        self.addSubview(name)
        
        mainMenu.translatesAutoresizingMaskIntoConstraints = false
        mainMenu.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        mainMenu.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
//        mainMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
//        mainMenu.centerYAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
        mainMenu.widthAnchor.constraint(equalToConstant: 70).isActive = true
        mainMenu.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: mainMenu.trailingAnchor, constant: 10).isActive = true
        name.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}





211124_Tablew View..
분명 사진까지 구현되는걸 확인했는데
그 내용을 기록하려 했는데 오늘 좀 더 다듬고 올려야지 하다가
에러가 뜨기 시작했다
결국 내 수준에서는 도저히 모를 내용이라 깔끔하게 삭제하고 다시 해보기로...

211123_Tablew View Basic
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let myTableView: UITableView = UITableView()
    let loGoImage = #imageLiteral(resourceName: "logo")
    let items: [String] = ["슈퍼시드함유도우", "프리미엄", "클래식"]
    let mainImage: [UIImage] = [#imageLiteral(resourceName: "logo"), #imageLiteral(resourceName: "슈퍼시드"), #imageLiteral(resourceName: "피클소스"), #imageLiteral(resourceName: "피클소스"), #imageLiteral(resourceName: "프리미엄"), #imageLiteral(resourceName: "슈퍼시드"), #imageLiteral(resourceName: "사이드디시")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view.
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        
        
        
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
                                                   multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .bottom, relatedBy: .equal, toItem: self.view,
                                                   attribute: .bottom, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .leading, relatedBy: .equal, toItem: self.view,
                                                   attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.myTableView,
                                                   attribute: .trailing, relatedBy: .equal, toItem: self.view,
                                                   attribute: .trailing, multiplier: 1.0, constant: 0))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

211121_Tablew View Snapkit?
//snapkit?

import UIKit

final class PracticeViewController: UIViewController {
    static func instance() -> PracticeViewController? {
        return PracticeViewController()
    }

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PracticeChatTableViewCell.self, forCellReuseIdentifier: PracticeChatTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    func initViews() {
        super.initViews()

        self.view.addSubview(self.tableView)
        self.tableView.make { (make) in
            make.edges.equalToSuperview()
        }

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension PracticeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PracticeChatTableViewCell.identifier, for: indexPath)
        return cell
    }
}

211120_Domino Clone App Dev Start

// tableView 생성
    private let tableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    // imageView 생성
    private let img: UIImageView = {
    let imgView = UIImageView()
    imgView.image = UIImage(named: " ")
    return imgView
}()
// label 생성
private let label: UILabel = {
    let label = UILabel()
    label.text = "메뉴"
    label.textColor = UIColor.gray
    return label
}()

211118_Domino Clone App Dev Start



211117_Memory Leak Study_3
Alert reset, + 원
매우 간단하다 #그냥 값을 0으로 주면된다.

let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        //메시지 창 컨트롤러에 버튼 액션을 추가
        //alert.addAction(defaultAction)
        //alert.addAction(destructiveAction)
        
        firstMenuStepper.value = 0
        secondMenuStepper.value = 0
        thirdMenuStepper.value = 0
        
        a = 0
        b = 0
        c = 0
        
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)
    
    }


-----------------------------------------------------------------------------
 + 원 붙이기, 왜 내가 했을때는 안됐었지?

@objc func firstStepper(_ sender: UIStepper) {
        
        firstMenuQuantity.text = Int(sender.value).description
        a = Int(sender.value) * 6000
        totalLabel.text = "\(a + b + c) 원"
        
        
    }
    
    @objc func secondStepper(_ sender: UIStepper) {
        secondMenuQuantity.text = Int(sender.value).description
        b = Int(sender.value) * 7000
        totalLabel.text = "\(a + b + c) 원"
        
        
    }
    
    @objc func thirdStepper(_ sender: UIStepper) {
        thirdMenuQuantity.text = Int(sender.value).description
        c = Int(sender.value) * 9000
        totalLabel.text = "\(a + b + c) 원"
    }


211115_Memory Leak Study_3
메모리 누수(Memory Leak)의 사례
메모리 누수(Memory Leak)의 사례
강한참조 사이클로 인한 메모리누수의 사례

// 클로저 18-9번 파일과 동일 내용


class Dog {
    var name = "초코"
    
    var run: (() -> Void)?
    
    func walk() {
        print("\(self.name)가 걷는다.")
    }
    
    func saveClosure() {
        // 클로저를 인스턴스의 변수에 저장
        run = {
            print("\(self.name)가 뛴다.")
        }
    }
    
    deinit {
        print("\(self.name) 메모리 해제")
    }
}



func doSomething() {
    let choco: Dog? = Dog()
    choco?.saveClosure()       // 강한 참조사이클 일어남 (메모리 누수가 일어남)
}



doSomething()


211115_Memory Leak Study_2
메모리 누수(Memory Leak)현상의 해결
#1 - 약한 참조(Weak Reference)
class Dog {
    var name: String
    weak var owner: Person?     // weak 키워드 ==> 약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


class Person {
    var name: String
    weak var pet: Dog?         // weak 키워드 ==> 약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var bori: Dog? = Dog(name: "보리")
var gildong: Person? = Person(name: "홍길동")


// 강한 참조 사이클이 일어나지 않음
bori?.owner = gildong
gildong?.pet = bori



// 메모리 해제가 잘됨(사실 이 경우 한쪽만 weak으로 선언해도 상관없음)
bori = nil
gildong = nil
약한 참조의 경우, 참조하고 있던 인스턴스가 사라지면, nil로 초기화 되어있음
// nil로 설정하고 접근하면 ===> nil

//gildong = nil
//bori?.owner   // gildong만 메모리 해제시켰음에도 ===> nil

#2 - 비소유 참조(Unowned Reference)
class Dog1 {
    var name: String
    unowned var owner: Person1?    // Swift 5.3 이전버전에서는 비소유참조의 경우, 옵셔널 타입 선언이 안되었음
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person1 {
    var name: String
    unowned var pet: Dog1?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var bori1: Dog1? = Dog1(name: "보리1")
var gildong1: Person1? = Person1(name: "홍길동1")


// 강한 참조 사이클이 일어나지 않음
bori1?.owner = gildong1
gildong1?.pet = bori1



// 메모리 해제가 잘됨(사실 이 경우 한쪽만 unowned로 선언해도 상관없음)
bori1 = nil
gildong1 = nil

비소유 참조의 경우, 참조하고 있던 인스턴스가 사라지면, nil로 초기화 되지 않음
// nil로 설정하고 접근하면 ===> 에러 발생

// 1) 에러발생하는 케이스

//gildong1 = nil
//bori1?.owner   // nil로 초기화 되지 않음 에러 발생


// 2) 에러가 발생하지 않게 하려면

//gildong1 = nil
//bori1?.owner = nil      // 에러 발생하지 않게 하려면, nil로 재설정 필요 ⭐️
//bori1?.owner




211115_Memory Leak Study
Memory Leak(메모리 누수) 현상에 대한 이해
메모리 관리

Memory Leak(메모리 누수) 현상에 대한 이해
class Dog {
    var name: String
    var owner: Person?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


class Person {
    var name: String
    var pet: Dog?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var bori: Dog? = Dog(name: "보리")
var gildong: Person? = Person(name: "홍길동")


bori?.owner = gildong
gildong?.pet = bori


// 강한 참조 사이클(Strong Reference Cycle)이 일어남

bori = nil
gildong = nil


/**==========================================
 - 객체가 서로를 참조하는 강한 참조 사이클로 인해
 - 변수의 참조에 nil을 할당해도 메모리 해제가 되지 않는
 - 메모리 누수(Memory Leak)의 상황이 발생
=============================================**/


#Memory Leak의 해결방안
/**==========================================
 - RC를 고려하여, 참조 해제 순서를 주의해서 코드 작성
    ===> 신경쓸 것이 많음/실수 가능성
 
 - 1) Weak Reference (약한 참조)
 - 2) Unowned Reference (비소유 참조)
=============================================**/



211111_Menu(code_4)
import UIKit


class ViewController: UIViewController {
    //let alert = UIAlertController(title: "내 지갑", message: "얼마를 갖고 싶니?", preferredStyle: UIAlertController.Style.alert)
    
    
    let myCash = UILabel()
    
    let mainLabel = UILabel()
    
    let walletButton = UIButton()
    
    let firstMenuLabel = UILabel()
    let secondMenuLabel = UILabel()
    let thirdMenuLabel = UILabel()
    
    let firstPriceLabel = UILabel()
    let secondPriceLabel = UILabel()
    let thirdPriceLabel = UILabel()
    
    let firstMenuQuantity = UILabel()
    let secondMenuQuantity = UILabel()
    let thirdMenuQuantity = UILabel()
    
    let firstMenuStepper = UIStepper.init()
    let secondMenuStepper = UIStepper.init()
    let thirdMenuStepper = UIStepper.init()
    
    let totalLabel = UILabel()
    
    
    let creditButton = UIButton()
    let resetButton = UIButton()
    
    var a = 0
    var b = 0
    var c = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let safeArea = view.safeAreaLayoutGuide
        
        
        
        
        
        
        
        
        
        view.addSubview(mainLabel)
        mainLabel.text = "메뉴를 선택하세요"
        mainLabel.textAlignment = .center
        mainLabel.textColor = UIColor.blue
        mainLabel.backgroundColor = UIColor.green
        mainLabel.font = .systemFont(ofSize: 20)
        //레이블은 프레임사이즈 안 먹어?
        //mainLabel.frame.size = CGSize.init(width: 10, height: 30)
        //mainLabel.layer.preferredFrameSize() 이건 뭐야?
        mainLabel.layer.cornerRadius = 1 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //수평 중앙에 맞추기
        //mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //leading,trailing처럼 아랍권에서는 반대로 읽기 때문에 방향이 다르다
        //left,right가 무조건 왼쪽,오른쪽 개념
        //메인 레이블을 왼쪽에서부터 제약을 둔다(왼쪽으로부터 100을 띄우겠다)
        mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        //메인 레이블을 위쪽에서부터 제약을 둔다(상단 m자탈모부터 50 띄우겠다)
        mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        view.addSubview(walletButton)
        walletButton.setTitle("내 지갑", for: .normal)
        walletButton.backgroundColor = UIColor.red
        //walletButton.setTitleColor(.brown, for: .focused) 너는 뭐야?
        //walletButton.setTitleShadowColor(.blue, for: .highlighted) 너도 뭔데?
        //프레임 사이즈 변경 어찌함?
        //walletButton.frame.size = CGSize.init(width: 200, height: 30)
        walletButton.layer.cornerRadius = 10
        //walletButton.addTarget(self, action: #selector(walletButton), for: .touchUpInside)
        walletButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        walletButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50).isActive = true
        walletButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(myCash)
        myCash.text = "0원"
        myCash.textColor = UIColor.white
        myCash.backgroundColor = UIColor.gray
        myCash.font = .systemFont(ofSize: 30)
        myCash.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        myCash.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myCash.leftAnchor.constraint(equalTo: walletButton.leftAnchor, constant: 70).isActive = true
        myCash.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70).isActive = true
        myCash.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50).isActive = true
        myCash.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(firstMenuLabel)
        firstMenuLabel.text = "짜장면"
        firstMenuLabel.textAlignment = .center
        firstMenuLabel.textColor = UIColor.black
        firstMenuLabel.backgroundColor = UIColor.gray
        firstMenuLabel.font = .systemFont(ofSize: 20)
        //firstMenuLabel.frame.size = CGSize.init(width: 100, height: 100)
        firstMenuLabel.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        firstMenuLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //수평 중앙에 맞추기
        //mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstMenuLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        firstMenuLabel.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        firstMenuLabel.topAnchor.constraint(equalTo: walletButton.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        firstMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(secondMenuLabel)
        secondMenuLabel.text = "볶음밥"
        secondMenuLabel.textAlignment = .center
        secondMenuLabel.textColor = UIColor.black
        secondMenuLabel.backgroundColor = UIColor.gray
        secondMenuLabel.font = .systemFont(ofSize: 20)
        secondMenuLabel.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        secondMenuLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondMenuLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        secondMenuLabel.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        secondMenuLabel.topAnchor.constraint(equalTo: firstMenuLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        secondMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(thirdMenuLabel)
        thirdMenuLabel.text = "탕수육"
        thirdMenuLabel.textAlignment = .center
        thirdMenuLabel.textColor = UIColor.black
        thirdMenuLabel.backgroundColor = UIColor.gray
        thirdMenuLabel.font = .systemFont(ofSize: 20)
        thirdMenuLabel.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        thirdMenuLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdMenuLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thirdMenuLabel.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        thirdMenuLabel.topAnchor.constraint(equalTo: secondMenuLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        thirdMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        view.addSubview(firstPriceLabel)
        firstPriceLabel.text = "6,000원"
        firstPriceLabel.textColor = UIColor.black
        firstPriceLabel.backgroundColor = UIColor.gray
        firstPriceLabel.font = .systemFont(ofSize: 20)
        firstPriceLabel.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        firstPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstPriceLabel.leftAnchor.constraint(equalTo: firstMenuLabel.leftAnchor, constant: 100).isActive = true
        firstPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -200).isActive = true
        firstPriceLabel.topAnchor.constraint(equalTo: walletButton.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        firstPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(secondPriceLabel)
        secondPriceLabel.text = "7,000원"
        secondPriceLabel.textColor = UIColor.black
        secondPriceLabel.backgroundColor = UIColor.gray
        secondPriceLabel.font = .systemFont(ofSize: 20)
        secondPriceLabel.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        secondPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondPriceLabel.leftAnchor.constraint(equalTo: secondMenuLabel.leftAnchor, constant: 100).isActive = true
        secondPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -200).isActive = true
        secondPriceLabel.topAnchor.constraint(equalTo: firstPriceLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        secondPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(thirdPriceLabel)
        thirdPriceLabel.text = "9,000원"
        thirdPriceLabel.textColor = UIColor.black
        
        thirdPriceLabel.backgroundColor = UIColor.gray
        thirdPriceLabel.font = .systemFont(ofSize: 20)
        thirdPriceLabel.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        thirdPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdPriceLabel.leftAnchor.constraint(equalTo: thirdMenuLabel.leftAnchor, constant: 100).isActive = true
        thirdPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -200).isActive = true
        thirdPriceLabel.topAnchor.constraint(equalTo: secondPriceLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30).isActive = true
        thirdPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(firstMenuQuantity)
        firstMenuQuantity.text = "수량"
        firstMenuQuantity.textAlignment = .center
        firstMenuQuantity.textColor = UIColor.white
        firstMenuQuantity.backgroundColor = UIColor.black
        firstMenuQuantity.font = .systemFont(ofSize: 20)
        firstMenuQuantity.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        // firstMenuQuantity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstMenuQuantity.leftAnchor.constraint(equalTo: firstPriceLabel.rightAnchor, constant: 10
        ).isActive = true
        firstMenuQuantity.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        firstMenuQuantity.topAnchor.constraint(equalTo: walletButton.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        firstMenuQuantity.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(secondMenuQuantity)
        secondMenuQuantity.text = "수량"
        secondMenuQuantity.textAlignment = .center
        secondMenuQuantity.textColor = UIColor.white
        secondMenuQuantity.backgroundColor = UIColor.black
        secondMenuQuantity.font = .systemFont(ofSize: 20)
        secondMenuQuantity.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        // firstMenuQuantity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondMenuQuantity.leftAnchor.constraint(equalTo: secondPriceLabel.rightAnchor, constant: 10).isActive = true
        secondMenuQuantity.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        secondMenuQuantity.topAnchor.constraint(equalTo: firstMenuQuantity.bottomAnchor, constant: 30).isActive = true
        secondMenuQuantity.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(thirdMenuQuantity)
        thirdMenuQuantity.text = "수량"
        thirdMenuQuantity.textAlignment = .center
        thirdMenuQuantity.textColor = UIColor.white
        thirdMenuQuantity.backgroundColor = UIColor.black
        thirdMenuQuantity.font = .systemFont(ofSize: 20)
        thirdMenuQuantity.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        // firstMenuQuantity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdMenuQuantity.leftAnchor.constraint(equalTo: thirdPriceLabel.rightAnchor, constant: 10).isActive = true
        thirdMenuQuantity.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        thirdMenuQuantity.topAnchor.constraint(equalTo: secondMenuQuantity.bottomAnchor, constant: 30).isActive = true
        thirdMenuQuantity.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //        view.addSubview(firstMenuStepper)
        //        firstMenuStepper.backgroundColor = UIColor.red
        //        firstMenuStepper.layer.cornerRadius = 10
        //        firstMenuStepper.leftAnchor.constraint(equalTo: firstMenuQuantity.rightAnchor, constant: 5).isActive = true
        //        firstMenuStepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        //        firstMenuStepper.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        //        firstMenuStepper.translatesAutoresizingMaskIntoConstraints = false
        //
        
        
        
        
        view.addSubview(firstMenuStepper)
        firstMenuStepper.tintColor = .red
        firstMenuStepper.backgroundColor = UIColor.gray
        firstMenuStepper.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        // firstMenuQuantity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstMenuStepper.leftAnchor.constraint(equalTo: firstMenuQuantity.rightAnchor, constant: 15).isActive = true
        firstMenuStepper.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        //firstMenuStepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        firstMenuStepper.topAnchor.constraint(equalTo: walletButton.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        firstMenuStepper.translatesAutoresizingMaskIntoConstraints = false
        //        stepper의 옵션 중
        //        wraps : 이게 True로 선언되면, 최대값이 될때 다시 최소값으로 바꾼다.
        //        autorepeat :  누르고 있으면 반복해서 눌러진다라는 옵션??
        //        maximumvalue : 최대값 설정
        firstMenuStepper.wraps = true
        firstMenuStepper.autorepeat = true
        firstMenuStepper.maximumValue = 10
        
        view.addSubview(secondMenuStepper)
        secondMenuStepper.tintColor = .red
        secondMenuStepper.backgroundColor = UIColor.gray
        secondMenuStepper.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //        //stepper의 옵션 중
        //        wraps : 이게 True로 선언되면, 최대값이 될때 다시 최소값으로 바꾼다.
        //        autorepeat :  누르고 있으면 반복해서 눌러진다라는 옵션??
        //        maximumvalue : 최대값 설정
        secondMenuStepper.wraps = true
        secondMenuStepper.autorepeat = true
        secondMenuStepper.maximumValue = 11
        //수직 중앙에 맞추기
        // firstMenuQuantity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondMenuStepper.leftAnchor.constraint(equalTo: secondMenuQuantity.rightAnchor, constant: 15).isActive = true
        secondMenuStepper.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        //firstMenuStepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        secondMenuStepper.topAnchor.constraint(equalTo: firstMenuStepper.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        secondMenuStepper.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(thirdMenuStepper)
        thirdMenuStepper.tintColor = .red
        thirdMenuStepper.backgroundColor = UIColor.gray
        thirdMenuStepper.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        
        //        //stepper의 옵션 중
        //        wraps : 이게 True로 선언되면, 최대값이 될때 다시 최소값으로 바꾼다.
        //        autorepeat :  누르고 있으면 반복해서 눌러진다라는 옵션??
        //        maximumvalue : 최대값 설정
        thirdMenuStepper.wraps = true
        thirdMenuStepper.autorepeat = true
        thirdMenuStepper.maximumValue = 11
        
        //수직 중앙에 맞추기
        // firstMenuQuantity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdMenuStepper.leftAnchor.constraint(equalTo: thirdMenuQuantity.rightAnchor, constant: 15).isActive = true
        thirdMenuStepper.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        //firstMenuStepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 70).isActive = true
        thirdMenuStepper.topAnchor.constraint(equalTo: secondMenuStepper.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        thirdMenuStepper.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        view.addSubview(totalLabel)
        
        totalLabel.text = "합계: "
        //totalLabel.text = (self.totalLabel.text)!
        totalLabel.textAlignment = .center
        totalLabel.textColor = UIColor.white
        totalLabel.backgroundColor = UIColor.black
        totalLabel.font = .systemFont(ofSize: 40)
        totalLabel.layer.cornerRadius = 10 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        // firstMenuQuantity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        totalLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        totalLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        totalLabel.topAnchor.constraint(equalTo: thirdMenuQuantity.bottomAnchor, constant: 30).isActive = true
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(creditButton)
        creditButton.setTitle("결제하기", for: .normal)
        creditButton.setTitleColor(UIColor.white, for: .normal)
        creditButton.backgroundColor = UIColor.black
        //walletButton.setTitleColor(.brown, for: .focused) 너는 뭐야?
        //walletButton.setTitleShadowColor(.blue, for: .highlighted) 너도 뭔데?
        //프레임 사이즈 변경 어찌함?
        //walletButton.frame.size = CGSize.init(width: 200, height: 30)
        creditButton.layer.cornerRadius = 10
        //walletButton.addTarget(self, action: #selector(walletButton), for: .touchUpInside)
        creditButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        creditButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 70).isActive = true
        creditButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        creditButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(resetButton)
        resetButton.setTitle("다시 선택하기", for: .normal)
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.backgroundColor = UIColor.gray
        //walletButton.setTitleColor(.brown, for: .focused) 너는 뭐야?
        //walletButton.setTitleShadowColor(.blue, for: .highlighted) 너도 뭔데?
        //프레임 사이즈 변경 어찌함?
        //walletButton.frame.size = CGSize.init(width: 200, height: 30)
        resetButton.layer.cornerRadius = 10
        //walletButton.addTarget(self, action: #selector(walletButton), for: .touchUpInside)
        resetButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        resetButton.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 120).isActive = true
        resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        
        
        
        walletButton.addTarget(self, action: #selector(walletBtnTapped(_:)), for: .touchUpInside)
        firstMenuStepper.addTarget(self, action: #selector(firstStepper(_:)), for: .touchUpInside)
        secondMenuStepper.addTarget(self, action: #selector(secondStepper(_:)), for: .touchUpInside)
        thirdMenuStepper.addTarget(self, action: #selector(thirdStepper(_:)), for: .touchUpInside)
        creditButton.addTarget(self, action: #selector(creditBtTapped(_:)), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetBtTapped), for: .touchUpInside)
        
        
        
        
        
        
        
    }
    //    🖋️ title은 사용자에게 보이는 버튼의 이름을 설정합니다.
    //
    //    🖋️ style은 버튼 타입을 결정합니다. 타입의 종류는 default, cancel, destructive 세 가지가 있습니다.
    //
    //    1 .cancel :아무것도 실행되지 않은 채 메시지 창의 액션이 취소된다는 것을 뜻하며, 메시지 창 내에서 한 번만 사용할 수 있습니다(두 개 이상 사용시 런타임 오류 발생).
    //    2 .destructive: 주의해서 선택해야 할 버튼에 사용합니다. 이 타입이 적용된 버튼은 빨간색으로 강조되며, 중요한 내용을 변경하거나 삭제해서 되돌릴 수 없는 결정을 하는 버튼에 적용됩니다.
    //    3 .default: 위 두 가지 스타일 이외에 일반적인 버튼에 사용됩니다.
    
    @objc func walletBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "내 지갑", message: "얼마를 갖고 싶니?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (myTextField) in
            myTextField.placeholder = "마음껏 말해봐!!"
        }
        //tf.isSecureTextEntry = true
        //두 번째 코드인. isSecureTextEntry는 비밀번호 입력을 하면 필드에서 그 값을 ●●●로 처리하는 것입니다.
        
        let destructiveAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.destructive) { [self] (textfield) in
            // 버튼 클릭시 실행되는 코드
            //...원 붙이는 법?!
            if let text = alert.textFields {
                if let textfield = text.first {
                    self.myCash.text = (textfield.text)! + "원"
                    self.myCash.textColor = UIColor.black
                }
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        //메시지 창 컨트롤러에 버튼 액션을 추가
        //alert.addAction(defaultAction)
        //alert.addAction(destructiveAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)
        
        
    }
    
    
    @objc func firstStepper(_ sender: UIStepper) {
        
        firstMenuQuantity.text = Int(sender.value).description
        a = Int(sender.value) * 6000
        totalLabel.text = "\(a + b + c)"
        
        
    }
    
    @objc func secondStepper(_ sender: UIStepper) {
        secondMenuQuantity.text = Int(sender.value).description
        b = Int(sender.value) * 7000
        totalLabel.text = "\(a + b + c)"
        
        
    }
    
    @objc func thirdStepper(_ sender: UIStepper) {
        thirdMenuQuantity.text = Int(sender.value).description
        c = Int(sender.value) * 9000
        totalLabel.text = "\(a + b + c)"
    }
    
    
    
    
    
    
    
    @objc func creditBtTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "결제창입니다", message: "결제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        //        alert.addTextField { (myTextField) in
        //                myTextField.placeholder = "마음껏 말해봐!!"
        //       }
        //tf.isSecureTextEntry = true
        //두 번째 코드인. isSecureTextEntry는 비밀번호 입력을 하면 필드에서 그 값을 ●●●로 처리하는 것입니다.
        
        let destructiveAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.destructive)// { _ in
//            switch {
//            case
//            }
//        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        //메시지 창 컨트롤러에 버튼 액션을 추가
        //alert.addAction(defaultAction)
        //alert.addAction(destructiveAction)
        
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)
        
        
    }
    
    @objc func resetBtTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "다시 선택하기", message: "초기화합니다", preferredStyle: UIAlertController.Style.alert)
        
        
        let destructiveAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.destructive) { _ in
            
            self.myCash.text = "0원"
            self.firstMenuQuantity.text = "0개"
            self.secondMenuQuantity.text = "0개"
            self.thirdMenuQuantity.text = "0개"
            self.totalLabel.text = "0원"
            
        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        //메시지 창 컨트롤러에 버튼 액션을 추가
        //alert.addAction(defaultAction)
        //alert.addAction(destructiveAction)
        
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        //메시지 창 컨트롤러를 표시
        self.present(alert, animated: false)
    
    }
        
     


}



20211113 test

211111_Menu(code_3)
let alert = UIAlertController(title: "내 지갑", message: "얼마를 갖고 싶니?", preferredStyle: UIAlertController.Style.alert)

@objc func walletBtnTapped(_ sender: UIButton) {
    //let defaultAction =  UIAlertAction(title: "내 지갑", style: UIAlertAction.Style.default)
    let destructiveAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.destructive){(_) in
        // 버튼 클릭시 실행되는 코드
    }
    let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
    
    //메시지 창 컨트롤러에 버튼 액션을 추가
    //alert.addAction(defaultAction)
    alert.addAction(destructiveAction)
    alert.addAction(cancelAction)
    alert.addTextField() { (tf) in
        tf.placeholder = "얼마를 갖고싶냐고 말해!"
//          tf.isSecureTextEntry = true
//          두 번째 코드인. isSecureTextEntry는 비밀번호 입력을 하면 필드에서 그 값을 ●●●로 처리하는 것입니다.
    }

    //메시지 창 컨트롤러를 표시
    self.present(alert, animated: false)
}


211111_Menu(code_2)
Alert 코드 구현
//override func viewDidLoad() {
    super.viewDidLoad()
    walletButton.addTarget(self, action: #selector(walletBtnTapped(_:)), for: .touchUpInside)

//class에서 정의
walletButton.addTarget(self, action: #selector(walletBtnTapped(_:)), for: .touchUpInside)
@objc func walletBtnTapped(_ sender: UIButton) {
    
}

211110_Menu(code_1)
import UIKit

class ViewController: UIViewController {
    let mainLabel = UILabel()
    
    let walletButton = UIButton()
    
    let firstMenuLabel = UILabel()
    let secondMenuLabel = UILabel()
    let thirdMenuLabel = UILabel()
    
    let firstMenuStepper = UIStepper.init()
    let secondMenuStepper = UIStepper.init()
    let thirdMenuStepper = UIStepper.init()
    
    let creditButton = UIButton()
    let resetButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = view.safeAreaLayoutGuide
        
        view.addSubview(mainLabel)
        mainLabel.text = "메뉴를 선택하세요"
        mainLabel.textColor = UIColor.blue
        mainLabel.backgroundColor = UIColor.green
        mainLabel.font = .systemFont(ofSize: 20)
        mainLabel.frame.size = CGSize.init(width: 50, height: 30)
        //mainLabel.layer.preferredFrameSize() 이건 뭐야?
        mainLabel.layer.cornerRadius = 1 //레이블 테두리 둥글게??안되는데???
        //수직 중앙에 맞추기
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //수평 중앙에 맞추기
        //mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //메인 레이블을 왼쪽에서부터 제약을 둔다(왼쪽으로부터 100을 띄우겠다)
        mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        //메인 레이블을 위쪽에서부터 제약을 둔다(상단 m자탈모부터 50 띄우겠다)
        mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(walletButton)
        walletButton.setTitle("내 지갑", for: .normal)
        walletButton.backgroundColor = UIColor.red
        //walletButton.setTitleColor(.brown, for: .focused) 너는 뭐야?
        //walletButton.setTitleShadowColor(.blue, for: .highlighted) 너도 뭔데?
        walletButton.frame.size = CGSize.init(width: 50, height: 30)
        walletButton.layer.cornerRadius = 10
        //walletButton.addTarget(self, action: #selector(walletButton), for: .touchUpInside)
        
        walletButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        walletButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20).isActive = true
        walletButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
}




211109_Menu(view)
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var firstMenu: UILabel!
    @IBOutlet weak var secondMenu: UILabel!
    @IBOutlet weak var thirdMenu: UILabel!
    
    @IBOutlet weak var firstStepper: UIStepper!
    @IBOutlet weak var secondStepper: UIStepper!
    @IBOutlet weak var thirdStepper: UIStepper!
    
    @IBOutlet weak var walletBT: UIButton!
    @IBOutlet weak var choiceBT: UIButton!
    @IBOutlet weak var resetBT: UIButton!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mainLabel.text = "메뉴를 선택하세요"
        firstMenu.text = "짜장면"
        secondMenu.text = "마파두부"
        thirdMenu.text = "짬봉"
        
        walletBT.setTitle("지갑", for: .normal)
        choiceBT.setTitle("결정", for: .normal)
        resetBT.setTitle("취소", for: .normal)
    
    }
    


}

211109_Button(code) 최종정리
//main view
import UIKit

class ViewController: UIViewController {

     
    let redButton = UIButton()
    let blueButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //$0 하는 법
//        [redButton, blueButton].forEach {
//            $0.setTitle("", for: .normal)
//        }
        view.addSubview(redButton)
        redButton.frame.size = CGSize(width: 60, height: 30)
        redButton.layer.cornerRadius = 10
        
        //redButton.setTitle("", for: .normal)
        redButton.backgroundColor = UIColor.systemRed
        redButton.addTarget(self, action: #selector(redBtTapped(_:)), for: .touchUpInside)

        view.addSubview(blueButton)
        blueButton.frame.size = CGSize(width: 60, height: 30)
        blueButton.layer.cornerRadius = 10
        //blueButton.setTitle("", for: .normal)
        blueButton.backgroundColor = UIColor.systemBlue
        blueButton.addTarget(self, action: #selector(blueBtTapped(_:)), for: .touchUpInside)
        
        //[뷰를 유연하게 표현] 생성된 제약을 적용 isActive = true
        redButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        //아이폰 m자 탈모라인 안쪽으로
        let safeArea = view.safeAreaLayoutGuide
        //중심
        redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //상단에서부터
        redButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 300).isActive = true
        blueButton.topAnchor.constraint(equalTo: redButton.topAnchor, constant: 200).isActive = true
        
    
    }

    @objc func redBtTapped(_ button: UIButton) {
        //코드로 뷰 연결하는 법
        let redVC = FIrstViewController()
        redVC.modalPresentationStyle = .fullScreen
        self.present(redVC, animated: true)
        
        
    }
    //스토리보드 뷰 이미지 연결하는 법
//        guard let redViewVC = storyboard?.instantiateViewController(identifier: "redView") else { return }
//        redViewVC.modalPresentationStyle = .fullScreen
//        self.present(redViewVC, animated: true, completion: nil)
//    }
    
    
    @objc func blueBtTapped(_ button: UIButton) {
     //코드로 뷰 연결하는 법
        let blueVC = SecondViewController()
        blueVC.modalPresentationStyle = .fullScreen
        self.present(blueVC, animated: true)
        
        
    }
        //스토리보드 뷰 이미지 연결하는 법
//        guard let blueViewVC = storyboard?.instantiateViewController(identifier: "blueView") else { return }
//        blueViewVC.modalPresentationStyle = .fullScreen
//        self.present(blueViewVC, animated: true, completion: nil)
//    }
}




//sub view
import UIKit

class FIrstViewController: UIViewController {

    
    let redBackBt = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemRed
        view.layer.cornerRadius = 10
        view.addSubview(redBackBt)
        
        redBackBt.setTitle("뒤로", for: .normal)
        redBackBt.setTitleColor(.black, for: .normal)
        redBackBt.backgroundColor = UIColor.white
        redBackBt.addTarget(self, action: #selector(whiteBackTapped), for: .touchUpInside)
        redBackBt.translatesAutoresizingMaskIntoConstraints = false
        redBackBt.layer.cornerRadius = 10
        
        
        let safeArea = view.safeAreaLayoutGuide
        
                
        redBackBt.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        redBackBt.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        redBackBt.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 150).isActive = true
        redBackBt.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -150).isActive = true
        // Do any additional setup after loading the view.
    }
    

    @objc func whiteBackTapped(_ button: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


211108_Button(code)
import UIKit

class ViewController: UIViewController {

    let redButton = UIButton()
    let blueButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [redButton, blueButton].forEach {
            $0.setTitle("뒤로", for: .normal)
            
        }
        view.addSubview(redButton)
        redButton.frame.size = CGSize(width: 60, height: 30)
        redButton.layer.cornerRadius = 10
        
        //redButton.setTitle("", for: .normal)
        redButton.backgroundColor = UIColor.systemRed
        redButton.addTarget(self, action: #selector(redBtTapped(_:)), for: .touchUpInside)

        view.addSubview(blueButton)
        blueButton.frame.size = CGSize(width: 60, height: 30)
        blueButton.layer.cornerRadius = 10
        //blueButton.setTitle("", for: .normal)
        blueButton.backgroundColor = UIColor.systemBlue
        blueButton.addTarget(self, action: #selector(blueBtTapped(_:)), for: .touchUpInside)
        
        //[뷰를 유연하게 표현] 생성된 제약을 적용 isActive = true
        redButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        //중심선
        let safeArea = view.safeAreaLayoutGuide
        redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //상단에서부터
        redButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 300).isActive = true
        blueButton.topAnchor.constraint(equalTo: redButton.topAnchor, constant: 200).isActive = true
        
    
    }

    @objc func redBtTapped(_ button: UIButton) {
        guard let redViewVC = storyboard?.instantiateViewController(identifier: "redView") else { return }
        redViewVC.modalPresentationStyle = .fullScreen
        self.present(redViewVC, animated: true, completion: nil)
    }
    
    
    @objc func blueBtTapped(_ button: UIButton) {
        guard let blueViewVC = storyboard?.instantiateViewController(identifier: "blueView") else { return }
        blueViewVC.modalPresentationStyle = .fullScreen
        self.present(blueViewVC, animated: true, completion: nil)
    }
}


import UIKit

class FIrstViewController: UIViewController {

    let redBackBt = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemRed
        view.layer.cornerRadius = 10
        view.addSubview(redBackBt)
        
        redBackBt.setTitle("뒤로", for: .normal)
        redBackBt.setTitleColor(.black, for: .normal)
        redBackBt.backgroundColor = UIColor.white
        redBackBt.addTarget(self, action: #selector(whiteBackTapped), for: .touchUpInside)
        redBackBt.translatesAutoresizingMaskIntoConstraints = false
        redBackBt.layer.cornerRadius = 10
        
        
        let safeArea = view.safeAreaLayoutGuide
        
                
        redBackBt.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        redBackBt.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        redBackBt.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 150).isActive = true
        redBackBt.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -150).isActive = true
        // Do any additional setup after loading the view.
    }
    

    @objc func whiteBackTapped(_ button: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

211108_AutoLayout
참조 = https://macgongmon.club/31
**Frame-Base Layout**의 경우에는 상단 사각형 뷰를 그릴때 해당 뷰는 **"좌표 (20, 20)에 위치하고 폭은 120, 높이는 80을 가지고 있다."** 라고 정의를 합니다. 정의한 좌표와 사이즈에 따라서 뷰가 그려질겁니다.

반대로 **Auto Layout**의 경우에는 Frame-Base Layout과는 다르게 뷰를 정의할때 **"어느 뷰로부터 어느만큼 떨어져있다."**라고 불리는 **제약사항(constraint)**을 정의해줍니다.오른쪽에 있는 뷰의 상단 사각형 뷰를 그릴 경우 다음과 같은 제약사항을정의합니다.

- 사각형 뷰의 왼쪽은 부모 뷰로부터 20 떨어져있다.
- 사각형 뷰의 오른쪽은 부모 뷰로부터 -20 떨어져있다.
- 사각형 뷰의 상단은 부모 뷰로부터 20 떨어져있다.
- 사각형 뷰의 높이는 α이다.

Auto Layout의 가장 큰 장점은 **여러 해상도를 유연하게 지원할 수 있다는 것**입니다.왼쪽과 같이 Frame-Base Layout으로 뷰를 그리면 의도된 해당도를 지원하는 단말기에서는 정상적으로 보이겠지만, 더 작은 해상도라던지, 더 큰 해상도에서 보게되면 여백이 많이 줄어들거나, 반대로 여백이 많이 생길 수 있습니다.Auto Layout의 경우에는 왼쪽, 오른쪽에 제약사항을 걸어두었으니 해상도가 작은 단말기든, 높은 단말기든 상관없이 부모 뷰로부터 왼쪽에서 20, 오른쪽에서 20만큼 떨어져서 뷰가 그려집니다.

이런 장점으로 인해서 Auto Layout을 많이 사용하게 된 것 같습니다.

### 코드로 그려보자!

코드로 Auto Layout을 그릴 경우, 3가지 순서로 뷰를 그려주면 됩니다!

- UI요소들 정의
- addSubView
- bind constraints


class AutoLayoutView: UIView {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    
    label.text = "AutoLayout 만들기👋"
    label.textColor = .black
    label.font = .systemFont(ofSize: 24)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let descriptionLabel: UILabel = {
    let label = UILabel()
    
    label.text = "설명이 여기에 들어갈껀데용?"
    label.textColor = .gray
    label.font = .systemFont(ofSize: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  ...
}


그려야할 UI요소는 UILabel 두개니까 두개를 정의해줍시다. 텍스트 내용, 컬러, 폰즈는 적당히 설정했어요 ㅋㅋ

정의해주실 때 만드시

**translatesAutoresizingMaskIntoConstraints** 값을 **false**로 설정해주세요! [공식문서](https://developer.apple.com/documentation/uikit/uiview/1622572-translatesautoresizingmaskintoco)에 이렇게 적혀있어요!

우리는 동적으로 뷰의 위치와 크기를 결정할 것이기 때문에 false로 설정해줍니다!

UI요소를 정의했으니 나머니 addSubView와 bind Constraints를 진행해봅시다.

import UIKit

class AutoLayoutView: UIView {

  ...
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    // Setup
    self.backgroundColor = .white
    self.addSubview(titleLabel)
    self.addSubview(descriptionLabel)
    
    
    // Bind constraints
    self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
    self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
    
    self.descriptionLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor).isActive = true
    self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

뷰들의 Constraint를 걸어주기 전에 addSubView를 통해 뷰 계층 구조를 먼저 만들어줍시다.

그 다음에 Constraint들을 생성해줍니다!

하나씩 살펴보면 titleLabel의 left에 대한 제약사항을 먼저 만들어줍니다.

```swift
self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
```

titleLabel은 부모 뷰의 왼쪽에서 24만큼만 떨어져야합니다. 여기서 부모라고 불리는 것은 addSubView에서 뷰의 계층구조를 정의해줬으므로 전체 화면을 의미합니다.

```swift
self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
```

다음으로 titleLabel의 top은 상단 safeAreaLayout으로부터 24만큼 떨어져야하므로 위와같이 설정해줍니다.

하나씩 보니 간단하죠?? titleLabel에 대한 제약은 모두 만들었으니, 그 다음 descriptionLabel에 대한 제약을 만들어 줍니다.

```swift
self.descriptionLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor).isActive = true
self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5).isActive = true
```

descriptionLabel의 left는 titleLabel의 left와 동일하게 설정해줬습니다.titleLabel의 left는 화면 왼쪽으로부터 24만큼 떨어지게 설정을 했고, descriptionLabel도 똑같은 제약을 만들겠다고 했으니 descriptionLabel의 left도 화면 왼쪽으로부터 24만큼 떨어지게 됩니다.**(동일한 제약사항을 적용한다라고 생각하시면 됩니다!)**descriptionLabel의 top은 titleLabel의 밑으로 5만큼 떨어지게 설정했습니다.

이렇게 뷰 클래스를 만들어 놓고 ViewController에서 view만 방금 만든 뷰 클래스로 설정해주면 되겠죠?

```swift
import UIKit

class ViewController: UIViewController {
  
  private lazy var autoLayoutView = AutoLayoutView(frame: self.view.frame)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view = autoLayoutView
  }
}
```

### SnapKit

[SnapKit](https://github.com/SnapKit/SnapKit)은 위에서 코드로 만든 Auto Layout을 조금 더 쉽게 만들 수 있도록 도와주는 라이브러리입니다.위에서 만든 뷰 코드를 SnapKit으로 만들게 되면 아래와 같습니다.

```swift
import UIKit
import SnapKit

class AutoLayoutView: UIView {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    
    label.text = "AutoLayout 만들기👋"
    label.textColor = .black
    label.font = .systemFont(ofSize: 24)
    return label
  }()
  
  let descriptionLabel: UILabel = {
    let label = UILabel()
    
    label.text = "설명이 여기에 들어갈껀데용?"
    label.textColor = .gray
    label.font = .systemFont(ofSize: 15)
    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    // Setup
    self.backgroundColor = .white
    self.addSubview(titleLabel)
    self.addSubview(descriptionLabel)
    
    
    // Bind Constraints
    self.titleLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(24)
    }
    
    self.descriptionLabel.snp.makeConstraints { make in
      make.left.equalTo(self.titleLabel.snp.left)
      make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
```

처음에 코드로 그린 뷰와 비교했을때 가장 큰 차이는 두가지입니다!

- translatesAutoresizingMaskIntoConstraints = false 를 하지 않아도 된다!
- left, top, right, bottom마다 한줄씩 정의할 필요 없이 하나의 뷰에 대해서 클로저로 한꺼번에 Constratins 정의 가능!

개인적으로는 SnapKit형태로 AutoLayout을 정의하는 코드가 좀더 쉽게 읽혀서 SnapKit 사용을 선호하는 편입니다.


211107_Button(view)
//스토리보드 뷰로 기본틀 만들기
//세컨뷰들 코코아로 코드로 연결하기
//

//#ViewController.Swift
import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.backgroundColor = UIColor.white
    }
    
    @IBAction func mainBT1(_ sender: UIButton) {
        mainLabel.backgroundColor = UIColor.yellow
    }
    
    @IBAction func mainBT2(_ sender: UIButton) {
        mainLabel.backgroundColor = UIColor.green
        
    }   
}


//#ViewController.Swift2
import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var yellowBT: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yellowBT.backgroundColor = UIColor.white
        yellowBT.setTitle("", for: .normal)
        yellowBT.layer.cornerRadius = 10    
      
    }    
    @IBAction func yellowBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }

211107_가위바위보
RPSGame
import UIKit


class ViewController: UIViewController {
    //변수,속성
    @IBOutlet var mainLabel: UIView!
    
    
    @IBOutlet var comImageView: UIView!
    @IBOutlet var myImageView: UIView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    

    var myChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    var comChoice: Rps = Rps.rock
    
    
    
    //함수,메서드
    //앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comImageView.image = #imageLiteral(resourceName: "ready") //image literal
        myImageView.image = = UIImage(named: "ready.png")//애셋파일에 저장된 이미지 넣는법
        
        
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
        
        
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //가위/바위/보(enum)를 선택해서 그 정보를 저장해야 됨
        
        //버튼의 문자를 가져옴
        //1.
        //guard let title = sender.currentTitle else {        }
        
        //2.
        let title sender.currentTitle!
        
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
        
        
        
    }
    
    //리셋시키기
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //1.컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        //2.컴퓨터가 랜덤 선택한 것을 레이블에 표시
        comImageView.image = image literal
        comChoiceLabel.text = "준비"
        
        
        //3.내가 선택한 것을 이미지뷰에 표시
        //4.내가 선택한 것을 레이블에 표시
        myImageView.image = image literal
        myChoiceLabel.text = "준비"
        
        //5.컴퓨터와 내가 선택한 것을 비교해서 승/패 표시
        mainLabel.text = "선택하세요"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //1.컴퓨터 다시 이미지 준비 표시
        //2.컴퓨터가 다시 레이블 준비 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = rock image
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = paper image
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = scissors image
            comChoiceLabel.text = "가위"
        }
        
        switch myChoice {
        case Rps.rock:
            myImageView.image = rock image
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = paper image
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = scissors image
            myChoiceLabel.text = "가위"
        }
        
        
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
        
        
        //3.내가 다시 이미지뷰 준비 표시
        //4.내가 다시 레이블 준비 표시
        //5.메인레이블 선택하세요 표시
        //컴퓨터가 다시 랜덤 가위,바위,보를 선택하고 저장하도록 리셋
        
        
        
    }
}


211106_DICEApp
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    
    //viewdidload = 첫 화면
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = diceArray[1]
        secondImageView.image = diceArray[1]
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        //버튼을 눌렀을 때
        //첫번째 이미지뷰의 이미지를 랜덤으로 변경
        //두번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceArray.randomElement()
        
        
        secondImageView.image = diceArray.randomElement()
        
        
        
    }
}

211105_ButtonApp
//화면 하나당 그 화면을 담당하는 코드가 있다
//viewDidLoad = 앱의 화면에 들어오면 처음 실행시키는 함수
// qq = outlet, action 연결 끊는 단축키??
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var buttonPush: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.backgroundColor = UIColor.black
        
    }
    
    
    
    
    @IBAction func buttonPush(_ sender: UIButton){
        
        mainLabel.text = "될까?"
        buttonPush.backgroundColor = UIColor.white
        buttonPush.setTitleColor(.black, for: .normal) //<-함수, for = parametter
        
    }
    


}


211104_ButtonApp

211101_ARC
//ARC_스터디

class Dog {
    var name: String
    var weight: Double
    
    init(name: String, weight: Double) {
    self.name = name
    self.weight = weight
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
    self.name = name
    self.age = age
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var moong: Dog? = Dog(name: "뭉치", weight: 3.5) //rc: 1
//var gyeol: Dog? = Dog(name: "송결", weight: 58)  //rc: 1

moong = nil // nil값을 주면 메모리해제 된다.
gyeol = nil // nil값을 주면 메모리해제 된다.


var gyeol: Person? = Person(name: "송결", age: 33)

gyeol = nil






//#ARC(Automatic Reference Counting)
var dog1: Dog?
var dog2: Dog?
var dog3: Dog?


dog1 = Dog(name: "댕댕이", weight: 7.0)     // RC + 1   RC == 1
dog2 = dog1                               // RC + 1   RC == 2
dog3 = dog1                               // RC + 1   RC == 3


dog3?.name = "깜둥이"
dog2?.name
dog1?.name



dog3 = nil                                // RC - 1   RC == 2
dog2 = nil                                // RC - 1   RC == 1
dog1 = nil                                // RC - 1   RC == 0    // 메모리 해제



#강한참조(메모리누수현상)

//강한참조 오너<->펫 서로 참조하기 때문에
//nil값을 줘도 서로 참조하기 때문에 메모리 해제x,
//메모리 누수현상 해결
//weak(약한), unowned(비소유) 키워드


class Dog {
    var name: String
    weak var owner: Person?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


class Person {
    var name: String
    weak var pet: Dog?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


var moong: Dog? = Dog(name: "뭉치")
var song: Person? = Person(name: "송결")


moong?.owner = song
song?.pet = moong


moong = nil
song = nil


1030-test
