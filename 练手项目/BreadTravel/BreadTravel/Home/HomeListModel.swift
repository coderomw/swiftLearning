//
//  HomeListModel.swift
//  BreadTravel
//
//  Created by lei xu on 2020/8/27.
//  Copyright © 2020 lei xu. All rights reserved.
//

struct HomeElementUser: Convertible {
    var name: String = ""
    var avatar_m: String = ""
    var avatar_l: String = ""
    
}

struct HomeElementDataType4: Convertible {
    var cover_image: String = ""
    var cover_image_default: String = ""
    var first_day: String = ""
    var day_count: String = ""
    var view_count: Int = 0
    var popular_place_str: String = ""
    var name: String = ""
    
    
    var user: HomeElementUser!
}

/*type为1*/

struct HomeElementDataType1: Convertible {
    var image_url: String = ""
    var html_url: String = ""
}

//class HomeElementData<E>: NSArray,Convertible {
//    var element: E
//
//    required override init() {
//        super.init(array: [E])
//    }
//
//}

/*type为1*/
struct HomeListItem: Convertible {
    var type: Int?
    var data: Array<Any>?
}


struct HomeListData: Convertible {
    var elements: [HomeListItem]? = nil
    var next_start: Int!
    
}

struct HomeListModel: Convertible {
    var data: HomeListData? = nil
    
}


