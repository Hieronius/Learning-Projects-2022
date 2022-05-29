

// sorts with functions and closures
// Methods sort(), sorted(), filter(), map(), flatMap(), mapValues(), compactMap(), reduce(), zip(),

/// 1. Method map()

// Method map() with dictionary
var personChars: [String: Int] = ["Intelligence": 10, "Strength": 25, "Agility": 20, "Vatality": 15]
var personCharsAfterLevelUp = personChars.map {$0.value + 5}
print(personCharsAfterLevelUp)
//



// Method map() with array
var personEquipment: [String] = ["Sword", "Shield", "Knife", "Golden ring", "Key"]
var upgradedEquipment = personEquipment.map {$0 + " rare quality"}
print(upgradedEquipment)
//
var numbersInArray = [1,2,3,4]
var newArrayNumbers = numbersInArray.map { Array(repeating: $0, count: $0) }
print(newArrayNumbers)


/// 2. Method mapValues()
var dictOfNumbers = ["first": 1, "second": 2, "third": 3]
var newDictOfNumbers = dictOfNumbers.mapValues {$0 + 5}
print(newDictOfNumbers)
//


/// 3. Method flatMap()
var newArrayWithFlatMap = numbersInArray.flatMap { Array(repeating: $0, count: $0) }
print(newArrayWithFlatMap)

var someArray = [[1,2,3,4,5], [11,44,1,6], [16,403,321,10]]
let filterSomeArray = someArray.flatMap { $0.filter { $0 % 2 == 0 }}
print(filterSomeArray)

let arrayOfString = [["Alena"], ["Ivanna"], ["Jessica"], ["Suzanna"], ["Jasmine"]]
let filterArrayOfString = arrayOfString.flatMap { $0.filter { $0.contains("A") }}
print(filterArrayOfString)

let dictOfValues = [["Inga": 28], ["Marina": 35], ["Janna": 29], ["Alina": 25]]
let flatMapDictOfValues = dictOfValues.flatMap { $0.filter { $0.value >= 29 }}
print(flatMapDictOfValues)

let multipleArray = [[[1,2,3], [4,5,6]], [[7,8,9], [10,11,12]]]
let sortedMultipleArray = multipleArray.flatMap { $0.flatMap  { $0.filter { $0 % 3 == 0} }}
print(sortedMultipleArray)
