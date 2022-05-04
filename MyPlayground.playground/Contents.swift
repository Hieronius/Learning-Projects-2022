// List of purchases






struct ListOfPurchases {
    
    let bread = "White bread"
    let meat = "Chicken breast"
    let vegetables = "Cabage"
    let chocolate = "Alpen Gold"
    let spicy = "Pepper"
    let iceCream = "48 coins"
    let cereal = "Pasta"
}

let list = ListOfPurchases()
var ourPackage = [String]()


func purchaseFromTheList(position: String) {
    ourPackage.append(position)
    print("\(position) is bought")
    
}

purchaseFromTheList(position: list.bread)
purchaseFromTheList(position: list.cereal)
purchaseFromTheList(position: list.chocolate)
ourPackage

// Trying to make programm that will add new product to our bag and print "product is bought"
