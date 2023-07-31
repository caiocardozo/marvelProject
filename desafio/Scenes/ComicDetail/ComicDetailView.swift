//
//  ComicDetailView.swift
//  desafio
//
//  Created by Caio Cardozo on 30/07/23.
//

import UIKit
import SnapKit

final class ComicDetailView: BaseView {
    
    private lazy var comicImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = nil
        return image
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    private lazy var infoLabel: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.textAlignment = .justified
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .lightGray
        return textView
    }()
    override func addViews() {
        self.backgroundColor = .white
        self.addSubview(comicImageView)
        self.addSubview(titleLabel)
        self.addSubview(infoLabel)
    }
    override func addConstraints() {
        comicImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(260)
            make.height.equalTo(200)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(comicImageView.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        infoLabel.setContentHuggingPriority(.init(rawValue: 250), for: .vertical)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    func setup(comicItem: ComicItem) {
        titleLabel.text = comicItem.title
        if comicItem.description != "" {
            infoLabel.text = comicItem.description
        } else {
            infoLabel.text = "Sem descrição"
        }
        if let url = URL(string: comicItem.imagePath) {
            downloadImage(from: url, completion: { image in
                DispatchQueue.main.async {
                    self.comicImageView.image = image
                }
            })
        }
    }
}
// MARK: - Extension
extension ComicDetailView {
    private func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
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
