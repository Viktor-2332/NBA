//
//  ImagesViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 04.01.2021.
//  Copyright © 2021 Виктор Ильюкевич. All rights reserved.
//

import Foundation

protocol ImageViewModelProtocol {
    var images : [String] {get}
}

class ImagesViewModel: ImageViewModelProtocol {
    var images: [String] = []
    init() {
        images = [ "https://images.unsplash.com/photo-1515523110800-9415d13b84a8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80", "https://images.unsplash.com/photo-1590227632180-80a3bf110871?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=544&q=80",  "https://images.unsplash.com/photo-1542652694-40abf526446e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80",  "https://images.unsplash.com/photo-1509027572446-af8401acfdc3?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=564&q=80",  "https://images.unsplash.com/photo-1504450758481-7338eba7524a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1049&q=80",  "https://images.unsplash.com/photo-1494199505258-5f95387f933c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1053&q=80",  "https://images.unsplash.com/photo-1503525523076-ca4aa2e47535?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=663&q=80",  "https://images.unsplash.com/photo-1531399597742-fbf70c342ece?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80",  "https://images.unsplash.com/photo-1561781019-88612f6d492c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",  "https://images.unsplash.com/photo-1518989229647-6377f907a0b2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1053&q=80"]
    }
}
