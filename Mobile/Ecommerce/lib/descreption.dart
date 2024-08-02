import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'customCard.dart';
class Descreption extends StatefulWidget {
  const Descreption({super.key});

  @override
  State<Descreption> createState() => _DescreptionState();
}

class _DescreptionState extends State<Descreption> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
            Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [  
                // const SizedBox(width: 20,),
              Image.asset('images/Shoes.png'),
                Positioned(
                  top: 20,
                  left: 20,
                  
                   child: Container(
                    
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          
                        ),
                          child: IconButton( onPressed: (){
                            Navigator.pop(context);
                          },
                            icon: const Icon(
                              Icons.arrow_back_ios, color: Color(0xFF3E50F3), size: 16,),
                          ),
                        
          
                 ),),
                
               
            ],),
          
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
             child: Column(children: [
                Row(
                      children: [
                        Text(
                          'Men’s shoe',
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.star, color: Color.fromARGB(240, 255, 217, 0), size: 14),
                        Text(
                          '(4.5)',
                          style: TextStyle(
                            color: Color.fromARGB(255, 170, 170, 170),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Derby Leather Shoes',
                          style: TextStyle(
                            color: Color(0xFF3E3E3E),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$120',
                          style: TextStyle(
                            color: Color(0xFF3E3E3E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(children: [
                      Text(
                      'Size:',
                      style: TextStyle(
                      color: Color(0xFF3E3E3E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      ),
                      ),
                    ],)
                    
              ],
              
              ),
           ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 75,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) { 
                    return BoxNum(
                      number: index + 35, isSelected: index == selectedIndex,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      }
                      ); 
                  },),
                ),
                
              ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
              style: TextStyle(fontSize: 14, fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color(0xFF666666)),),
            ),
            
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(150, 48),
                      side: BorderSide(color: Colors.red), shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),),
                    ),
                    child: const Text(
                      'DELETE',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                   onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 48),
                      backgroundColor: Color(0xFF3E50F3), shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white,
                      ),
                    ),
                  ),
                ],),
              ),
              // Image.asset('images/Shoe.png', fit: BoxFit.cover, height: 300,),
          ],
          ),
        )
          );
  }
}
