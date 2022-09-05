import 'package:logger/logger.dart';

class Logging {
  static Logger newLogger() {
    return Logger(
      printer: PrettyPrinter(
        colors: true,
      ),
    );
  }
}