import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/screens/product_info.dart';

import '../../blocs/product_blocs.dart';
import '../../blocs/product_events.dart';
import '../../data/models/products_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  final _searchcontroller = TextEditingController();
  late TabController _tabController;
  // final ProductBloc _productBloc = ProductBloc();

  @override
  void initState() {
    super.initState();
    _searchcontroller.addListener(onListen);
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(onListen);
    //To load the products
    context.read<ProductBloc>().add(LoadProduct());
    //_productBloc.add(LoadProductEvent());
  }

  @override
  void dispose() {
    _searchcontroller.dispose();
    _searchcontroller.removeListener(onListen);
    _tabController.removeListener(onListen);
    //_productBloc.close();
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    var productBloc = context.watch<ProductBloc>();
    List<ProductModel> listOfProducts = productBloc.state.listOfProducts;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        leading: const Icon(
          Icons.format_align_left,
          size: 25,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(24.0),
                  child: const Text(
                    'Awesome products for you!!!',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 12),
//padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEEEE),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    controller: _searchcontroller,
                    keyboardType: TextInputType.text,
                    autofillHints: const [AutofillHints.name],
                    textInputAction: TextInputAction.done,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF000000),
                      ),
                      suffixIcon: _searchcontroller.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                          onPressed: () =>
                              _searchcontroller.clear(),
                          icon: const Icon(
                            Icons.close,
                            color: Color(0xFF000000),
                          )),
                      labelText: 'Search',
                      labelStyle: const TextStyle(
                        color: Color(0xFF000000),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Color(0xFFEFEEEE),
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Color(0xFFEFEEEE),
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: const Color(0xFFFA4A0C),
                    unselectedLabelColor: const Color(0xFF9A9A9D),
                    padding: const EdgeInsets.only(left: 24),
                    labelStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w400),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2.0,
                    isScrollable: true,
                    tabs: const [
                      Tab(text: 'Clothes'),
                      Tab(text: 'Shoes'),
                      Tab(text: 'Electronics'),
                      Tab(text: 'Others'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
// Categories tab
                        Center(
                          child: ProductScreen(),
                        ),
                        Center(
                          child: Text('Shoes Screen'),
                        ),
                        Center(
                          child: Text('Electronics Screen'),
                        ),
                        Center(
                          child: Text('Other Products Section'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

}
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductBloc>().add(LoadProduct());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var productBloc = context.watch<ProductBloc>();
    List<ProductModel> listOfProducts = productBloc.state.listOfProducts;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: ListView.builder(
          padding: const EdgeInsets.all(24),
          scrollDirection: Axis.horizontal,
          itemCount: listOfProducts.length,
          itemBuilder: (context, index) {
            final myProduct = listOfProducts[index];
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  width: 250,
                  height: 320,
                  decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ProductInfo()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 50),
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                myProduct.imageUrl[0],
                                width: 180,
                                height: 200,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      width: 200,
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        myProduct.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        '\$${myProduct.price.toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.clip,
                        //maxLines: 4,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFA4A0C)),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),

    );
  }
}
