//
//  ViewController.swift
//  DZ43
//
//  Created by merim kasenova on 24/4/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var products = [Products]()
    
    private lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reusedId)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        fent()
        
    }
    private func fetchCoctailsData() async throws -> [Products]{
        products = try await Network.shared.fethData().products
        DispatchQueue.main.async {
            self.productsCollectionView.reloadData()
        }
        return products
    }
    private func fent(){
        Task {
            do {
                let drink = try await fetchCoctailsData()
                print(products)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    private func setupSubviews() {
        view.addSubview(productsCollectionView)
        productsCollectionView.snp.makeConstraints {make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reusedId, for: indexPath) as! ProductCell
        cell.fill(product: products[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 20, height: 280)
    }
}
    




