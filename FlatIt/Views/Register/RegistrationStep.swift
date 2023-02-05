//
//  RegistrationStep.swift
//  FlatIt
//
//  Created by Euan Widjaja on 4/02/23.
//

enum RegistrationStep: CaseSequencable {
    case nameStep
    case dobStep
    case emailStep
    case phoneNumberStep
}

// From: https://orjpap.github.io/swift/caseiterable/protocols/2022/05/25/Case-Sequencable.html
protocol CaseSequencable: CaseIterable, Equatable {
    var nextCase: Self { get }
//    var previousCase: Self { get }
}

extension CaseSequencable {
    var nextCase: Self {
        // allCases is compiler synthesized (for enums without associated values)
        // there is no possible way for self to not exist in allCases
        // if you manually conform to CaseIterable it will crash :D
        let selfIndex = Self.allCases.firstIndex(of:self)!
        let nextIndex = Self.allCases.index(after: selfIndex)
        
        if nextIndex == Self.allCases.endIndex {
            // Loop back to first case
            return Self.allCases[Self.allCases.startIndex]
        } else {
            return Self.allCases[nextIndex]
        }
    }
    
//    var previousCase: Self {
//        // allCases is compiler synthesized (for enums without associated values)
//        // there is no possible way for self to not exist in allCases
//        // if you manually conform to CaseIterable it will crash :D
//        let selfIndex = Self.allCases.firstIndex(of:self)!
//        let previousIndex = Self.allCases.index(selfIndex, offsetBy: -1)
//        return Self.allCases[previousIndex]
//    }
}
