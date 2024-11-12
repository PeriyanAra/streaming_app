import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:music_streaming_app/data/database/initial_scripts.dart';
import 'package:music_streaming_app/data/database/migrations_scripts.dart';
import 'package:sentry/sentry.dart';
import 'package:sqflite/sqflite.dart';

abstract final class DatabaseCreator {
  static Future<Database> initDatabase() async {
    final commwellDbPath = await getDatabasePath(dbName: 'commwell_db');

    final database = await openDatabase(
      '$commwellDbPath/db.db',
      version: migrationsScripts().length + 1,
      onCreate: (db, version) async {
        await executeInitialization(db, version);
      },
    );

    return database;
  }

  static Future<String> getDatabasePath({required String dbName}) async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$dbName';
    final dbExists = Directory(path).existsSync();

    if (!dbExists) {
      await Directory(path).create(recursive: true);
    }

    return path;
  }

  static Future<void> executeInitialization(Database db, int version) async {
    initialScripts().forEach((script) async {
      await db.execute(script);
    });

    migrationsScripts().forEach(
      (script) async {
        try {
          await db.execute(script);
        } catch (e) {
          await Sentry.captureException(e);

          debugPrint('Database Error: $e');
        }
      },
    );
  }
}
