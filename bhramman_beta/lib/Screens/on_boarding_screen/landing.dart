import 'package:bhrammanbeta/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:bhrammanbeta/database/auth.dart';

import 'Slider.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  int _currentPage = 0;
  PageController _controller = PageController();

  initState(){
    super.initState();
    setOnBoardingSeen();
  }

  setOnBoardingSeen() async {
    await AuthService.setOnBoardingSeenToSharedPref().then((value) {
       return value;
    });
  }

  List<Widget> _pages = [
    SliderPage(
        title: "A-I",
        description:
        "Ai camera will help to identify the place , location and display about the place",
        image: "assets/onBoarding/ar.png"),
    SliderPage(
        title: "ChatBot",
        description:
        "ChatBot is helped to guide the tourist/locals and solve the question about the place",
        image:"assets/onBoarding/chatbot.png"),
    SliderPage(
        title: "LiveStream",
        description:
        "Locals/tourist can connect/watch culture,Heritage about a place with many peoples with different places, and start LiveStream",
        image: "assets/onBoarding/steam.png"),
    SliderPage(
        title: "Story Of Place",
        description:
        "Locals of a place can post stories about place with many peoples/tourist",
        image: "assets/onBoarding/story.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    height: 70,
                    width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(35)),
                    child: (_currentPage == (_pages.length - 1))
                        ? Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                        : Icon(
                      Icons.navigate_next,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
