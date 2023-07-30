//
//  ComicTableViewCell.swift
//  desafio
//
//  Created by Caio Cardozo on 28/07/23.
//

import UIKit
import SnapKit

final class ComicTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var comicImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
     //   image.backgroundColor = .gray.withAlphaComponent(0.5)
        image.image = nil
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
        
        self.accessoryType  = .none
        self.selectionStyle = .none
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        self.backgroundColor = .clear
        contentView.addSubview(comicImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoLabel)
    }
    
    private func addConstraints() {
        comicImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(8)
            make.width.equalTo(130)
            make.height.equalTo(100)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(comicImageView.snp.top)
            make.leading.equalTo(comicImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(16)
        }
        infoLabel.setContentHuggingPriority(.init(rawValue: 250), for: .vertical)
        infoLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).inset(-8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(comicImageView.snp.bottom)
        }
        
    }
    
    func setup(comicItem: ComicItem) {
        titleLabel.text = comicItem.title
        infoLabel.text = comicItem.description
        if let path = comicItem.imagePath, let url = URL(string: path) {
            downloadImage(from: url, completion: { image in
                DispatchQueue.main.async {
                    self.comicImageView.image = image
                }
            })
        }
    }
}

extension ComicTableViewCell {
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        }
        
        task.resume()
    }
}
