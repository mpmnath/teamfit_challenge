// This class is used to format text in the app.

class TextFormatter {
  //Description: Limited to two lines.
  static String limitToTwoLines(String text) {
    if (text.length > 50) {
      return '${text.substring(0, 50)}...';
    }
    return text;
  }
}
