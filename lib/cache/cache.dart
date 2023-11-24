import 'package:flutter/material.dart';
import 'package:lecture_one/cache/cache.provider.dart';
import 'package:provider/provider.dart';

class CachePage extends StatefulWidget {
  const CachePage({super.key});

  @override
  _CachePageState createState() => _CachePageState();
}

class _CachePageState extends State<CachePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _loadData() async {
    await Provider.of<CacheProvider>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();

    return Scaffold(
        appBar: AppBar(),
        body: Consumer<CacheProvider>(builder: (context, cacheProvider, child) {
          return ListView.builder(
              itemCount: cacheProvider.users.length,
              itemBuilder: (context, index) {
                final user = cacheProvider.users[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Name: ${user.name}'),
                            Text('Email: ${user.email}'),
                            Text('Phone: ${user.phone}'),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              });
        }));
  }
}
