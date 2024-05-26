extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension StringToFormattedString on String {
  String toFormattedId() {
    int value = int.tryParse(this) ?? 0;
    String stringValue = value.toString();

    if (stringValue.length < 3) {
      stringValue = stringValue.padLeft(3, '0');
    }

    return '#$stringValue';
  }
}