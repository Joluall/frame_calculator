import 'package:date_format/date_format.dart';
import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

//To Post Helpers

String setString(String a) {
  String c = "";
  String b = "null";

  if (a == c) {
    return null;
  } else if (a == b) {
    return null;
  } else {
    return a;
  }
}

int setInt(String a) {
  String b = "null";
  String c = "";

  if (a == c) {
    return null;
  } else if (a == b) {
    return null;
  } else {
    return int.parse(a);
  }
}

double setDouble(String a) {
  String c = "";
  String b = "null";

  if (a == c) {
    return null;
  } else if (a == b) {
    return null;
  } else {
    return double.parse(a);
  }
}

String setStringDateEn(DateTime a) {
  String b = "${formatDate(a, [yyyy, '-', mm, '-', dd])}";
  return b;
}

String setStringTime24(DateTime a) {
  String b = DateFormat.Hms().format(a);
  return b;
}

//To Show Helpers

String setText(String a) {
  print(a);
  String b = "null";
  String c = "";

  if (a == b) {
    return c;
  } else if (a == null) {
    return c;
  } else {
    return a;
  }
}

String setTextDecimalNull(String a) {
  String j = "";
  String b = "null";
  String c;

  if (a == b) {
    c = j;
    return c;
  } else if (a == j) {
    c = j;
    return c;
  } else {
    Decimal f = Decimal.parse(a);
    String g = f.toStringAsFixed(2);
    return g;
  }
}

String setTextDecimalNotNull(String a) {
  Decimal f = Decimal.parse(a);
  String g = f.toStringAsFixed(2);
  return g;
}

String setStringDateEs(DateTime a) {
  String b = "${formatDate(a, [dd, '-', mm, '-', yyyy])}";
  return b;
}

String setStringDateinWords(DateTime a) {
  initializeDateFormatting();
  String wd = DateFormat("EEEE", "es-ES").format(a);
  String d = DateFormat("d", "es-ES").format(a);
  String m = DateFormat("MMMM", "es-ES").format(a);
  String y = DateFormat("yyyy", "es-ES").format(a);
  String df = "$wd, $d de $m de $y";
  String dfM = toBeginningOfSentenceCase(df);
  return dfM;
}

String setStringTimeAMPM(String a) {
  initializeDateFormatting();
  DateTime date = DateFormat('Hms').parse(a);
  String b = DateFormat('h:mm a', 'es-ES').format(date);
  return b;
}

Decimal setDecimal(String d) {
  Decimal b = Decimal.parse(d);
  return b;
}

String setMoneyString(String a) {
  String b = "null";
  String c;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  if (a == b) {
    c = "0";
  } else {
    c = a;
  }

  Decimal f = Decimal.parse(c);

  String g = oCcy.format(double.parse(f.toStringAsFixed(2)));

  String h = "L$g";

  return h;
}

String setPercentageString(String a) {
  String b = "null";
  String c;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  if (a == b) {
    c = "0";
  } else {
    c = a;
  }

  Decimal f = Decimal.parse(c);

  String g = oCcy.format(double.parse(f.toStringAsFixed(2)));

  String h = "$g%";

  return h;
}
