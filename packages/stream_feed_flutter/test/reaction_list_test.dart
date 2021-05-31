import 'package:flutter/material.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stream_feed_flutter/stream_feed_flutter.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

main() {
  testWidgets('CommentItem', (tester) async {
    await mockNetworkImages(() async {
      var pressedHashtags = <String?>[];
      var pressedMentions = <String?>[];
      var pressedReactions = <Reaction?>[];

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: ReactionList(
          onReactionTap: (reaction) => pressedReactions.add(reaction),
          onMentionTap: (mention) => pressedMentions.add(mention),
          onHashtagTap: (hashtag) => pressedHashtags.add(hashtag),
          reactions: [
            Reaction(
              createdAt: DateTime.now(),
              kind: 'comment',
              data: {
                'text':
                    'Woohoo Snowboarding is awesome! #snowboarding #winter @sacha',
              },
            ),
            Reaction(
              createdAt: DateTime.now(),
              kind: 'comment',
              data: {
                'text': 'Ikr! #vacations #winter @sahil',
              },
            ),
          ],
        ),
      )));

      final avatar = find.byType(Avatar);

      expect(avatar, findsNWidgets(2));
      final richtexts = tester.widgetList<Text>(find.byType(Text));

      expect(richtexts.toList().map((e) => e.data), [
        'a moment ago',
        'Woohoo ',
        'Snowboarding ',
        'is ',
        'awesome! ',
        ' #snowboarding',
        ' #winter',
        ' @sacha',
        'a moment ago',
        'Ikr! ',
        ' #vacations',
        ' #winter',
        ' @sahil'
      ]);

      await tester.tap(find.widgetWithText(InkWell, ' #winter').first);
      await tester.tap(find.widgetWithText(InkWell, ' @sacha').first);
      await tester.tap(find.widgetWithText(InkWell, ' #vacations').first);
      await tester.tap(find.widgetWithText(InkWell, ' @sahil').first);
      expect(pressedHashtags, ['winter', 'vacations']);
      expect(pressedMentions, ['sacha', 'sahil']);
    });
  });
}