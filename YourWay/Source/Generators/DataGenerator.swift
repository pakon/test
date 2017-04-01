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
        
        
        
        let opportunity1 = Opportunity(title: "Прыжок с парашютом",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Посмотри своим страхам прямо в глаза! Сделай всего один шаг вперед, когда под ногами нет твердой опоры.", category: category2)
        
        let opportunity2 = Opportunity(title: "Красавица и чудовище",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Обозлённая Волшебница превратила принца Адама в отвратительное чудовище за то, что тот был злым, самовлюблённым и грубым. Чтобы снять чары с себя и слуг своего замка, ему необходимо научиться быть добрым, любить и быть любимым. ", category: category3)
        
        let opportunity3 = Opportunity(title: "Время для шопинга",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category4)
        
        let opportunity4 = Opportunity(title: "Ремонт в своей квартире",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Чтобы начать менять свою жизнь в лучшую сторону нужно сделать первый шаг. Отличная возможность начать с ремонта своей любимой комнаты.", category: category1)
        
        let opportunity5 = Opportunity(title: "Прыжок с парашютом",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Посмотри своим страхам прямо в глаза! Сделай всего один шаг вперед, когда под ногами нет твердой опоры.", category: category2)
        
        let opportunity6 = Opportunity(title: "Красавица и чудовище",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Обозлённая Волшебница превратила принца Адама в отвратительное чудовище за то, что тот был злым, самовлюблённым и грубым. Чтобы снять чары с себя и слуг своего замка, ему необходимо научиться быть добрым, любить и быть любимым. ", category: category3)
        
        let opportunity7 = Opportunity(title: "Время для шопинга",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Сегодня лучший день для покупок! Спешите на распродажу в ЦУМ и получите скидки на все покупки свыше 5 000 руб.", category: category4)
        
        let opportunity8 = Opportunity(title: "Ремонт в своей квартире",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Чтобы начать менять свою жизнь в лучшую сторону нужно сделать первый шаг. Отличная возможность начать с ремонта своей любимой комнаты.", category: category1)
        
        let opportunity9 = Opportunity(title: "Ремонт в своей квартире",
                                       backgroundURL: "https://s3.amazonaws.com/uploads.hipchat.com/82114/593081/ztu1PG7eKbDFs6t/Bitmap%403x.png",
                                       desc: "Чтобы начать менять свою жизнь в лучшую сторону нужно сделать первый шаг. Отличная возможность начать с ремонта своей любимой комнаты.", category: category1)
        
        
        
        
        let step1 = Step(title: "Новый вкус, ощущение или впечателение", order: 1, state: .missed)
        let step2 = Step(title: "Новый вкус, ощущение или впечателение", order: 2, state: .missed)
        let step3 = Step(title: "Новый вкус, ощущение или впечателение", order: 3, state: .missed)
        step1.opportunities.append(objectsIn: [opportunity1, opportunity2, opportunity3])
        step2.opportunities.append(objectsIn: [opportunity4, opportunity5, opportunity6])
        step3.opportunities.append(objectsIn: [opportunity7, opportunity8, opportunity9])
        
        let realm = try! Realm()
        realm.beginWrite()
        realm.add([step1, step2, step3])
        try! realm.commitWrite()
        
    }
    
}
