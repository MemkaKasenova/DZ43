//
//  Product.swift
//  DZ43
//
//  Created by merim kasenova on 24/4/23.
//

import Foundation

struct Product:Decodable{
    var products = [Products]()
}
struct Products:Decodable{
    var title:String
    var thumbnail: String
    var description:String
    var price:Int
}
