

class Settings {
  String theme = 'dracula';

  // Tạo duy nhất một instance của Settings.
  static final Settings _instance = Settings._internal();

  // Constructor private.
  // Chỉ class Settings mới có thể gọi constructor này.
  Settings._internal();

  // Factory constructor.
  // Mỗi lần gọi Settings(), chương trình sẽ trả về cùng một _instance.
  factory Settings() {
    return _instance;
  }
}