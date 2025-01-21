//
//  PopularUseCase.swift
//  MovieApp
//
//  Created by Kenan on 13.01.25.
//

protocol PopularUseCase {
    func getTrendingMovie( completion: @escaping ( PopularDTO? , String? ) -> Void)
        
    
}
