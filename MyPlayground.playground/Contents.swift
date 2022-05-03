// List of purchases


struct ListOfPurchases {
    
    let bread = "White"
    let meat = "Chicken breast"
    let vegetables = "Cabage"
    let chocolate = "Alpen Gold"
    let spicy = "Pepper"
    let iceCream = "48 coins"
    let cereal = "Pasta"
}

let list = ListOfPurchases()
var ourPackage = [ListOfPurchases]()


func purchaseFromTheList(position: ListOfPurchases) {
    ourPackage.append(position)
    print("\(position) is bought")
    
}

purchaseFromTheList(position: list)
ourPackage

// Trying to make programm that will add new product to our bag and print "product is bought"
