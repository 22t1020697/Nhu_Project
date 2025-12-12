import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nhu_project/api.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  void initState() {
    super.initState();
    test_api.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  Widget myListProduct(List<Product> ls ){
    return ListView{
      ScrollDirection: Axis.vertical,
      children: ls.map((p)=> myproduct(p)).toList(),
    }
    
  }
}
