import 'package:flutter/material.dart';
import 'package:halal_proximity/components/bottom_nav_bar.dart';
import 'package:halal_proximity/views/cart_page.dart';
import 'package:halal_proximity/views/shop_page.dart';
import 'package:provider/provider.dart';
import 'package:halal_proximity/viewmodels/authentification_viewmodel.dart';

/* L'écran principal (HomeScreen) contient deux sections principales accessibles via une barre de navigation en bas :

ShopPage : Une page où l'utilisateur peut consulter et ajouter des produits au panier.
CartPage : La page du panier.
 */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

// This method will update our selected index
// when the user taps on the bottom bar

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
//shop page
    const ShopPage(),
// cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final authenticationViewModel =
        Provider.of<AuthenticationViewModel>(context);

    Widget _title() {
      return Text('Firebase Auth');
    }

    Widget _userUid() {
      final user = authenticationViewModel.currentUser;
      return Text(user?.email ?? 'No user');
    }

    Future<void> _signOutButton() async {
      await Provider.of<AuthenticationViewModel>(context, listen: false)
          .signOut();
      // Afficher le SnackBar après la déconnexion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vous avez été déconnecté.'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.of(context).pushReplacementNamed('/login');
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding:  EdgeInsets.only(left: 12.0),
              child:  Icon(Icons.menu, color: Colors.black),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child:
                        Image.asset('assets/images/fp_transparent_white.png'),
                  ),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Divider(
                        color: Colors.grey[800],
                      )),
                  //other page
                  const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Accueil',
                            style: TextStyle(color: Colors.white),
                          ))),

                  const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ListTile(
                          leading: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Informations',
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Deconnexion',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _signOutButton(); // Enveloppez l'appel asynchrone dans une fonction synchrone
                    },
                  ))
            ],
          )),
      body: _pages[_selectedIndex],
    );
  }
}
