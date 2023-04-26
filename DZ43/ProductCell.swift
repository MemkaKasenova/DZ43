//
//  ProductCell.swift
//  DZ43
//
//  Created by merim kasenova on 24/4/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class ProductCell: UICollectionViewCell {
    
    static var reusedId = "product_cell"
    
    private lazy var productTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    private lazy var productDescriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 4
        return view
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.textColor = .red
        return view
    }()
    private lazy var productThumbnailView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            return view
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 10
       
        setupSubviews()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(product: Products) {
        productThumbnailView.kf.setImage(with: URL(string: product.thumbnail))
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "\(product.price)"
    }
    
    func setupSubviews() {
       addSubview(productThumbnailView)
        productThumbnailView.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(200)
        }
        addSubview(productTitleLabel)
        productTitleLabel.snp.makeConstraints {make in
            make.top.equalTo(productThumbnailView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(8)
        }
//        addSubview(productDescriptionLabel)
//        productDescriptionLabel.snp.makeConstraints {make in
//            make.top.equalTo(productTitleLabel.snp.bottom).offset(8)
//            make.left.equalToSuperview().offset(10)
//            make.right.equalToSuperview().offset(-10)
//            make.bottom.equalToSuperview().offset(-10)
//        }
        
        addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints {make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(20)
            
        }
    }
}
