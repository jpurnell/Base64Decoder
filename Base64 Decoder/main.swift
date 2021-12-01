//
//  main.swift
//  Base64 Decoder
//
//  Created by Justin Purnell on 11/30/21.
//

import Foundation

let fileName = "Mail Attachment.eml"
let fm = FileManager()
let path = fm.homeDirectoryForCurrentUser.appendingPathComponent("Desktop/")
let fullPath = path.appendingPathComponent(fileName)
let writePath = path.appendingPathComponent(fileName.replacingOccurrences(of: ".eml", with: ".html"))
guard let data = try? Data(contentsOf: fullPath, options: .mappedIfSafe) else { print("no data at location"); throw Err.noData }
guard let string = try String(data: data, encoding: .utf8) else { print("could not convert to string"); throw Err.stringDecode }
let stringCleaned = string.replacingOccurrences(of: "\n", with: "")
guard let dataUpdated = try Data(base64Encoded: stringCleaned) else { print("could not reencode"); throw Err.dataEncode }
guard let str = String(data: dataUpdated, encoding: .utf8) else { print("did not re-decode"); throw Err.stringDecode }
guard let _ = try? str.write(to: writePath, atomically: true, encoding: .utf8) else { print("Could not write to disk"); throw Err.writeToDisk}
