// import 'package:flutter/material.dart';

// class AddProduct extends StatelessWidget {
//   const AddProduct({super.key});

//   @override
//   Widget build(BuildContext context) {  
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//           // CrossAxisAlignment.start,
//           leading :IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//               size: 20,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
          
//           title: const Text(
//             "Add Product",
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600
//                 ),
//           ),
//           centerTitle : true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(18.0),
//           child: Container(
//             height: 190,
//             width: 366,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(216, 243, 243, 243),
//               // border: Border.all(
//               //     width: 1,
//               //     color: Color(0xFFD9D9D9),
//               //   ),
//               borderRadius: BorderRadius.circular(10),
//             ),),
//               child: Column(
//                 children: [
                
//                 Container(
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                 Icon(Icons.image, color: Color.fromARGB(255, 150, 149, 149), size: 50,),
              
//                 Text("Upload Image", style: TextStyle(
//                   color: Color.fromARGB(255, 123, 123, 123),
//                   fontSize: 14,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 ),],),),
//             ),
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 LabelAndTextField(
//                   label: 'name',
//                   hintText: 'Enter product name',
//                 ),
//                 SizedBox(height: 16),
//                 LabelAndTextField(
//                   label: 'category',
//                   hintText: 'Enter product category',
//                 ),
//                 SizedBox(height: 16),
//                 LabelAndTextField(
//                   label: 'price',
//                   hintText: 'Enter product price',
//                   suffixIcon: Icon(Icons.attach_money),
//                 ),
//                 SizedBox(height: 16),
//                 LabelAndTextField(
//                   label: 'description',
//                   hintText: 'Enter product description',
//                   maxLines: 3,
//                 ),
//               ],
//             ),
//           ),
//         ),
//             ),
//       ),);
//   }
// }

// class LabelAndTextField extends StatelessWidget {
//   final String label;
//   final String hintText;
//   final int maxLines;
//   final Widget? suffixIcon;

//   const LabelAndTextField({
//     Key? key,
//     required this.label,
//     required this.hintText,
//     this.maxLines = 1,
//     this.suffixIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 8),
//         TextField(
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hintText,
//             fillColor: Color(0xFFF0F0F0),
//             filled: true,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none,
//             ),
//             suffixIcon: suffixIcon,
//           ),
//         ),
//       ],
//     );
//   }
// }


/////////////////////////////////////////
// import 'package:flutter/material.dart';

// class AddProduct extends StatelessWidget {
//   const AddProduct({super.key});

//   @override
//   Widget build(BuildContext context) {  
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//             size: 20,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           "Add Product",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 190,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(216, 243, 243, 243),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(
//                       Icons.image,
//                       color: Color.fromARGB(255, 150, 149, 149),
//                       size: 50,
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Upload Image",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 123, 123, 123),
//                         fontSize: 14,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               LabelAndTextField(
//                 label: 'name',
//               ),
//               SizedBox(height: 16),
//               LabelAndTextField(
//                 label: 'category',
//               ),
//               SizedBox(height: 16),
//               LabelAndTextField(
//                 label: 'price',
//                 suffixIcon: Icon(Icons.attach_money),
//               ),
//               SizedBox(height: 16),
//               LabelAndTextField(
//                 label: 'description',
//                 maxLines: 3,
//               ),
            
                  
//                 OutlinedButton(
//                     onPressed: () {
//                       // Handle delete action
//                     },
//                     style: OutlinedButton.styleFrom(
//                       minimumSize: Size(150, 52),
//                       side: BorderSide(color: Colors.red), shape:RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),),
//                     ),
//                     child: const Text(
//                       'DELETE',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle update action
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(150, 52),
//                       backgroundColor: Color(0xFF3E50F3), shape:RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       )
//                     ),
//                     child: const Text(
//                       'UPDATE',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.white,
//                       ),
//                     ),
//                   ),
          
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LabelAndTextField extends StatelessWidget {
//   final String label;
//   final int maxLines;
//   final Widget? suffixIcon;

//   const LabelAndTextField({
//     Key? key,
//     required this.label,
//     // required this.hintText,
//     this.maxLines = 1,
//     this.suffixIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 8),
//         TextField(
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             fillColor: Color(0xFFF0F0F0),
//             filled: true,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none,
//             ),
//             suffixIcon: suffixIcon,
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Add Product",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(216, 243, 243, 243),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: Color.fromARGB(255, 150, 149, 149),
                      size: 50,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Upload Image",
                      style: TextStyle(
                        color: Color.fromARGB(255, 123, 123, 123),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const LabelAndTextField(
                label: 'name',
                keyboardType: TextInputType.text,

              ),
              const SizedBox(height: 12),
              const LabelAndTextField(
                label: 'category',
                keyboardType: TextInputType.text,

                
              ),
              const SizedBox(height: 12),
              const LabelAndTextField(
                label: 'price',
                keyboardType: TextInputType.number,

                
                suffixIcon: Icon(Icons.attach_money),
              ),
              const SizedBox(height: 12),
              const LabelAndTextField(
                label: 'description',
                keyboardType: TextInputType.text,

                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(334, 52),
                      backgroundColor: Color(0xFF3E50F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'ADD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );},
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(334, 52),
                      side: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'DELETE',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LabelAndTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final Widget? suffixIcon;
  final TextInputType keyboardType;


  const LabelAndTextField({
    Key? key,
    required this.label,
    this.maxLines = 1,
    this.suffixIcon,
    required this.keyboardType,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: Color(0xFFF0F0F0),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}


