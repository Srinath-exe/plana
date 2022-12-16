import 'package:flutter/material.dart';
import 'package:plana/Form.dart';
import 'package:plana/constants/buttons.dart';

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
            BoxShadow(blurRadius: 20.0, color: Colors.black.withOpacity(0.2))
          ],
          isDraggable: true,
          backdropEnabled: true,
          backdropColor: Colors.grey,
          controller: panelController,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          minHeight: Config().deviceHeight(context) * 0.3,
          maxHeight: MediaQuery.of(context).size.height * 0.82,
          panel: PlanForm(),
          header: headerui(),
          body: Stack(
            children: [
              Positioned(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_back_ios_rounded)),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // alignment: AlignmentDirectional.centerStart,
                      // clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          "assets/images/plana.png",
                          width: Config().deviceWidth(context) * 0.4,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create a New Plan",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                ],
              ),
            ],
          ),
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
