//
//  Errors.swift
//  Base64 Decoder
//
//  Created by Justin Purnell on 11/30/21.
//

import Foundation

enum Err: Error {
    case noData
    case stringDecode
    case dataEncode
    case writeToDisk
}
