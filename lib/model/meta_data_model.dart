// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MetaDataModel {
  String? title;
  String? dateTime;
  String? duration;
  String? location;
  MetaDataModel({
    this.title,
    this.dateTime,
    this.duration,
    this.location,
  });

  MetaDataModel copyWith({
    String? title,
    String? dateTime,
    String? duration,
    String? location,
  }) {
    return MetaDataModel(
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      duration: duration ?? this.duration,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date_time': dateTime,
      'duration': duration,
      'location': location,
    };
  }

  factory MetaDataModel.fromMap(Map<String, dynamic> map) {
    return MetaDataModel(
      title: map['title'] != null ? map['title'] as String : null,
      dateTime: map['date_time'] != null ? map['date_time'] as String : null,
      duration: map['duration']?.toString(),
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetaDataModel.fromJson(String source) =>
      MetaDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MetaDataModel(title: $title, dateTime: $dateTime, duration: $duration, location: $location)';
  }

  @override
  bool operator ==(covariant MetaDataModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.dateTime == dateTime &&
        other.duration == duration &&
        other.location == location;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        dateTime.hashCode ^
        duration.hashCode ^
        location.hashCode;
  }
}
