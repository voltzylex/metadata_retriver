package com.example.metadata_retriver;


import android.media.MediaMetadata;
import android.media.MediaMetadataRetriever;

import java.io.File;
import java.util.HashMap;

import android.media.MediaMetadataRetriever;
import java.util.HashMap;

public class VideoMetadata {
    public HashMap<String, String> getMetadata(String videoPath) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(videoPath);
            String title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE);
            String artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST);
            String album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM);
            String creationTime = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE);
            String duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
            String location = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_LOCATION);
            HashMap<String, String> metadata = new HashMap<>();
            metadata.put("title", title);
            metadata.put("artist", artist);
            metadata.put("album", album);
            metadata.put("date_time", creationTime);
            metadata.put("duration", duration);
            metadata.put("location", location);
            return metadata;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

