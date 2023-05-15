//
//  String+SuffixArray.swift
//  SuffixIterator
//
//  Created by Dmitriy Verennik on 21.04.2023.
//

import Foundation


extension String {

    func suffixArray(ascending: Bool) -> [Suffix] {
        let startTime = DispatchTime.now().uptimeNanoseconds
        let indexes = SuffixArrayService.suffixArray(self).sorted {
            if ascending {
                return $0 > $1
            }
            return $0 < $1
        }
        return indexes.compactMap { index in
            let position = self.index(self.startIndex, offsetBy: index)
            let resultString = String(self[position..<self.endIndex])
            let endTime = DispatchTime.now().uptimeNanoseconds
            return Suffix(value: resultString, searchTime: (endTime - startTime))
        }
    }
}


final class SuffixArrayService {
    
     static func suffixArray(_ text: String) -> [Int] {
         let count = text.count
         var indicesArray = Array(0..<count)
         var rank = Array(text.utf16).map { Int($0) }
         var temp = Array(repeating: 0, count: count)
         var k = 1

         func compare(_ first: Int, _ second: Int) -> Bool {
             if rank[first] != rank[second] {
                 return rank[first] < rank[second]
             }
             let ri = first + k < count ? rank[first + k] : -1
             let rj = second + k < count ? rank[second + k] : -1
             return ri < rj
         }

         while k <= count {
             indicesArray.sort { compare($0, $1) }
             temp[indicesArray[0]] = 0
             for i in 1..<count {
                 temp[indicesArray[i]] = temp[indicesArray[i - 1]] + (compare(indicesArray[i - 1], indicesArray[i]) ? 1 : 0)
             }
             rank = temp
             k *= 2
         }

         return indicesArray
     }
 }
