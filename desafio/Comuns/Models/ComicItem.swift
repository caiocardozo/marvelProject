struct ComicItem: Codable {
    let title: String
    let description: String?
    let thumbnail: PhotoComic
    
    var imagePath: String {
        return thumbnail.pathImg + "." + thumbnail.extensionImg
    }
}
