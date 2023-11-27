import 'package:api_testing/modal/all_products.dart';
import 'package:api_testing/repository/all_products_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as image;

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<Datum> datum = [];

  getData() async {
    ProductData data = await AllProductsApi.getFromApi();
    print(data.data.data);
    datum.addAll(data.data.data);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isNotError(),
    );
  }
  // check api data is succesfully fetch or display a circular bar
  isNotError(){
    if(datum.isNotEmpty){
      return Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: SizedBox(
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: datum.length,
              itemBuilder: (context, item) {
                return SizedBox(
                  width: 300,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        image.Image.network(
                          datum[item].image.medium,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                        Text(datum[item].name,
                            style: TextStyle(color: Colors.black,fontSize: 16, height: 3)),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Regular : ${datum[item].regularPrice}"),
                              Text("Offer : ${datum[item].discountedPrice}"),
                            ],
                          ),
                        ),
                        Text(
                          "Discount : ${datum[item].discount}",
                          style: TextStyle(height: 3),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    }else{
      return Center(child: CircularProgressIndicator());
    }
  }
}
