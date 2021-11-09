# Swift_Study
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
