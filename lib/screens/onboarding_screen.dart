import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage
          ? _indicator(false)
          : _indicator(true)); // عكس التنقل
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ? Color(0xFF7B51D3)
            : Colors.white, // تغيير لون النقطة غير المحددة
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/register'); // التنقل إلى صفحة الريجستر
                    },
                    child: Text(
                      'تخطي',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  reverse: true,
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/onboarding0.png',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'مرحبا بك في توبة',
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'توبة هي بيئة تهدف لتوفير غاية وهدف نسير عليه وتقليل المعاصي والمحافظة على الفروض ',
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/onboarding1.png',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'بيئة فكرية تتميز بطاعة الله',
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'هنا في توبة نحاول توفير بيئة لتقليل المعاصي والذنوب ، نحن نريد إلتزاما وأن تأخذها بقوة',
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: SingleChildScrollView(
                        // استخدم SingleChildScrollView هنا
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'assets/images/onboarding2.png',
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'فلنكن رجال صدقوا ما عاهدوا الله عليه',
                              style: TextStyle(
                                fontFamily: 'Changa',
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'هنا في توبة نريد أن نكون رجالًا حقا مع أنفسنا وأن نحاول تقليل المعاصي والمحافظة على فروضنا وبناء فكر إسلامي صحيح',
                              style: TextStyle(
                                fontFamily: 'Changa',
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ),
              _currentPage != _numPages - 1
                  ? Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(
                                    math.pi), // تدوير السهم بزاوية 180 درجة
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'التالي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontFamily: 'Changa',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 0.0),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 3), // قمت بتقليل البادينج إلى 10 نقاط من الأسفل
                    child: Text(
                      'ابدأ الآن',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Changa',
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SizedBox(height: 0.0),
    );
  }
}
