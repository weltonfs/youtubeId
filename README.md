####- Extension　

```javascript
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
```

