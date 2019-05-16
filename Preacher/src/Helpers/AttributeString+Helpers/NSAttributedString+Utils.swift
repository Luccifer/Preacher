//
//  Preacher
//
//  Created by Gleb Karpushkin on 15/05/2019.
//  Copyright © 2019 Gleb Karpushkin. All rights reserved.
//
import Foundation

public func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    let s = NSMutableAttributedString(attributedString: lhs)
    s.append(rhs)
    return s
}

public func + (lhs: String, rhs: NSAttributedString) -> NSAttributedString {
    let s = NSMutableAttributedString(string: lhs)
    s.append(rhs)
    return s
}

public func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
    let s = NSMutableAttributedString(attributedString: lhs)
    s.append(NSAttributedString(string: rhs))
    return s
}



