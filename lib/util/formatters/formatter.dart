import 'package:intl/intl.dart';

class AppFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd.MM.yyyy').format(date); // Uses Turkish date format
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'tr_TR', symbol: '₺').format(amount); // Uses Turkish Lira symbol (₺)
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(+90) ${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}'; // Adds country code (+90)
    } else if (phoneNumber.length == 11) {
      return '(0 ${phoneNumber.substring(0, 1)}) ${phoneNumber.substring(1, 4)} ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}'; // Handles 11-digit numbers
    } else {
      return 'Invalid phone number'; // Added validation for invalid lengths
    }
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString(); // Added return statement
  }

  
  /// Bu fonksiyon, uluslararası telefon numaralarını formatlar ve 
  /// geçersiz bir numara girilirse hata mesajı döndürür.
  static String formatInternationalPhoneNumber(String phoneNumber) {
    String? formattedNumber = internationalFormatPhoneNumber(phoneNumber);
    if (formattedNumber.isEmpty) {
      throw const FormatException('Geçersiz Telefon Numarası');
    }
    return formattedNumber;
  }
}


