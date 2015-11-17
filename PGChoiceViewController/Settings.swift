//
//  Settings.swift
//  PGChoiceViewController
//
//  Created by Piotr Gorzelany on 17/11/15.
//  Copyright © 2015 Piotr Gorzelany. All rights reserved.
//

import Foundation

struct Settings {
    
    // Currently chosen settings
    
    static var sortOrder: SortOrder?
    static var sortBy: SortBy?
    static var student: Student?
    
}

enum SortOrder: String, CustomStringConvertible {
    
    case Ascending, Descending
    
    var description: String {
        return self.rawValue
    }
}

enum SortBy: String, CustomStringConvertible {
    
    case Date, Priority, Deadline, Title, Progress
    
    var description: String {
        return self.rawValue
    }
}

func ==(l: Student, r: Student) -> Bool {
    return l.id == r.id
}

class Student: CustomStringConvertible, Equatable {
    
    static var studentIdSequence: Int = 1
    
    let name: String
    let surname: String
    let id: Int
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
        id = Student.studentIdSequence++
    }
    
    var description: String {
        return "Student \(name) \(surname) - ID: \(id)"
    }
}