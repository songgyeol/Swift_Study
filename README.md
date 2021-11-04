# Swift_Study
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
