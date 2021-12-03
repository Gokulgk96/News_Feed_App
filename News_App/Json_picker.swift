//
//  Json_picker.swift
//  News_App
//
//  Created by Gokul Gopalakrishnan on 01/12/21.
//

import Foundation



struct news: Codable
{
    var articles : [Articles]
}


struct Articles: Codable
{
    var author: String?
    var title: String?
    var urlToImage: String?
    var description: String?
}

 
