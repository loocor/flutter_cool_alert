import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Alert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cool Alert'),
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    final successAlert = _buildButton(
      onTap: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Transaction completed successfully!",
        );
      },
      text: "Success",
      color: Colors.green,
    );

    final errorAlert = _buildButton(
      onTap: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Oops...",
          text: "Sorry, something went wrong",
        );
      },
      text: "Error",
      color: Colors.red,
    );

    final warningAlert = _buildButton(
      onTap: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          text: "You just broke protocol",
        );
      },
      text: "Warning",
      color: Colors.orange,
    );

    final infoAlert = _buildButton(
      onTap: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: "Buy two, get one free",
        );
      },
      text: "Info",
      color: Colors.blue[100],
    );

    final confirmAlert = _buildButton(
      onTap: () {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.confirm,
            text: "Do you want to logout",
            confirmBtnText: "Yes",
            cancelBtnText: "No",
            confirmBtnColor: Colors.green);
      },
      text: "Confirm",
      color: Colors.lightGreen,
    );

    final loadingAlert = _buildButton(
      onTap: () {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.loading,
        );
      },
      text: "Loading",
      color: Colors.grey,
    );

    final customAlert = _buildButton(
      onTap: () {
        String _message = "";
        CoolAlert.show(
          context: context,
          type: CoolAlertType.custom,
          barrierDismissible: false,
          showCancelBtn: true,
          title: "Message",
          confirmBtnText: "Send",
          widget: TextFormField(
            key: UniqueKey(),
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(hintText: "Please enter the content here"),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            onChanged: (value) => _message = value,
          ),
          onConfirmBtnTap: () async {
            if (_message.length < 5) {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.warning,
                text: "Please input something",
              );
              return;
            }
            Navigator.pop(context);
            await Future.delayed(Duration(milliseconds: 1000));
            CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              text: "The message '$_message' has been sent.",
            );
          },
        );
      },
      text: "Custom",
      color: Colors.orange,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            successAlert,
            errorAlert,
            warningAlert,
            infoAlert,
            confirmAlert,
            loadingAlert,
            customAlert,
          ],
        ),
      ),
    );
  }

  Widget _buildButton({VoidCallback onTap, String text, Color color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: MaterialButton(
        color: color,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
