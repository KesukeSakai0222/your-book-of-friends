// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FriendsCompanion extends UpdateCompanion<Friend> {
  final Value<int> id;
  final Value<String?> memo;
  final Value<DateTime?> birthday;
  final Value<bool> isNotify;
  final Value<String?> location;
  const FriendsCompanion({
    this.id = const Value.absent(),
    this.memo = const Value.absent(),
    this.birthday = const Value.absent(),
    this.isNotify = const Value.absent(),
    this.location = const Value.absent(),
  });
  FriendsCompanion.insert({
    this.id = const Value.absent(),
    this.memo = const Value.absent(),
    this.birthday = const Value.absent(),
    this.isNotify = const Value.absent(),
    this.location = const Value.absent(),
  });
  static Insertable<Friend> custom({
    Expression<int>? id,
    Expression<String?>? memo,
    Expression<DateTime?>? birthday,
    Expression<bool>? isNotify,
    Expression<String?>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memo != null) 'memo': memo,
      if (birthday != null) 'birthday': birthday,
      if (isNotify != null) 'is_notify': isNotify,
      if (location != null) 'location': location,
    });
  }

  FriendsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? memo,
      Value<DateTime?>? birthday,
      Value<bool>? isNotify,
      Value<String?>? location}) {
    return FriendsCompanion(
      id: id ?? this.id,
      memo: memo ?? this.memo,
      birthday: birthday ?? this.birthday,
      isNotify: isNotify ?? this.isNotify,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String?>(memo.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime?>(birthday.value);
    }
    if (isNotify.present) {
      map['is_notify'] = Variable<bool>(isNotify.value);
    }
    if (location.present) {
      map['location'] = Variable<String?>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendsCompanion(')
          ..write('id: $id, ')
          ..write('memo: $memo, ')
          ..write('birthday: $birthday, ')
          ..write('isNotify: $isNotify, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class $FriendsTable extends Friends with TableInfo<$FriendsTable, Friend> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String?> memo = GeneratedColumn<String?>(
      'memo', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _birthdayMeta = const VerificationMeta('birthday');
  @override
  late final GeneratedColumn<DateTime?> birthday = GeneratedColumn<DateTime?>(
      'birthday', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isNotifyMeta = const VerificationMeta('isNotify');
  @override
  late final GeneratedColumn<bool?> isNotify = GeneratedColumn<bool?>(
      'is_notify', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_notify IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, memo, birthday, isNotify, location];
  @override
  String get aliasedName => _alias ?? 'friends';
  @override
  String get actualTableName => 'friends';
  @override
  VerificationContext validateIntegrity(Insertable<Friend> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    }
    if (data.containsKey('is_notify')) {
      context.handle(_isNotifyMeta,
          isNotify.isAcceptableOrUnknown(data['is_notify']!, _isNotifyMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Friend map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Friend(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}memo']),
      const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birthday']),
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_notify'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
    );
  }

  @override
  $FriendsTable createAlias(String alias) {
    return $FriendsTable(attachedDatabase, alias);
  }
}

class NamesCompanion extends UpdateCompanion<Name> {
  final Value<int> id;
  final Value<int> friendId;
  final Value<String> name;
  final Value<bool> isMain;
  const NamesCompanion({
    this.id = const Value.absent(),
    this.friendId = const Value.absent(),
    this.name = const Value.absent(),
    this.isMain = const Value.absent(),
  });
  NamesCompanion.insert({
    this.id = const Value.absent(),
    required int friendId,
    required String name,
    this.isMain = const Value.absent(),
  })  : friendId = Value(friendId),
        name = Value(name);
  static Insertable<Name> custom({
    Expression<int>? id,
    Expression<int>? friendId,
    Expression<String>? name,
    Expression<bool>? isMain,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (friendId != null) 'friend_id': friendId,
      if (name != null) 'name': name,
      if (isMain != null) 'is_main': isMain,
    });
  }

  NamesCompanion copyWith(
      {Value<int>? id,
      Value<int>? friendId,
      Value<String>? name,
      Value<bool>? isMain}) {
    return NamesCompanion(
      id: id ?? this.id,
      friendId: friendId ?? this.friendId,
      name: name ?? this.name,
      isMain: isMain ?? this.isMain,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isMain.present) {
      map['is_main'] = Variable<bool>(isMain.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NamesCompanion(')
          ..write('id: $id, ')
          ..write('friendId: $friendId, ')
          ..write('name: $name, ')
          ..write('isMain: $isMain')
          ..write(')'))
        .toString();
  }
}

class $NamesTable extends Names with TableInfo<$NamesTable, Name> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NamesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _friendIdMeta = const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int?> friendId = GeneratedColumn<int?>(
      'friend_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES friends(id)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isMainMeta = const VerificationMeta('isMain');
  @override
  late final GeneratedColumn<bool?> isMain = GeneratedColumn<bool?>(
      'is_main', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_main IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, friendId, name, isMain];
  @override
  String get aliasedName => _alias ?? 'names';
  @override
  String get actualTableName => 'names';
  @override
  VerificationContext validateIntegrity(Insertable<Name> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_main')) {
      context.handle(_isMainMeta,
          isMain.isAcceptableOrUnknown(data['is_main']!, _isMainMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Name map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Name(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}friend_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_main'])!,
    );
  }

  @override
  $NamesTable createAlias(String alias) {
    return $NamesTable(attachedDatabase, alias);
  }
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<int> friendId;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<String?> memo;
  final Value<int> amount;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.friendId = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.memo = const Value.absent(),
    this.amount = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required int friendId,
    required String name,
    required DateTime date,
    this.memo = const Value.absent(),
    required int amount,
  })  : friendId = Value(friendId),
        name = Value(name),
        date = Value(date),
        amount = Value(amount);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<int>? friendId,
    Expression<String>? name,
    Expression<DateTime>? date,
    Expression<String?>? memo,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (friendId != null) 'friend_id': friendId,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (memo != null) 'memo': memo,
      if (amount != null) 'amount': amount,
    });
  }

  EventsCompanion copyWith(
      {Value<int>? id,
      Value<int>? friendId,
      Value<String>? name,
      Value<DateTime>? date,
      Value<String?>? memo,
      Value<int>? amount}) {
    return EventsCompanion(
      id: id ?? this.id,
      friendId: friendId ?? this.friendId,
      name: name ?? this.name,
      date: date ?? this.date,
      memo: memo ?? this.memo,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String?>(memo.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('friendId: $friendId, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('memo: $memo, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _friendIdMeta = const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int?> friendId = GeneratedColumn<int?>(
      'friend_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES friends(id)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String?> memo = GeneratedColumn<String?>(
      'memo', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int?> amount = GeneratedColumn<int?>(
      'amount', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, friendId, name, date, memo, amount];
  @override
  String get aliasedName => _alias ?? 'events';
  @override
  String get actualTableName => 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}friend_id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}memo']),
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
  })  : name = Value(name),
        color = Value(color);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  TagsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? color}) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String?> color = GeneratedColumn<String?>(
      'color', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, color];
  @override
  String get aliasedName => _alias ?? 'tags';
  @override
  String get actualTableName => 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color'])!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class FriendTagsCompanion extends UpdateCompanion<FriendTag> {
  final Value<int> id;
  final Value<int> friendId;
  final Value<int> tagId;
  const FriendTagsCompanion({
    this.id = const Value.absent(),
    this.friendId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  FriendTagsCompanion.insert({
    this.id = const Value.absent(),
    required int friendId,
    required int tagId,
  })  : friendId = Value(friendId),
        tagId = Value(tagId);
  static Insertable<FriendTag> custom({
    Expression<int>? id,
    Expression<int>? friendId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (friendId != null) 'friend_id': friendId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  FriendTagsCompanion copyWith(
      {Value<int>? id, Value<int>? friendId, Value<int>? tagId}) {
    return FriendTagsCompanion(
      id: id ?? this.id,
      friendId: friendId ?? this.friendId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendTagsCompanion(')
          ..write('id: $id, ')
          ..write('friendId: $friendId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $FriendTagsTable extends FriendTags
    with TableInfo<$FriendTagsTable, FriendTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendTagsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _friendIdMeta = const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int?> friendId = GeneratedColumn<int?>(
      'friend_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES friends(id)');
  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int?> tagId = GeneratedColumn<int?>(
      'tag_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES tags(id)');
  @override
  List<GeneratedColumn> get $columns => [id, friendId, tagId];
  @override
  String get aliasedName => _alias ?? 'friend_tags';
  @override
  String get actualTableName => 'friend_tags';
  @override
  VerificationContext validateIntegrity(Insertable<FriendTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FriendTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FriendTag(
      const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}friend_id'])!,
      const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $FriendTagsTable createAlias(String alias) {
    return $FriendTagsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FriendsTable friends = $FriendsTable(this);
  late final $NamesTable names = $NamesTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $FriendTagsTable friendTags = $FriendTagsTable(this);
  late final FriendsDao friendsDao = FriendsDao(this as MyDatabase);
  late final NamesDao namesDao = NamesDao(this as MyDatabase);
  late final EventsDao eventsDao = EventsDao(this as MyDatabase);
  late final TagsDao tagsDao = TagsDao(this as MyDatabase);
  late final FriendTagsDao friendTagsDao = FriendTagsDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [friends, names, events, tags, friendTags];
}
