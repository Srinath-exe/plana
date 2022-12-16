import 'package:flutter/material.dart';
import 'package:plana/Form.dart';

import 'package:plana/constants/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  late PanelController panelController = PanelController();
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SlidingUpPanel(
          onPanelSlide: (val) {
            setState(() {
              open = false;
            });
          },
          onPanelOpened: () {
            setState(() {
              open = true;
            });
          },
          onPanelClosed: () {
            setState(() {
              open = false;
            });
          },
          boxShadow: [
            BoxShadow(
                blurRadius: 20.0,
                color:
                    open ? Colors.transparent : Colors.black.withOpacity(0.4))
          ],
          isDraggable: true,
          controller: panelController,
          borderRadius: !open
              ? const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))
              : const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          minHeight: Config().deviceHeight(context) * 0.8,
          maxHeight: MediaQuery.of(context).size.height * 0.88,
          panel: PlanForm(),
          header: headerui(),
          body: Stack(
              // alignment: AlignmentDirectional.centerStart,
              clipBehavior: Clip.none,
              children: [
                // slideopen(),
                !open ? CircleAvatar() : Container(),
              ]),
        ),
      ),
    );
  }

  Widget headerui() {
    return Container(
      width: Config().deviceWidth(context),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
              color: black, borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }
}
