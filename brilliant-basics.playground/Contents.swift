/*
 Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.
 
 Return nil if there is no value available which suits the criteria
 
 Provided are a set of input/outputs that should help you complete the test
 */

import UIKit
import Foundation

func find(missing array: [Int]) -> Int? {
  
  //Check if array is empty
  guard array.isEmpty == false else {
    return nil
  }
  
  // Remove Duplicate elements
  var setOfIntegers = Array(Set(array))
  setOfIntegers = setOfIntegers.sorted()
  setOfIntegers = setOfIntegers.filter({$0 >= 0})
  
  //Check if set is empty
  guard setOfIntegers.isEmpty == false else {
    return nil
  }
  //Find missing first positive integer
  var number = setOfIntegers[0]
  for i in setOfIntegers{
    
    if i != number{
      return number
    }else if i == setOfIntegers.last{
      return number+1
    }
    number = number+1
  }
  return nil
}


find(missing: [0, 1, 2]) // output should be 3
//find(missing: [1, 2, 0]) // output should be 3
//find(missing: [31, 30, 27, 26, 32, 28, 28]) // output should be 29
//find(missing: [3, 4, -1, 1, 1]) // output should be 2
//find(missing: [-1, -2, 0, 1 ,2, 3, 4, 5, 5, 7, 10]) // output should be 6
//find(missing: [-1, -2, -3]) // output should be nil
//find(missing: []) // output should be nil
