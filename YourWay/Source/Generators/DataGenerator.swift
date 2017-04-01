//
//  DataGenerator.swift
//  YourWay
//
//  Created by Mike Rudoy on 01.04.17.
//  Copyright © 2017 MPK. All rights reserved.
//

import RealmSwift
import Foundation

class DataGenerator {
    
    func generateDataIfNeeded() {
        let realm = try! Realm()
        
        let steps = realm.objects(Step.self)
        if steps.count == 0 {
            generateData()
        }
    }
    
    fileprivate func generateData() {
        
        let category1 = Category(title: "Ремонт", iconAssetName: "icon_repair")
        let category2 = Category(title: "Экстрим", iconAssetName: "icon_extreme")
        let category3 = Category(title: "Кино", iconAssetName: "icon_cinema")
        let category4 = Category(title: "Шопинг", iconAssetName: "icon_shopping")
        
        
        
        let opportunity1 = Opportunity(title: "Шопинг 1",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category1)
        let opportunity2 = Opportunity(title: "Шопинг 2",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category2)
        let opportunity3 = Opportunity(title: "Шопинг 3",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category3)
        let opportunity4 = Opportunity(title: "Шопинг 4",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category4)
        let opportunity5 = Opportunity(title: "Шопинг 5",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category1)
        let opportunity6 = Opportunity(title: "Шопинг 6",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category2)
        let opportunity7 = Opportunity(title: "Шопинг 7",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category3)
        let opportunity8 = Opportunity(title: "Шопинг 8",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category4)
        let opportunity9 = Opportunity(title: "Шопинг 9",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category1)
        
        
        let step1 = Step(title: "Проведи день шопинга 1", order: 1, state: .missed)
        let step2 = Step(title: "Проведи день шопинга 2", order: 2, state: .missed)
        let step3 = Step(title: "Проведи день шопинга 3", order: 3, state: .missed)
        step1.opportunities.append(objectsIn: [opportunity1, opportunity2, opportunity3])
        step2.opportunities.append(objectsIn: [opportunity4, opportunity5, opportunity6])
        step3.opportunities.append(objectsIn: [opportunity7, opportunity8, opportunity9])
        
        let realm = try! Realm()
        realm.beginWrite()
        realm.add([step1, step2, step3])
        try! realm.commitWrite()
        
    }
    
}
