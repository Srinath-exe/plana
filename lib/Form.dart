import 'package:flutter/material.dart';
import 'package:plana/constants/constants.dart';
import 'package:plana/constants/dateTile.dart';

class PlanForm extends StatefulWidget {
  const PlanForm({super.key});

  @override
  State<PlanForm> createState() => _PlanFormState();
}

class _PlanFormState extends State<PlanForm> {
  late DateTime fromDate;
  late DateTime toDate;
  bool check = false;
  @override
  void initState() {
    fromDate = DateTime.now();
    toDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                  value: check,
                  onChanged: (onChanged) {
                    setState(() {
                      check = onChanged!;
                    });
                  }),
              const Text("Is this plan a offer/discount/Voucher?")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTile(
                  title: 'From',
                  date: fromDate,
                  onTap: () => selectDate(
                      date: fromDate,
                      context: context,
                      onSelected: (selected) {
                        setState(() {
                          fromDate = selected;
                        });
                      })),
              DateTile(
                  title: 'To',
                  date: toDate,
                  onTap: () => selectDate(
                      date: toDate,
                      context: context,
                      onSelected: (selected) {
                        setState(() {
                          toDate = selected;
                        });
                      })),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xffDFDFDF), width: 1)),
              height: Config().deviceHeight(context) * 0.25,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 20,
                  decoration: InputDecoration.collapsed(hintText: "Reason"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
