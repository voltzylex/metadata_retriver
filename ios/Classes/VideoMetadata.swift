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
        // Check if duration is not nil before getting seconds
                if asset.duration != CMTime.zero {
                    let durationInSeconds = CMTimeGetSeconds(asset.duration)
                    metadata["duration"] = durationInSeconds
                } else {
                    print("Failed to retrieve duration.")
                }
       
        
        for data in asset.commonMetadata {
            
            
            if data.commonKey == .commonKeyTitle {
                metadata["title"] = data.value
            }
            if data.commonKey == .commonKeyCreationDate {
                metadata["date_time"] = data.value
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
