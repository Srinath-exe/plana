import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plana/constants/constants.dart';

class DateTile extends StatefulWidget {
  String title;
  DateTime? date;
  TimeOfDay? time;
  void Function()? onTap;

  DateTile({Key? key, this.date, this.time, this.onTap, required this.title})
      : super(key: key);

  @override
  _DateTileState createState() => _DateTileState();
}

class _DateTileState extends State<DateTile> {
  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Config().deviceWidth(context) * 0.4,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 8),
        child: ListTile(
          onTap: widget.onTap,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffDFDFDF), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          subtitle: Text(
            widget.title,
            style: const TextStyle(fontSize: 12),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          title: Text(
            widget.time == null
                ? DateFormat("dd/MM/yy").format(widget.date!)
                : formatTimeOfDay(widget.time!),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          trailing: const Icon(
            Icons.calendar_today_rounded,
            color: Color(0xff6A6A6A),
          ),
        ),
      ),
    );
  }
}

// Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
//           child: Text(
//             widget.time == null
//                 ? DateFormat("dd-MM-yyyy").format(widget.date!)
//                 : formatTimeOfDay(widget.time!),
//             style: const TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     );

Future<void> selectDate(
    {required DateTime date,
    required Function onSelected,
    required BuildContext context}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: date,
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.dark(
            //color of  hight light text & numbers
            primary: black,
            // color of
            onPrimary: white,
            // color of top header
            surface: white,
            // color of dates
            onSurface: black,
          ),

          // primaryColor: Colors.white,
          dialogBackgroundColor: white,
        ),
        child: child ?? Container(),
      );
    },
  );

  if (picked != null && picked != date) onSelected(picked);
}
