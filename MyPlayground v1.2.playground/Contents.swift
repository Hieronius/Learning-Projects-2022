

// sorts with functions and closures
// Methods sort(), sorted(), filter(), map(), flatMap(), mapValues(), compactMap(), reduce(), zip(),

/// 1. Method map() with func and closure

// Method map() with dictionary
var personChars: [String: Int] = ["Intelligence": 10, "Strength": 25, "Agility": 20, "Vatality": 15]
var personEquipment: [String] = ["Sword", "Shield", "Knife", "Golden ring", "Key"]

var personCharsAfterLevelUp = personChars.map {$0.value + 5}
print(personCharsAfterLevelUp)

// Method map() with array
func powerUp(array: [String]) -> [String] {
    
    var arrayOfRareItems = [String]()
    
    for item in array {
        arrayOfRareItems.append(item += " rare quality")
    }
    
    return arrayOfRareItems
}
