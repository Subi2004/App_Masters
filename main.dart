import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: constraints.maxWidth * 0.33,
                top: constraints.maxHeight * 0.17,
                child: Container(
                  width: constraints.maxWidth * 0.34,
                  height: constraints.maxHeight * 0.15,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: constraints.maxWidth * 0.07,
                top: constraints.maxHeight * 0.09,
                child: SizedBox(
                  width: constraints.maxWidth * 0.87,
                  height: constraints.maxHeight * 0.065,
                  child: Text(
                    'THIAGARAJAR COLLEGE OF \nENGINEERING',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: constraints.maxWidth * 0.05,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: constraints.maxHeight * 0.349, // Adjusted the top position
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.133,
                  child: Text(
                    'HOSTEL MANAGEMENT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: constraints.maxWidth * 0.1,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              DraggableContainer(
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.15,
                  child: Text(
                    'Drag me up to navigate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: constraints.maxWidth * 0.045,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onDrag: () => handleDrag(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void handleDrag(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage1()),
    );
  }
}

class DraggableContainer extends StatefulWidget {
  final Widget child;
  final Function onDrag;

  DraggableContainer({required this.child, required this.onDrag});

  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer> {
  double containerHeight = 135.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0, // Positioned at the bottom
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            containerHeight -= details.delta.dy;
            if (containerHeight < 135.0) {
              containerHeight = 135.0;
            }
          });
        },
        onVerticalDragEnd: (details) {
          if (containerHeight < 135.0) {
            containerHeight = 135.0;
          } else if (containerHeight > 300) {
            widget.onDrag();
          }
        },
        child: SizedBox(
          height: containerHeight,
          child: Draggable<double>(
            maxSimultaneousDrags: 1,
            onDragUpdate: (details) {
              setState(() {
                containerHeight -= details.delta.dy;
                if (containerHeight < 135.0) {
                  containerHeight = 135.0;
                }
              });
            },
            onDragEnd: (details) {
              if (containerHeight < 135.0) {
                containerHeight = 135.0;
              } else if (containerHeight > 300) {
                widget.onDrag();
              }
            },
            feedback: Container(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Image.asset(
                      "assets/background.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: constraints.maxHeight * 0.2375,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.7625,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 110,
                  top: constraints.maxHeight * 0.7525,
                  child: SizedBox(
                    width: 142,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 31,
                  top: constraints.maxHeight * 0.45875,
                  child: SizedBox(
                    width: 295,
                    height: constraints.maxHeight * 0.06625,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email ID',
                        hintStyle: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 31,
                  top: constraints.maxHeight * 0.55375,
                  child: SizedBox(
                    width: 295,
                    height: constraints.maxHeight * 0.08,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 11,
                  top: constraints.maxHeight * 0.66,
                  child: SizedBox(
                    width: constraints.maxWidth * 0.5,
                    height: constraints.maxHeight * 0.03375,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF256EA2),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.125,
                  bottom: constraints.maxHeight * 0.1125,
                  child: SizedBox(
                    width: constraints.maxWidth * 0.7475,
                    height: constraints.maxHeight * 0.02375,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: ' Register',
                              style: TextStyle(
                                color: Color(0xFF256EA2),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.40833333,
                  top: constraints.maxHeight * 0.2575,
                  child: Container(
                    width: constraints.maxWidth * 0.17777778,
                    height: constraints.maxHeight * 0.08875,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Ellipse 1.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: constraints.maxHeight * 0.05,
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.19444444,
                  top: constraints.maxHeight * 0.35375,
                  child: SizedBox(
                    width: constraints.maxWidth * 0.61388889,
                    height: constraints.maxHeight * 0.04375,
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: constraints.maxHeight * 0.045,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.05833333,
                  top: constraints.maxHeight * 0.045,
                  child: SizedBox(
                    width: constraints.maxWidth * 0.85833333,
                    height: constraints.maxHeight * 0.13875,
                    child: Text(
                      'HEY \nTCE’IANS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxHeight * 0.046,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "HOME",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              buildButton("Vote meal", Icons.how_to_vote,onPressed: ()
              {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) =>vote_meal()),
                );
              }),
              SizedBox(height: 50),
              buildButton("Profile", Icons.person,onPressed: ()
              {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => Profile()),
                );
              }),
              SizedBox(height: 50),
              buildButton("Queries", Icons.question_answer,onPressed: ()
              {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => Queries()),
                );
              }),
              SizedBox(height: 50),
              buildButton("Rate meal", Icons.star,onPressed: ()
              {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => StarRatingWidget()),
                );
              }),
              SizedBox(height: 50),
              buildButton("Feedback", Icons.feed, onPressed: ()
              {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => FeedbackForm()),
                );
              }
              ),
              SizedBox(height: 50),
              buildButton("Contact us", Icons.call, onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text, IconData icon, {VoidCallback? onPressed}) {
    return Container(
      width: 178,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Icon(
              icon,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PROFILE",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/Ellipse 91.png'),
              ),
              SizedBox(height: 20),
              Text(
                " Hello!, User. ",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => edit_profile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.green,
                          ),
                          SizedBox(width: 16),
                          Text(
                            " Edit Profile",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePassword()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            size: 40,
                            color: Colors.green,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: Colors.green,
                          ),
                          SizedBox(width: 16),
                          Text(
                            " Log out",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class vote_meal extends StatefulWidget {
  const vote_meal({super.key});

  @override
  State<vote_meal> createState() => _vote_mealState();
}

class _vote_mealState extends State<vote_meal> {
  int op1=0,op2=0,op3=0,op4=0,op5=0,op6=0;
  void vote_op1(){
    setState(() {
      op1++;
    });
  }
  void vote_op2(){
    setState(() {
      op2++;
    });
  }
  void vote_op3(){
    setState(() {
      op3++;
    });
  }
  void vote_op4(){
    setState(() {
      op4++;
    });
  }
  void vote_op5(){
    setState(() {
      op5++;
    });
  }
  void vote_op6(){
    setState(() {
      op6++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 700,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white24
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Vote your Favorite dish here!!",style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),
                ),
                SizedBox(height: 20,),
                Container(
                    width: 300,
                    height: 50,
                    color: Colors.white30,

                    child : ElevatedButton(
                      onPressed: () {
                        vote_op1();

                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white30),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dosa',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                        ],
                      ),

                    )
                ),

                SizedBox(height: 20,),
                Container(
                    width: 300,
                    height: 50,
                    color: Colors.white30,

                    child : ElevatedButton(
                      onPressed: () {
                        vote_op2();

                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white30),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Roti',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                        ],
                      ),

                    )
                ),

                SizedBox(height: 20,),
                Container(
                    width: 300,
                    height: 50,
                    color: Colors.white30,

                    child : ElevatedButton(
                      onPressed: () {
                        vote_op3();

                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white30),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Fried rice',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                        ],
                      ),

                    )
                ),

                SizedBox(height: 20,),
                Container(
                    width: 300,
                    height: 50,
                    color: Colors.white30,

                    child : ElevatedButton(
                      onPressed: () {
                        vote_op4();

                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white30),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Curd rice',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                        ],
                      ),

                    )
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      color: Colors.white60,
                      child: Text(" Dosa -$op1",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 300,
                      height: 50,
                      color: Colors.white60,
                      child: Text(" Roti -$op2",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 300,
                      height: 50,
                      color: Colors.white60,
                      child: Text(" Fried rice -$op3",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 300,
                      height: 50,
                      color: Colors.white60,
                      child: Text(" Curd rice -$op4",style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                    )
                  ],
                )
              ],

            ),

          ),
        ),

      ),
    );
  }
}

