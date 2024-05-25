extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension StringToFormattedString on String {
  String toFormattedId() {
    // Parse the string to an integer to ensure it's a valid number
    int value = int.tryParse(this) ?? 0;

    // Convert the integer back to a string
    String stringValue = value.toString();

    // If the length of the string is less than 3, pad with zeros
    if (stringValue.length < 3) {
      stringValue = stringValue.padLeft(3, '0');
    }

    // Return the formatted string with '#' prefix
    return '#$stringValue';
  }
}