# Swift_Study
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
