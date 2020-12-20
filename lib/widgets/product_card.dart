import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/Product.dart';
//import '../pages/details.dart';
import '../pages/account.dart';
import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: ProductDetailsArguments(product: product),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: product.colors[0],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: product.images[0].contains(".svg")
                        ? SvgPicture.asset(product.images[0])
                        : Image.asset(product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        color: Colors.grey,
                      ),
                      Container(
                        height: product.price,
                        color: Color(0xff536DFE),
                      ),
                    ],
                  ),
                  // Text(
                  //   "\$${product.price}",
                  //   style: TextStyle(
                  //     fontSize: getProportionateScreenWidth(18),
                  //     fontWeight: FontWeight.w600,
                  //     color: kPrimaryColor,
                  //   ),
                  // ),
                  // Container(
                  //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                  //     height: 28,
                  //     width: 28,
                  //     decoration: BoxDecoration(
                  //       color: product.isFavourite
                  //           ? kPrimaryColor.withOpacity(0.15)
                  //           : kSecondaryColor.withOpacity(0.1),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Center(
                  //       child: Icon(Icons.check),
                  //     )
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}