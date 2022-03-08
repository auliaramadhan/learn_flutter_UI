import 'package:flutter/material.dart';
import '../colors.dart';
import '../utils/debug.dart';
import '../widgets/sidebar_drawer.dart';

class AdvanceScaffoldScreen extends StatefulWidget {
  const AdvanceScaffoldScreen({Key? key}) : super(key: key);

  @override
  State<AdvanceScaffoldScreen> createState() => _AdvanceScaffoldScreenState();
}

class _AdvanceScaffoldScreenState extends State<AdvanceScaffoldScreen> {
  buildPage(String txt) => Center(
        child: Text(txt),
      );

  int indexBottom = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          title: const Text('title'),
          // leading: IconButton(
          //     onPressed: () {
          //       Debug.log('tes button menu');
          //     },
          //     icon: Icon(Icons.menu)),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
            IconButton(
              icon: const Icon(Icons.help),
              tooltip: 'Open Help',
              onPressed: () {
                // handle the press
              },
            ),
          ],
          elevation: 10,
          titleSpacing: 10,
          // ganti bentuk , color dan besar  dari appbar
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorApp.primary, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            indicatorWeight: 4,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'home'),
              Tab(icon: Icon(Icons.favorite), text: 'favorite'),
              Tab(icon: Icon(Icons.star), text: 'wishlist'),
            ],
          ),
        ),
        body: TabBarView(children: [
          buildPage('txt'),
          buildPage('txt'),
          buildPage('txt'),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottom,
          elevation: 10,
          onTap: (bar) => indexBottom = bar,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'setting'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'note'),
          ],
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          elevation: 11,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TransparentAppbar extends StatelessWidget {
  const TransparentAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // make full screen appbart
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
        ),
        backgroundColor: Colors.transparent,
        title: const Text('transparent'),
        elevation: 10,

        
      ),
      body: Image.network(
          'https://images.unsplash.com/photo-1609102248009-b2411bff68f6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
    );
  }
}
class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // make full screen appbart
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('custom bottom'),
      ),
      body: const Text('asdasd'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        child: Wrap(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              onTap: (int index) {},
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'A'),
                BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'A'),
                BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'A'),
                BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'A'),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
