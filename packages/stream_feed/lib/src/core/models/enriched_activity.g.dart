// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enriched_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrichedActivity<A, Ob, T> _$EnrichedActivityFromJson<A, Ob, T>(
  Map json,
  A Function(Object? json) fromJsonA,
  Ob Function(Object? json) fromJsonOb,
  T Function(Object? json) fromJsonT,
) {
  return EnrichedActivity<A, Ob, T>(
    id: json['id'] as String?,
    actor: _$nullableGenericFromJson(json['actor'], fromJsonA),
    verb: json['verb'] as String?,
    object: _$nullableGenericFromJson(json['object'], fromJsonOb),
    foreignId: json['foreign_id'] as String?,
    target: _$nullableGenericFromJson(json['target'], fromJsonT),
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    origin: EnrichableField.deserialize(json['origin']),
    to: (json['to'] as List<dynamic>?)?.map((e) => e as String).toList(),
    score: (json['score'] as num?)?.toDouble(),
    analytics: (json['analytics'] as Map?)?.map(
      (k, e) => MapEntry(k as String, e as Object),
    ),
    extraContext: (json['extra_context'] as Map?)?.map(
      (k, e) => MapEntry(k as String, e as Object),
    ),
    extraData: (json['extra_data'] as Map?)?.map(
      (k, e) => MapEntry(k as String, e as Object),
    ),
    reactionCounts: (json['reaction_counts'] as Map?)?.map(
      (k, e) => MapEntry(k as String, e as int),
    ),
    ownReactions: (json['own_reactions'] as Map?)?.map(
      (k, e) => MapEntry(
          k as String,
          (e as List<dynamic>)
              .map(
                  (e) => Reaction.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList()),
    ),
    latestReactions: (json['latest_reactions'] as Map?)?.map(
      (k, e) => MapEntry(
          k as String,
          (e as List<dynamic>)
              .map(
                  (e) => Reaction.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList()),
    ),
  );
}

Map<String, dynamic> _$EnrichedActivityToJson<A, Ob, T>(
  EnrichedActivity<A, Ob, T> instance,
  Object? Function(A value) toJsonA,
  Object? Function(Ob value) toJsonOb,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', readonly(instance.id));
  val['actor'] = _$nullableGenericToJson(instance.actor, toJsonA);
  val['verb'] = instance.verb;
  val['object'] = _$nullableGenericToJson(instance.object, toJsonOb);
  writeNotNull('foreign_id', instance.foreignId);
  val['target'] = _$nullableGenericToJson(instance.target, toJsonT);
  writeNotNull('time', instance.time?.toIso8601String());
  writeNotNull('origin', readonly(instance.origin));
  writeNotNull('to', readonly(instance.to));
  writeNotNull('score', readonly(instance.score));
  writeNotNull('analytics', readonly(instance.analytics));
  writeNotNull('extra_context', readonly(instance.extraContext));
  writeNotNull('reaction_counts', readonly(instance.reactionCounts));
  writeNotNull('own_reactions', readonly(instance.ownReactions));
  writeNotNull('latest_reactions', readonly(instance.latestReactions));
  writeNotNull('extra_data', instance.extraData);
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
