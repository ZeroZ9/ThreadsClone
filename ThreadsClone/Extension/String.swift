//
//  String.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 9/4/24.
//

import Foundation
import UIKit

extension String{
    func heighWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constrantRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constrantRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
