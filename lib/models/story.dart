import 'package:flutter/material.dart';
import '../pages/story.dart';

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final User1 user;

  const Story({
    @required this.url,
    @required this.media,
    @required this.duration,
    @required this.user,
  });
}