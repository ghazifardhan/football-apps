import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_apps/blocs/country/country_cubit.dart';
import 'package:football_apps/blocs/league/league_cubit.dart';
import 'package:football_apps/blocs/search/search_cubit.dart';
import 'package:football_apps/helpers/simple_bloc_observer.dart';
import 'package:football_apps/pages/events.dart';
import 'package:football_apps/pages/homes.dart';
import 'package:football_apps/pages/search.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Football Apps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = [
    Homes(),
    Events(),
    Search()
  ];

  // Cubit
  CountryCubit _countryCubit = new CountryCubit();
  LeagueCubit _leagueCubit = new LeagueCubit();
  SearchCubit _searchCubit = new SearchCubit();

  @override
  void initState() {
    super.initState();

    _countryCubit.getCountries();
    _leagueCubit.getLeagues();
  }

  @override
    void dispose() {
      _countryCubit.close();
      _leagueCubit.close();
      super.dispose();
    }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(create: (context) => _countryCubit),
        BlocProvider<LeagueCubit>(create: (context) => _leagueCubit),
        BlocProvider<SearchCubit>(create: (context) => _searchCubit),
      ], 
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
        ),
      )
    );
  }
}
