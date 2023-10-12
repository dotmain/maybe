//
//  Int+Collatz.swift
//  Collatz
//
//  Created by Sina on 06.10.22.
//

public extension Int {
    /**
     convinience for even/odd value
     - returns true for even
    */
    var even: Bool { self % 2 == 0 }
    
    /**
     convinience for negativevalue
     - returns negative integer value
    */
    var negative: Int { -self }
    
    /**
     a looped value
     - returns true for a lock loop value
    */
    var loop: Bool { self == 1 || self == -1 || self == -5  || self == -17 || self == 0 }
    
    /**
     collatz function
     https://en.wikipedia.org/wiki/Collatz_conjecture
            
     - returns an array of integers with collatz function steps
        - ƒ : even ? n/2 : 3n+1
    */
    var ƒ_collatz: [Int] {
        var factor = self
        var factors: [Int] = [factor]
        while factor.loop.not {
            if factor.even {
                factor = factor / 2
                factors.append(factor)
            } else {
                factor = (factor * 3) + 1
                factors.append(factor)
            }
        }
        return factors
    }
    
    /**
     collatz function
     - returns an array of integers with collatz function steps
    */
    var collatz: Collatz {
        Collatz(int: self)
    }
}

public struct Collatz: Codable {
    /**
     Integer base value
    */
    public let base: Int
    
    /**
     Integer collatz values
    */
    public let collatz: [Int]
    
    /**
     Negative Integer collatz values
    */
    public let negatives: [Int]
    
    /**
     Integer collatz values count
    */
    public let steps: Int
    
    /**
     Negative Integer collatz values count
    */
    public let inverseSteps: Int
    
    /**
     Integer collatz maximum magnitude value
    */
    public let max: Int
    
    /**
     Integer collatz minimum magnitude value
    */
    public let min: Int
    
    /**
     Collatz initializer with base integer
        - parameters
            int: base integer value
    */
    public init(int: Int) {
        base = int
        collatz = base.ƒ_collatz
        negatives = (-base).ƒ_collatz
        steps = collatz.count
        inverseSteps = negatives.count
        max = collatz.max() ?? 0
        min = abs(negatives.min() ?? 0) 
    }
}
