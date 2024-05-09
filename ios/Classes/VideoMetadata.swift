import Foundation
import AVFoundation

class VideoMetadata {
    func getCreationDate(videoURL: URL) -> Date? {
        let asset = AVAsset(url: videoURL)
        return  asset.creationDate?.startDate
    }

    func getMetadata(videoURL: URL) -> [String: Any]? {
        let asset = AVAsset(url: videoURL)
        var metadata: [String: Any] = [:]

        for data in asset.commonMetadata {
            if data.commonKey == .commonKeyTitle {
                metadata["title"] = data.value
            }
            if data.commonKey == .commonKeyCreationDate {
                metadata["time"] = data.value
            }
            if data.commonKey == .commonKeyLocation {
                metadata["location"] = data.value
            }
            if data.commonKey == .commonKeyFormat{
                metadata["format"] = data.value
            }
            if data.commonKey == .commonKeySource{
                metadata["source"] = data.value
            }
        }
        return metadata
    }
}
