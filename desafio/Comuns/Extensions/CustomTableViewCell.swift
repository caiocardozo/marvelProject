//
//  CustomTableViewCell.swift
//  desafio
//
//  Created by Caio Cardozo on 28/07/23.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

