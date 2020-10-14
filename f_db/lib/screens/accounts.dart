import 'package:f_db/screens/edit_account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/account.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<List<Account>>(context);

    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Center(child: Text('Accounts')),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProduct()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: (accounts != null)
            ? ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        IconButton(icon: Icon(Icons.person), onPressed: null),
                    title: Text(accounts[index].name),
                    trailing: Text(accounts[index].price.toString()),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProduct(accounts[index])));
                    },
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
