

class Calculator {
    
    var firstNumber: Int
    var secondNumber: Int
    
    var addition: Int {
        firstNumber + secondNumber
    }
    
    var subtraction: Int {
        firstNumber - secondNumber
    }
    
    var multiply: Int {
        firstNumber * secondNumber
    }
    
    var division: Int {
        firstNumber / secondNumber
    }
    
    init(firstNumber: Int, secondNumber: Int) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
}

var firstTwoNumbers = Calculator(firstNumber: 50, secondNumber: 25)
firstTwoNumbers.addition
firstTwoNumbers.subtraction
firstTwoNumbers.division
firstTwoNumbers.multiply
