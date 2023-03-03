import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<String> name = ['AAYUSHI', 'MANJU', 'POOJA', 'MUDRA'];
  List<String> surname = ['karwa', 'shah', 'patel', 'sanghvi'];
  List<String> SearchList = [];
  late TabController tabController;
  bool isSearching = false;
  bool isFound = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: TextField(
                  onTap: () => setState(() {
                        isSearching = true;
                        isFound = true;
                      }),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (tabController.index == 0) {
                        SearchList = name.where((element) => element.contains(value.toUpperCase())).toList();
                      } else {
                        SearchList = surname.where((element) => element.contains(value.toUpperCase())).toList();
                      }
                      if (tabController.index == 1) {
                        SearchList = surname.where((element) => element.contains(value)).toList();
                      }
                    } else {
                      SearchList.clear();
                    }

                    setState(() {
                      if (SearchList.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('not found'),
                          backgroundColor: Colors.orangeAccent,
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          elevation: 20,
                          width: 200,
                        ));
                      }
                      print(SearchList);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 32,
                      ),
                      onPressed: () {
                        setState(() {
                          isSearching = false;
                          isFound = false;
                          FocusScope.of(context).unfocus();
                        });
                      },
                    ),
                  )),
            ),
            TabBar(
              onTap: (value) {
                print(tabController.index);
              },
              controller: tabController,
              indicatorColor: Colors.black12,
              labelColor: Colors.orange,
              tabs: const [
                Tab(
                  icon: Icon(Icons.call),
                ),
                Tab(icon: Icon(Icons.contact_mail)),
              ],
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: SearchList.isNotEmpty ? SearchList.length : name.length,
                  itemBuilder: (context, index) {
                    return Text(SearchList.isNotEmpty ? SearchList[index] : name[index]);
                  },
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: SearchList.isNotEmpty ? SearchList.length : surname.length,
                  itemBuilder: (context, index) {
                    return Text(SearchList.isNotEmpty ? SearchList[index] : surname[index]);
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
