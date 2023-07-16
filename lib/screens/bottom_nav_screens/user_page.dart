import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/blocs/app_blocs.dart';
import 'package:products_app/blocs/app_events.dart';
import 'package:products_app/blocs/app_states.dart';
import 'package:products_app/repos/repositories.dart';

import '../product_screen.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with SingleTickerProviderStateMixin {
  final _searchcontroller = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _searchcontroller.addListener(onListen);
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(onListen);
  }

  @override
  void dispose() {
    _searchcontroller.dispose();
    _searchcontroller.removeListener(onListen);
    _tabController.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        RepositoryProvider.of<ProductRepository>(context),
      )..add(LoadProductEvent()),
      child: Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadedState) {
              return SafeArea(
                child: Scaffold(
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
                            const SizedBox(height: 10,),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 12),
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
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color(0xFF000000),
                                  ),
                                  suffixIcon: _searchcontroller.text.isEmpty
                                      ? Container(width: 0)
                                      : IconButton(
                                      onPressed: () => _searchcontroller.clear(),
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
                      const SizedBox(height: 20,),
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
                                //indicatorColor: const Color(0xFFFE6D8E),
                                labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
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
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
