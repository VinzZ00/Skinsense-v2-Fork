//
//  AppConstants.swift
//  Skinsense
//
//  Created by Rainer Regan on 22/11/23.
//

import Foundation

class AppConstants {
    public static var categoryGroups : [CategoryGroup] = [
        CategoryGroup(id: "cleanser",name: "Cleanser", categories: [
            "Face cleanser"
        ], icon: "FacialFoam"),
        CategoryGroup(id: "toner",name: "Toner", categories: [
            "Toner"
        ], icon: "Toner"),
        CategoryGroup(id: "serum",name: "Serum", categories: [
            "Serum"
        ], icon: "Serum"),
        CategoryGroup(id: "moisturizer",name: "Moisturizer", categories: [
            "General moisturizer",
            "Lip moisturizer",
            "Eye moisturizer",
            "Night moisturizer",
            "Day moisturizer",
        ], icon: "Moisturizer"),
        CategoryGroup(id: "exfoliator",name: "Exfoliator", categories: [
            "Exfoliator"
        ], icon: "Exfo"),
        CategoryGroup(id: "sunscreen",name: "Sunscreen", categories: [
            "Sunscreen",
        ], icon: "Sunscreen"),
        CategoryGroup(id: "facemask",name: "Face mask", categories: [
            "Sheet mask",
            "Overnight mask",
            "Wash off mask",
            "Lip mask",
            "Eye mask",
        ], icon: "faceMask"),
        CategoryGroup(id: "others",name: "Others", categories: [
            "Tool",
            "Lip makeup",
            "Bath & body",
            "Tanning",
            "Essence",
            "Makeup remover",
            "Shampoo",
            "Other haircare",
            "Conditioner",
            "Makeup applicator",
            "Face makeup",
            "Fragrance",
            "Cheek makeup",
            "Eye makeup",
            "Facial treatment",
            "Nail care",
            "Oil",
            "Emulsion",
            "Hand care",
            "Other",
            "False eyelash",
        ], icon: "Others")
    ]
}
