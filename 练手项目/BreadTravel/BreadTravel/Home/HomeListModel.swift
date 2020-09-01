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

struct HomeElementData: Convertible {
    var cover_image: String = ""
    var cover_image_default: String = ""
    var first_day: String = ""
    var day_count: String = ""
    var view_count: Int = 0
    var popular_place_str: String = ""
    var name: String = ""
    
    
    var user: HomeElementUser!
}

struct HomeListItem: Convertible {
    var type: Int?
    var data: [HomeElementData]? = nil
}


struct HomeListData: Convertible {
    var elements: [HomeListItem]? = nil
    var next_start: Int!
    
}

struct HomeListModel: Convertible {
    var data: HomeListData? = nil
    
}


