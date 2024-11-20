import 'package:ecommerce_v2/main.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/category/list/ClienteCategoryListPage.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClienteHomeBloc.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClienteHomeEvent.dart';
import 'package:ecommerce_v2/src/presentation/pages/client/home/bloc/ClienteHomeState.dart';
import 'package:ecommerce_v2/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClienteHomePage extends StatefulWidget {
  const ClienteHomePage({super.key});

  @override
  State<ClienteHomePage> createState() => _ClienteHomePageState();
}

class _ClienteHomePageState extends State<ClienteHomePage> {
  ClienteHomeBloc? _bloc;

  List<Widget> pageList = <Widget>[
    ClienteCategoryListPage(),
    ProfileInfoPage(),
  ];
  // Map page titles to their corresponding pages
  final Map<int, String> _pageTitles = {
    0: 'Categorías',
    1: 'Perfil',
  };

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClienteHomeBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: PreferredSize(
            preferredSize:
                Size.fromHeight(50), // Ajusta la altura según tus necesidades
            child: BlocBuilder<ClienteHomeBloc, ClienteHomeState>(
              builder: (context, state) {
                return Text(_pageTitles[state.pageIndex] ?? 'Menu');
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'client/shopping_bag');
                },
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ))
          ],
        ),
        drawer: BlocBuilder<ClienteHomeBloc, ClienteHomeState>(
          builder: (context, state) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/img/woman.jpg'), // Ruta de la imagen
                          fit: BoxFit
                              .cover, // Ajusta la imagen para que cubra todo el fondo
                        ),
                      ),
                      child: Text(
                        'Menu del Cliente',
                        style: TextStyle(color: Colors.white),
                      )),
                  ListTile(
                    leading: Icon(Icons.category),
                    iconColor: Colors.green,
                    title: Text('Categorias'),
                    selected: state.pageIndex == 0,
                    onTap: () {
                      _bloc?.add(ClienteChangeDrawerPage(pageIndex: 0));
                      Navigator.pop(context); // cierra el drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    iconColor: Colors.green,
                    title: Text('Perfil'),
                    selected: state.pageIndex == 1,
                    onTap: () {
                      _bloc?.add(ClienteChangeDrawerPage(pageIndex: 1));
                      Navigator.pop(context); // cierra el drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    iconColor: Colors.green,
                    title: Text('cerrar Sesion'),
                    onTap: () {
                      _bloc?.add(ClienteLogout());
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                          (route) => false); // cierra el drawer
                    },
                  )
                ],
              ),
            );
          },
        ),
        body: BlocBuilder<ClienteHomeBloc, ClienteHomeState>(
            builder: (context, state) {
          return pageList[state.pageIndex];
        }));
  }
}
