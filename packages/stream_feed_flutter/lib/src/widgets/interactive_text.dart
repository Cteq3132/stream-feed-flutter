import 'package:flutter/material.dart';
import 'package:stream_feed_flutter/src/utils/typedefs.dart';
import 'package:stream_feed_flutter/src/utils/tag_detector.dart';

import 'package:stream_feed_flutter/src/utils/extensions.dart';
import 'package:stream_feed_flutter/src/utils/tag_detector.dart';

/// A widget used for interactive text like mentions, hashtags, and links.
class InteractiveText extends StatelessWidget {
  ///{@macro mention_callback}
  final OnMentionTap? onMentionTap;

  /// A callback that is invoked when the user clicks on a hashtag.
  final OnHashtagTap? onHashtagTap;

  ///The tagged text we parsed as hashtag, mention, or normal text.
  final TaggedText tagged;
  const InteractiveText({
    Key? key,
    required this.tagged,
    this.onHashtagTap,
    this.onMentionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (tagged.tag) {
      case Tag.normalText:
        return Text('${tagged.text} ', style: tagged.tag.style());
      case Tag.hashtag:
        return InkWell(
          onTap: () {
            onHashtagTap?.call(tagged.text.trim().replaceFirst('#', ''));
          },
          child: Text(tagged.text, style: tagged.tag.style()),
        );
      case Tag.mention:
        return InkWell(
          onTap: () {
            onMentionTap?.call(tagged.text.trim().replaceFirst('@', ''));
          },
          child: Text(tagged.text, style: tagged.tag.style()),
        );
      default:
        return Text(tagged.text, style: tagged.tag.style());
    }
  }
}