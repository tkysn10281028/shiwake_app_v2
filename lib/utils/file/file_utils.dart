import 'dart:io';
import '../../database/database_helper.dart';

class FileUtils {
  static Future<void> getFileSize() async {
    await DatabaseHelper.instance.database;
    var file = File(
        '/data/user/0/com.app.shiwake.shiwake_app_v2/databases/shiwake_database_v2.db');
    var fileLength = await file.length();
    var fileLengthMb = fileLength / 1024 / 1024;
    print("Database file size:$fileLength($fileLengthMb MB)");
  }
}
