import 'package:litpad/core/core.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BaseVM()),
  ChangeNotifierProvider(create: (_) => SignUpVM()),
  ChangeNotifierProvider(create: (_) => LoginVM()),
];
