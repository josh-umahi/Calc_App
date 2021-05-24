import 'package:intl/intl.dart';

String reformatNumber(String numberToReformat) {
  List<String> numberSplit = numberToReformat.split('.');
  String integerSection = numberSplit[0];
  if (integerSection.length > 3) {
    var f = NumberFormat();
    integerSection = f.format(int.parse(integerSection.replaceAll(',', '')));
  }
  if (numberSplit.length > 1) {
    return "$integerSection.${numberSplit[1]}";
  } else {
    return integerSection;
  }
}

double extractDoubleFromString(String str){
  return double.parse(str.split(' ')[0].replaceAll(',', ''));
}

bool isInteger(num value) {
  return value is int || value == value.roundToDouble();
}
