import 'package:flutter/material.dart';
import 'addProduct.dart';
import 'customCard.dart';
import 'search.dart';
// import 'addProduct.dart';
import 'product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFCCCCCC),
                borderRadius: BorderRadius.circular(11),
              ),
              // child: Image.asset('images/gray.png', fit: BoxFit.cover,),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "July 14, 2023",
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 12,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Hello, ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF666666),
                          fontFamily: 'Sora',
                          fontSize: 15,
                          height: 0,
                        ),
                      ),
                      Text(
                        "Yohannes",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Sora',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFEFEFE),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFFD9D9D9),
                ),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Center(
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                    ),
                    Positioned(
                      top: 5,
                      left: 14,
                      child: Center(
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Color(0xFF3E50F3),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProduct()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28.5,),
        backgroundColor: Color(0xFF3E50F3),
        shape: const CircleBorder(),
        
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Available Products",
                  style: TextStyle(
                    color: Color(0xFF3E3E3E),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEFEFE),
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFD9D9D9),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xFFD9D9D9),
                        size: 26,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Search()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    
                    CustomeCard(
                      product: Product(
                        name: "Derby Leather Shoes",
                        image: "images/Shoe.png",
                        price : "\$120",
                        category : "Men's shoe",
                        description : "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp the upper part of the shoe. This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.", 
                    ),),
                    const SizedBox(height: 15),
                    CustomeCard(
                      product: Product(
                        name: "Vans Shoes",
                        image: "images/Shoe.png",
                        price : "\$170",
                        category : "Men's shoe",
                        description : "A Vans shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp the upper part of the shoe. This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.", 
                    ),),
                    const SizedBox(height: 15),
                    CustomeCard(
                      product: Product(
                        name: "Nike Shoes",
                        image: "images/Shoe.png",
                        price : "\$150",
                        category : "Men's shoe",
                        description : "A Nike shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp the upper part of the shoe. This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.", 
                    ),),
                    const SizedBox(height: 15),
                    CustomeCard(
                      product: Product(
                        name: "Adidas Shoes",
                        image: "images/Shoe.png",
                        price : "\$160",
                        category : "Men's shoe",
                        description : "A Adidas shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp the upper part of the shoe. This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.", 
                    ),),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
