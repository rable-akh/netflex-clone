//
//  Extensions.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 13/02/2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
