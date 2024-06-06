import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  bool _agreeToTerms = false;

  void _register() async {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      _formKey.currentState!.save();
      try {
        final user = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'الاسم',
          style: TextStyle(
            fontFamily: 'Changa',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.name,
            style: TextStyle(
              fontFamily: 'Changa',
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'أدخل اسمك',
              hintStyle: TextStyle(
                fontFamily: 'Changa',
                color: Colors.white54,
              ),
            ),
            validator: (value) => value!.isEmpty ? 'الرجاء إدخال الاسم' : null,
            onSaved: (value) => _name = value!,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'البريد الإلكتروني',
          style: TextStyle(
            fontFamily: 'Changa',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontFamily: 'Changa',
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'أدخل بريدك الإلكتروني',
              hintStyle: TextStyle(
                fontFamily: 'Changa',
                color: Colors.white54,
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? 'الرجاء إدخال البريد الإلكتروني' : null,
            onSaved: (value) => _email = value!,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'كلمة المرور',
          style: TextStyle(
            fontFamily: 'Changa',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              fontFamily: 'Changa',
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'أدخل كلمة المرور',
              hintStyle: TextStyle(
                fontFamily: 'Changa',
                color: Colors.white54,
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? 'الرجاء إدخال كلمة المرور' : null,
            onSaved: (value) => _password = value!,
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'تأكيد كلمة المرور',
          style: TextStyle(
            fontFamily: 'Changa',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              fontFamily: 'Changa',
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'أدخل تأكيد كلمة المرور',
              hintStyle: TextStyle(
                fontFamily: 'Changa',
                color: Colors.white54,
              ),
            ),
            validator: (value) =>
                value != _password ? 'كلمة المرور غير متطابقة' : null,
          ),
        ),
      ],
    );
  }

  Widget _buildAgreeToTermsCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _agreeToTerms,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _agreeToTerms = value!;
                });
              },
            ),
          ),
          Text(
            'أوافق على الشروط والأحكام',
            style: TextStyle(
              fontFamily: 'Changa',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _register,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'تسجيل',
          style: TextStyle(
            fontFamily: 'Changa',
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'هل لديك حساب؟ ',
              style: TextStyle(
                fontFamily: 'Changa',
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'تسجيل الدخول',
              style: TextStyle(
                fontFamily: 'Changa',
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'إنشاء حساب',
                          style: TextStyle(
                            fontFamily: 'Changa',
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildNameTF(),
                              SizedBox(height: 30.0),
                              _buildEmailTF(),
                              SizedBox(height: 30.0),
                              _buildPasswordTF(),
                              SizedBox(height: 30.0),
                              _buildConfirmPasswordTF(),
                              SizedBox(height: 20.0),
                              _buildAgreeToTermsCheckbox(),
                              _buildRegisterBtn(),
                              _buildLoginLink(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  RaisedButton(
      {required double elevation,
      required void Function() onPressed,
      required EdgeInsets padding,
      required RoundedRectangleBorder shape,
      required Color color,
      required Text child}) {}
}

class SystemUiOverlayStyle {
  static var light;
}
