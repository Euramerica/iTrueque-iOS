//
//  String.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 28/9/21.
//

import Foundation

public extension String {
    var length: Int {
        count
    }

    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }

    func localized(with arguments: CVarArg...) -> String {
        String(format: localized(), locale: nil, arguments: arguments)
    }

}
