import 'package:flutter/material.dart';
import 'package:stream_feed_flutter/src/typedefs.dart';
import 'package:stream_feed_flutter/src/user_bar.dart';
import 'package:stream_feed_flutter/stream_feed_flutter.dart';

class ActivityHeader extends StatelessWidget {
  const ActivityHeader(
      {Key? key,
      required this.activity,
      this.onUserTap,
      this.activityKind = 'like'}); //TODO: enum that thing
  final EnrichedActivity activity;
  final OnUserTap? onUserTap;

  ///Wether you want to display like activities or repost activities
  final String activityKind;
  @override
  Widget build(BuildContext context) {
    final serializedActor = EnrichableField.serialize(activity.actor);//TODO: ugly
    final user =
        User.fromJson(serializedActor as Map<String, dynamic>); //TODO: ugly
    return UserBar(
        user: user,
        onUserTap: onUserTap,
        timestamp: activity.time!,
        kind: activityKind); //TODO: display what instead of null timestamp?
  }
}
