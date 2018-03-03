//
//  ListDataManager.swift
//  case
//
//  Created by towry on 2018/2/28.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation

typealias ListDataManagerFetchEntriesBlock = () -> Array<Any>

class ListDataManager {
    var dataStore: CoreDataStore?
    
    init() {
        
    }
    
    func todoItemsBetweenStartDate(startDate: Date, endDate: Date, completionBlock: ((_ todoItems: Array<Any>) -> ())? = nil) {
        let cal = Calendar.autoupdatingCurrent
        let predicate = NSPredicate(format: "(date >= %@) AND (date <= %@)", [cal.dateForBeginningOfDay(date: startDate), cal.dateForEndOfDay(date: endDate)])
        let sortDescriptors: Array<Any> = []
        
        self.dataStore?.fetchEntriesWithPredicate(predicate: predicate, sortDescriptors: sortDescriptors) { (entries: Array<Any>) -> () in
            if let completionBlock = completionBlock {
                completionBlock(self.todoItemsFromDataStoreEntries(entries: entries))
            }
        }
    }
    
    private func todoItemsFromDataStoreEntries(entries: Array<Any>) -> Array<Any> {
//        return entries.block
        return []
    }
}