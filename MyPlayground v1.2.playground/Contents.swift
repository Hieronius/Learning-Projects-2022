import UIKit

// Functions and closures

// Функция генерации случайного массива банкнот:
func generateWallet(walletLenght: Int) -> [Int] {
    // существующие типы банкнот:
    let typesOfBanknotes = [50, 100, 500, 1000, 5000]
    
    // массив банкнот
    var wallet: [Int] = []
    // цикл генерации массива случайных банкнот
    for _ in 1...walletLenght {
        wallet.append(typesOfBanknotes.randomElement()!)
    }
    return wallet
}

// Функция подсчета денег в кошельке
func sumWallet(banknotesFunction wallet: (Int) -> [Int], walletLenght: Int) -> Int? {
    
    // вызов переданной функции
    let myWalletArray = wallet(walletLenght)
    var sum: Int = 0
    for oneBanknote in myWalletArray {
        sum += oneBanknote
    }
    return sum
}

// Передача функции в функцию
sumWallet(banknotesFunction: generateWallet, walletLenght: 20)
