//
//  ImageViewExtension.swift
//  AssesmentPoke
//
//  Created by Kiasha Rangasamy on 2024/07/25.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self? .image = image
                }
            }
        }
    }
}
