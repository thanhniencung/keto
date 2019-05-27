import 'package:flutter/material.dart';
import 'shared/app_color.dart';
import 'views/dashboard.dart';
import 'views/income.dart';
import 'views/outcome.dart';
import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keto',
      theme: ThemeData(
        primaryColor: primary,
        primaryTextTheme: TextTheme(
            title: TextStyle(
                color: Colors.white
            )
        )
      ),
      home: HomeStateFulWidget(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class HomeStateFulWidget extends StatefulWidget {
  HomeStateFulWidget({Key key}) : super(key: key);

  @override
  _HomeStateFulWidgetState createState() => _HomeStateFulWidgetState();
}

TabController _tabController;
class _HomeStateFulWidgetState extends State<HomeStateFulWidget> with SingleTickerProviderStateMixin {

  int _selectedIndex = 0;
  String _title = "Dashboard";
  static const titles = [ "Dashboard", "Income", "OutCome"];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              padding: EdgeInsets.all(4.0),
              iconSize: 34.0,
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/takenote', arguments: 0);
              },
            ),
          ],
        ),
        body: switchPage(_selectedIndex),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              text: "Dashboard",
              icon: new Icon(Icons.assignment),
            ),
            Tab(
              text: "Income",
              icon: new Icon(Icons.attach_money),
            ),
            Tab(
              text: "Outcome",
              icon: new Icon(Icons.mood_bad),
            ),
          ],
          controller: _tabController,
          labelColor: primary,
          unselectedLabelColor: bottomBarInactive,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget switchPage(int index) {
    switch(index) {
      case 0: return Dashboard();
      case 1: return Income();
      case 2: return Outcome();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _title = titles[index];
      _selectedIndex = index;
    });
  }

}
