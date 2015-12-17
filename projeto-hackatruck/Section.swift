//
//  Section.swift
//  projeto-hackatruck
//
//  Created by Student on 17/12/15.
//  Copyright © 2015 organization. All rights reserved.
//


struct Product {
    let name: String
}

struct Section {
    let name: String
    let beaconMinor: Int
    let products: [Product]
    
    init(name: String, beaconMinor: Int, products: [Product]) {
        self.name = name
        self.beaconMinor = beaconMinor
        self.products = products
    }
}


class SectionRepository {
    var sections: [Section]
    
    init(sections: [Section]) {
        self.sections = sections
    }
    
    func getForBeaconMinor(beaconMinor: Int) -> Section? {
        for section in self.sections {
            if section.beaconMinor == beaconMinor {
                return section
            }
        }
        
        return nil
    }
}

let cleanProductList = [Product(name: "Omo"), Product(name: "Tay"), Product(name: "Detergente"), Product(name: "Amaciante")]

let chocolateProductList = [Product(name: "Lacta"), Product(name: "M&M's"), Product(name: "Kit Kat"), Product(name: "Hersheys"), Product(name: "Chokito 50 Kg"), Product(name: "Ferrero Rocher")]

let foodProductList = [Product(name: "Arroz"), Product(name: "Açúcar"), Product(name: "Sal"), Product(name: "Feijão")]

let cleanSection = Section(name: "Limpeza", beaconMinor: 42295, products: cleanProductList)

let chocolateSection = Section(name: "Chocolates", beaconMinor: 65289, products: chocolateProductList)

let foodSection = Section(name: "Mantimentos", beaconMinor: 5953, products: foodProductList)

var sectionRepository = SectionRepository(sections: [cleanSection, chocolateSection, foodSection])

