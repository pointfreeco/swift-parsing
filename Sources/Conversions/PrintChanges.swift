//
//  PrintChanges.swift
//  OpenFestival
//
//  Created by Woodrow Melling on 10/31/24.
//

import CustomDump

extension Conversion {
    func _printChanges() -> some Conversion<Input, Output> {
        AnyConversion(
            apply: {
                customDump($0, name: "Before \(Self.self).apply")
                let result = try self.apply($0)
                customDump(result, name: "After \(Self.self).apply")

                return result
            },
            unapply: {
                customDump($0, name: "Before \(Self.self).unapply")
                let result = try self.unapply($0)
                customDump(result, name: "After \(Self.self) unapply")
                return result
            }
        )
    }
}
