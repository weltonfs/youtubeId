import UIKit

let urls: [String] = [
    "www.youtube-nocookie.com/embed/up_lNV-yoK4?rel=0",
    "http://www.youtube.com/watch?v=peFZbP64dsU",
    "http://www.youtube.com/watch?v=cKZDdG9FTKY&feature=channel",
    "http://www.youtube.com/ytscreeningroom?v=NRHVzbJVx8I",
    "http://youtu.be/6dwqZw0j_jY",
    "http://www.youtube.com/embed/nas1rJpm7wY?rel=0",
    "http://youtube.com/v/dQw4w9WgXcQ?feature=youtube_gdata_player",
    "http://youtube.com/?v=dQw4w9WgXcQ&feature=youtube_gdata_player",
    "http://www.youtube.com/watch?v=dQw4w9WgXcQ&feature=youtube_gdata_player",
    "http://youtube.com/watch?v=dQw4w9WgXcQ&feature=youtube_gdata_player",
    "http://youtu.be/dQw4w9WgXcQ?feature=youtube_gdata_playe",
    "http://youtube.com/vi/dQw4w9WgXcQ?feature=youtube_gdata_player",
    "http://youtube.com/?vi=dQw4w9WgXcQ&feature=youtube_gdata_player",
    "http://youtube.com/watch?vi=dQw4w9WgXcQ&feature=youtube_gdata_player",
    "http://www.youtube.com/user/Scobleizer#p/u/1/1p3vcRhsYGo?rel=0",
    "http://www.youtube.com/user/SilkRoadTheatre#p/a/u/2/6dwqZw0j_jY",
    "http://www.youtube.com/user/Scobleizer#p/u/1/1p3vcRhsY01",
    "1p3vcRhsY02"
]

extension String {
    var youtubeID: String? {
        if count == 11 {
            return self
        } else {
            let pattern = "((?<=(v|V|vi)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=vi=)|(?<=/u/[0-9_]/)|(?<=embed/))([\\w-]++)"
            let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: count)
            
            guard let result = regex?.firstMatch(in: self, range: range) else {
                return nil
            }

            let id = (self as NSString).substring(with: result.range)
            return id.count == 11 ? id : nil
        }
    }
}

for url in urls {
    print(url.youtubeID)
}
