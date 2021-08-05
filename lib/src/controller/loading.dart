import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingController {
  BuildContext context;
  LoadingController({this.context, this.loading});

  Future loading;
}
