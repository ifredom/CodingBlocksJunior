import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'on_board_viewmodel.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(model.title),
              FlatButton(
                onPressed: model.goToHome,
                child: Text('Go to Home'),
              ),
            ],
          ),
        ),
      ), 
      viewModelBuilder: () => OnBoardViewModel(),
    );
  }
}
