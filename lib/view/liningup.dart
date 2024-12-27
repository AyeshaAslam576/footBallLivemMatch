import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Liningup extends StatelessWidget {
  const Liningup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xff005F00),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                ),

             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 CircleAvatar(
                   radius:12,
                   child: Image.network("assets/errer.jfif"),
                 ),
                 SizedBox(width: 15,),
                 Text("League Name"
                   ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                 ),
               ],
             ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 500, // Specify a height
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/lineup.png"),
                    fit: BoxFit.fill,
                  ),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     SizedBox(height: 5,),
                    //1st row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius:12,
                            child: Image.network("assets/errer.jfif"),
                          ),
                          SizedBox(height: 8,),
                          Text("PlayerName"
                            ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                          )
                        ],
                      ),
                    ],
                    ),
                    //2nd row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:12,
                              child: Image.network("assets/errer.jfif"),
                            ),
                            SizedBox(height: 8,),
                            Text("PlayerName"
                              ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                            )
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:12,
                              child: Image.network("assets/errer.jfif"),
                            ),
                            SizedBox(height: 8,),
                            Text("PlayerName"
                              ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                            )
                          ],
                        ),
                      ],
                    ),
                    //3rd row
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 9,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //4rth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:12,
                              child: Image.network("assets/errer.jfif"),
                            ),
                            SizedBox(height: 8,),
                            Text("PlayerName"
                              ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                            )
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:12,
                              child: Image.network("assets/errer.jfif"),
                            ),
                            SizedBox(height: 8,),
                            Text("PlayerName"
                              ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                            )
                          ],
                        ),
                      ],
                    ),
                    //5rth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:12,
                              child: Image.network("assets/errer.jfif"),
                            ),
                            SizedBox(height: 8,),
                            Text("PlayerName"
                              ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                            )
                          ],
                        ),
                      ],
                    ),
                    //6th row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:12,
                              child: Image.network("assets/errer.jfif"),
                            ),
                            SizedBox(height: 8,),
                            Text("PlayerName"
                              ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:12,
                              child: Image.network("assets/errer.jfif"),
                            ),
                            SizedBox(height: 8,),
                            Text("PlayerName"
                              ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                            )
                          ],
                        ),
                      ],
                    ),
                    //7th row
                    Padding(
                      padding: const EdgeInsets.only(bottom: 47.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xff005F00),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      radius:12,
                      child: Image.network("assets/errer.jfif"),
                    ),
                    SizedBox(width: 15,),
                    Text("League Name"
                      ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 500, // Specify a height
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/lineup.png"),
                      fit: BoxFit.fill,
                    ),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 5,),
                      //1st row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                        ],
                      ),
                      //2nd row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                        ],
                      ),
                      //3rd row
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius:12,
                                  child: Image.network("assets/errer.jfif"),
                                ),
                                SizedBox(height: 9,),
                                Text("PlayerName"
                                  ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius:12,
                                  child: Image.network("assets/errer.jfif"),
                                ),
                                SizedBox(height: 8,),
                                Text("PlayerName"
                                  ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      //4rth row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                        ],
                      ),
                      //5rth row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                        ],
                      ),
                      //6th row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius:12,
                                child: Image.network("assets/errer.jfif"),
                              ),
                              SizedBox(height: 8,),
                              Text("PlayerName"
                                ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                              )
                            ],
                          ),
                        ],
                      ),
                      //7th row
                      Padding(
                        padding: const EdgeInsets.only(bottom: 47.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius:12,
                                  child: Image.network("assets/errer.jfif"),
                                ),
                                SizedBox(height: 8,),
                                Text("PlayerName"
                                  ,style: GoogleFonts.sen(textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