class Queries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: screenSize.width * 0.69,
                top: screenSize.height * 0.766,
                child: Container(
                  width: screenSize.width * 0.194,
                  height: screenSize.height * 0.025,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3DBEC6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenSize.width * 0.047,
                bottom: screenSize.height * 0.125,
                child: Container(
                  width: screenSize.width * 0.905,
                  height: screenSize.height * 0.656,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Itim',
                      fontSize: screenSize.height * 0.056,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Share your queries.....',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Itim',
                        fontSize: screenSize.height * 0.024,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(screenSize.height * 0.0125),
                    ),
                    maxLines: null,
                  ),
                ),
              ),
              Positioned(
                left: screenSize.width * 0.614,
                top: screenSize.height * 0.768,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Color(0xFF113FB6),
                        fontSize: screenSize.height * 0.026,
                        fontFamily: 'Jomolhari',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenSize.width * 0.056,
                top: screenSize.height * 0.175,
                child: SizedBox(
                  width: screenSize.width * 0.722,
                  height: screenSize.height * 0.125,
                  child: Text(
                    'QUERIES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.height * 0.0375, // Increase the font size
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                      height: 0.03,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FeedbackForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: screenSize.width * 0.69,
                top: screenSize.height * 0.766,
                child: Container(
                  width: screenSize.width * 0.194,
                  height: screenSize.height * 0.025,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3DBEC6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenSize.width * 0.047,
                bottom: screenSize.height * 0.125,
                child: Container(
                  width: screenSize.width * 0.905,
                  height: screenSize.height * 0.656,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Itim',
                      fontSize: screenSize.height * 0.056,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Share your feedbacks.....',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Itim',
                        fontSize: screenSize.height * 0.024,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(screenSize.height * 0.0125),
                    ),
                    maxLines: null,
                  ),
                ),
              ),
              Positioned(
                left: screenSize.width * 0.614,
                top: screenSize.height * 0.768,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Color(0xFF113FB6),
                        fontSize: screenSize.height * 0.026,
                        fontFamily: 'Jomolhari',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenSize.width * 0.056,
                top: screenSize.height * 0.175,
                child: SizedBox(
                  width: screenSize.width * 0.722,
                  height: screenSize.height * 0.125,
                  child: Text(
                    'FEEDBACK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.height * 0.0375, // Increase the font size
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                      height: 0.03,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class StarRatingWidget extends StatefulWidget {
  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int breakfastStars = 0;
  int lunchStars = 0;
  int dinnerStars = 0;

  Widget _buildStarRow(int stars, ValueChanged<int> onChanged) {
    return Row(
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            onChanged(index + 1);
          },
        child: Icon(
        index < stars ? Icons.star : Icons.star,
        color: index < stars ? Colors.yellow : Colors.white,
        size: 50,
        ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: -screenSize.width * 0.5,
              top: -screenSize.height * 0.4,
              child: Container(
                width: screenSize.width * 2,
                height: screenSize.height * 1.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.05,
              top: screenSize.height * 0.18,
              child: Text(
                '5 Stars - Excellent\n4 Stars - Good\n3 Stars - Average\n2 Stars - Poor\n1 Star - Worst',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.07,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.02,
              top: screenSize.height * 0.10,
              child: SizedBox(
                width: screenSize.width * 0.7,
                height: screenSize.height * 0.1,
                child: Text(
                  'RATE MEAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.08,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.45,
              child: SizedBox(
                width: screenSize.width * 0.64,
                height: screenSize.height * 0.035,
                child: Text(
                  'Breakfast',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.065,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.58,
              child: SizedBox(
                width: screenSize.width * 0.64,
                height: screenSize.height * 0.035,
                child: Text(
                  'Lunch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.065,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.69,
              child: SizedBox(
                width: screenSize.width * 0.64,
                height: screenSize.height * 0.036,
                child: Text(
                  'Dinner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.065,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.50,
              child: _buildStarRow(breakfastStars, (stars) {
                setState(() {
                  breakfastStars = stars;
                });
              }),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.74,
              child: _buildStarRow(lunchStars, (stars) {
                setState(() {
                  lunchStars = stars;
                });
              }),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              top: screenSize.height * 0.62,
              child: _buildStarRow(dinnerStars, (stars) {
                setState(() {
                  dinnerStars = stars;
                });
              }),
            ),
            Positioned(
              left: screenSize.width * 0.04,
              bottom: screenSize.height * 0.07,
              child: SizedBox(
                width: screenSize.width * 0.64,
                height: screenSize.height * 0.1,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What has to be improved ?',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontFamily: 'Righteous',
                      fontWeight: FontWeight.w400,
                      fontSize: screenSize.width * 0.05,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Righteous',
                    fontWeight: FontWeight.w400,
                    fontSize: screenSize.width * 0.04,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.38,
              bottom: screenSize.height * 0.05,
              child: SizedBox(
                width: screenSize.width * 0.28,
                height: screenSize.height * 0.04,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Righteous',
                      fontWeight: FontWeight.w400,
                      fontSize: screenSize.width * 0.05,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: -screenWidth * 1.28,
                top: -screenHeight * 0.101,
                child: Container(
                  width: screenWidth * 3.56,
                  height: screenHeight * 1.201,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.250,
                top: screenHeight * 0.15875,
                child: SizedBox(
                  width: screenWidth * 0.75,
                  height: screenHeight * 0.0275,
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.095,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: screenHeight * 0.0000875,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.6924,
                top: screenHeight * 0.19375,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                  child: Container(
                    width: screenWidth * 0.3868,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: screenWidth * 0.00833,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: screenWidth * 0.0111,
                          offset: Offset(0, screenHeight * 0.005),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.05,
                top: screenHeight * 0.255,
                child: Container(
                  width: screenWidth * 0.8833,
                  height: screenHeight * 0.49125,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFFF7E8E8), Color(0x00F7E8E8)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: screenWidth * 0.00556,
                        color: Colors.black.withOpacity(0.9399999976158142),
                      ),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(screenHeight * 0.1925)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.1028,
                top: screenHeight * 0.33370,
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.black, size: screenWidth * 0.08),
                    SizedBox(width: screenWidth * 0.0139),
                    Text(
                      '0452 2482240',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.0617,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: screenHeight * 0.0003375,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: screenWidth * 0.1028,
                top: screenHeight * 0.42125,
                child: Row(
                  children: [
                    Icon(Icons.mail, color: Colors.black, size: screenWidth * 0.08),
                    SizedBox(width: screenWidth * 0.0139),
                    Text(
                      'Principal@tce.edu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.0617,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: screenHeight * 0.0003375,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: screenHeight * 0.2375,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.7625,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: screenWidth * 0.1667,
              top: screenHeight * 0.69,
              child: SizedBox(
                width: screenWidth * 0.6778,
                height: screenHeight * 0.04,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    'Reset Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.0667,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.0861,
              top: screenHeight * 0.45875,
              child: SizedBox(
                width: screenWidth * 0.8194,
                height: screenHeight * 0.06625,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'old password',
                    hintStyle: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: screenWidth * 0.0444,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.0861,
              top: screenHeight * 0.56,
              child: SizedBox(
                width: screenWidth * 0.8194,
                height: screenHeight * 0.08,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'new Password',
                    hintStyle: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: screenWidth * 0.0444,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.4083,
              top: screenHeight * 0.25875,
              child: Container(
                width: screenWidth * 0.1778,
                height: screenWidth * 0.1778,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Ellipse 1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: screenWidth * 0.1111,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * -0.0833,
              top: screenHeight * 0.375,
              child: SizedBox(
                width: screenWidth * 1.1694,
                height: screenHeight * 0.04375,
                child: Text(
                  'CHANGE PASSWORD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.0778,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
            ),

            Positioned(
              left: screenWidth * 0.0583,
              top: screenHeight * 0.085,
              child: SizedBox(
                width: screenWidth * 0.8583,
                height: screenHeight * 0.13875,
                child: Text(
                  'HEY \nTCE’IANS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.1033,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: screenHeight * 0.2375,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.7625,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: screenWidth * 0.1667,
              top: screenHeight * 0.77875,
              child: SizedBox(
                width: screenWidth * 0.6778,
                height: screenHeight * 0.04,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    'Reset Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.0667,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.0861,
              top: screenHeight * 0.45875,
              child: SizedBox(
                width: screenWidth * 0.8194,
                height: screenHeight * 0.06625,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Student EMAIL id',
                    hintStyle: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: screenWidth * 0.0444,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.0861,
              top: screenHeight * 0.55125,
              child: SizedBox(
                width: screenWidth * 0.8194,
                height: screenHeight * 0.08,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: ' OTP',
                    hintStyle: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: screenWidth * 0.0444,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.4083,
              top: screenHeight * 0.25875,
              child: Container(
                width: screenWidth * 0.1778,
                height: screenWidth * 0.1778,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Ellipse 1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: screenWidth * 0.1111,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * -0.0833,
              top: screenHeight * 0.375,
              child: SizedBox(
                width: screenWidth * 1.1694,
                height: screenHeight * 0.04375,
                child: Text(
                  'FORGOT PASSWORD?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.0778,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.0861,
              top: screenHeight * 0.65125,
              child: SizedBox(
                width: screenWidth * 0.8194,
                height: screenHeight * 0.08,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: ' New Password',
                    hintStyle: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: screenWidth * 0.0444,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: screenWidth * 0.0683,
              top: screenHeight * 0.085,
              child: SizedBox(
                width: screenWidth * 0.8583,
                height: screenHeight * 0.13875,
                child: Text(
                  'HEY \nTCE’IANS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.1,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: -14,
              child: Container(
                width: screenWidth,
                height: screenHeight + 14, // Increase height to cover the gap
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: screenHeight * 0.2375,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.7625,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: screenWidth * 0.1917,
              top: screenHeight * 0.34375,
              child: SizedBox(
                width: screenWidth * 0.6139,
                height: screenHeight * 0.0475,
                child: Text(
                  'REGISTER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.0833,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.4111,
              top: screenHeight * 0.25,
              child: Container(
                width: screenWidth * 0.1778,
                height: screenWidth * 0.1778,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Ellipse 1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: screenWidth * 0.1111,
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.0889,
              top: screenHeight * 0.41375,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.8194,
                    height: screenHeight * 0.0725,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: screenWidth * 0.0444),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.8194,
                    height: 1,
                    color: Color(0xFF808080),
                  ),
                ],
              ),
            ),
            Positioned(
              left: screenWidth * 0.0889,
              top: screenHeight * 0.50,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.8194,
                    height: screenHeight * 0.0725,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: screenWidth * 0.0444),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.8194,
                    height: 1,
                    color: Color(0xFF808080),
                  ),
                ],
              ),
            ),
            Positioned(
              left: screenWidth * 0.0889,
              top: screenHeight * 0.60,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.8194,
                    height: screenHeight * 0.0725,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm your password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: screenWidth * 0.0444),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.8194,
                    height: 1,
                    color: Color(0xFF808080),
                  ),
                ],
              ),
            ),
            Positioned(
              left: screenWidth * 0.0889,
              top: screenHeight * 0.70,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.8194,
                    height: screenHeight * 0.0725,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your username',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: screenWidth * 0.0444),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.8194,
                    height: 1,
                    color: Color(0xFF808080),
                  ),
                ],
              ),
            ),
            Positioned(
              left: screenWidth * 0.25,
              top: screenHeight * 0.815,
              child: SizedBox(
                width: screenWidth * 0.5139,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color(0xFF808080),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'SUBMIT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: screenWidth * 0.0444,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.05833333,
              top: screenHeight * 0.045,
              child: SizedBox(
                width: screenWidth * 0.8583,
                height: screenHeight * 0.13875,
                child: Text(
                  'HEY \nTCE’IANS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.1,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class edit_profile extends StatelessWidget {
  const edit_profile({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.0625),
              Text(
                'EDIT PROFILE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.0667,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.0375),
              Image.asset(
                'assets/boy.png',
                width: screenWidth * 0.4167,
                height: screenWidth * 0.4167,
              ),
              SizedBox(height: screenHeight * 0.0375),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0556),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "User name",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0556),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Register number",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0556),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Room number",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0556),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0556),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Year of Passing",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}
