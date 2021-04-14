import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stream_feed_dart/src/client/flat_feed.dart';
import 'package:stream_feed_dart/src/client/notification_feed.dart';
import 'package:stream_feed_dart/src/core/http/token.dart';
import 'package:stream_feed_dart/src/core/models/activity.dart';
import 'package:stream_feed_dart/src/core/models/activity_marker.dart';
import 'package:stream_feed_dart/src/core/models/enriched_activity.dart';
import 'package:stream_feed_dart/src/core/models/enrichment_flags.dart';
import 'package:stream_feed_dart/src/core/models/feed_id.dart';
import 'package:stream_feed_dart/src/core/models/filter.dart';
import 'package:stream_feed_dart/src/core/util/default.dart';
import 'package:test/test.dart';

import 'mock.dart';
import 'utils.dart';

main() {
  group('FlatFeed Client', () {
    final api = MockFeedApi();
    final feedId = FeedId('slug', 'userId');
    const token = Token('dummyToken');
    final client = FlatFeed(feedId, api, userToken: token);

    test('getActivities', () async {
      const limit = 5;
      const offset = 0;
      const ranking = 'popularity';
      final filter =
          Filter().idGreaterThan('e561de8f-00f1-11e4-b400-0cc47a024be0');
      final options = {
        'limit': limit,
        'offset': offset,
        ...filter.params,
        'ranking': ranking
      };

      final rawActivities = [jsonFixture('activity.json')];
      when(() => api.getActivities(token, feedId, options))
          .thenAnswer((_) async => Response(
              data: {'results': rawActivities},
              requestOptions: RequestOptions(
                path: '',
              ),
              statusCode: 200));
      final activities = await client.getActivities(
          limit: limit, offset: offset, filter: filter, ranking: ranking);

      expect(
          activities,
          rawActivities
              .map((e) => Activity.fromJson(e))
              .toList(growable: false));
      verify(() => api.getActivities(token, feedId, options)).called(1);
    });

    test('getEnrichedActivities', () async {
      const limit = 5;
      const offset = 0;
      final filter =
          Filter().idGreaterThan('e561de8f-00f1-11e4-b400-0cc47a024be0');
      const ranking = 'popularity';
      final flags =
          EnrichmentFlags().withRecentReactions().withReactionCounts();
      final options = {
        'limit': limit,
        'offset': offset,
        ...filter.params,
        ...Default.marker.params,
        'ranking': ranking,
      };

      final rawActivities = [jsonFixture('enriched_activity.json')];
      when(() => api.getEnrichedActivities(token, feedId, options))
          .thenAnswer((_) async => Response(
              data: {'results': rawActivities},
              requestOptions: RequestOptions(
                path: '',
              ),
              statusCode: 200));
      final activities = await client.getEnrichedActivities(
          limit: limit,
          offset: offset,
          filter: filter,
          flags: flags,
          ranking: ranking);

      expect(
          activities,
          rawActivities
              .map((e) => EnrichedActivity.fromJson(e))
              .toList(growable: false));
      verify(() => api.getEnrichedActivities(token, feedId, options)).called(1);
    });
  });
}
