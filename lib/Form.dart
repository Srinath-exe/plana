import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plana/constants/TextField.dart';
import 'package:plana/constants/buttons.dart';
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
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  void initState() {
    fromDate = DateTime.now();
    toDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36.0, right: 36, top: 36),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              name: "Plan Name",
              icon: Icons.celebration,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Checkbox(
                      activeColor: black,
                      value: check,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onChanged: (onChanged) {
                        setState(() {
                          check = onChanged!;
                        });
                      }),
                  Container(
                    child: const Expanded(
                      child: Text("Is this plan a offer/discount/Voucher?"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: lightgrey,
                ),
                height: Config().deviceHeight(context) * 0.25,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    maxLines: 20,
                    cursorColor: black,
                    decoration: const InputDecoration.collapsed(
                      hintText: "Description about the plan",
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTile(
                    title: 'Start',
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
                    title: 'End',
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
            SizedBox(
              height: 8,
            ),
            CustomTextField(
              name: "Venue",
              icon: Icons.location_on,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: selectImages,
              child: Container(
                decoration: BoxDecoration(
                    color: lightgrey, borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upload New Image",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Icon(
                        Icons.add_circle_rounded,
                        color: Colors.grey.shade500,
                      )
                    ],
                  ),
                ),
              ),
            ),
            imageFileList!.length > 0
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(imageFileList!.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 90,
                            height: 90,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: lightgrey,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.file(
                              File(imageFileList![index].path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                : Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: lightgrey,
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),

            // Container(
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: GridView.builder(
            //           itemCount: imageFileList!.length,
            //           gridDelegate:
            //               SliverGridDelegateWithFixedCrossAxisCount(
            //                   crossAxisCount: 3),
            //           itemBuilder: (BuildContext context, int index) {
            //             return
            //           }),
            //     ),
            //   )

            ThemeButton(
                width: Config().deviceWidth(context),
                borderRadius: 16,
                bgColor: Colors.grey.shade400,
                elevation: 0,
                text: "Next")
          ],
        ),
      ),
    );
  }
}
