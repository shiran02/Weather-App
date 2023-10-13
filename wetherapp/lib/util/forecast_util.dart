import 'package:intl/intl.dart';

class Util{

  // app Id
  static String appId = "ed60fcfbd110ee65c7150605ea8aceea";

  static String getFormattedDate(DateTime datetime){

      return DateFormat("EEEE, MMM d, ''yy" ).format(datetime);
  }
}