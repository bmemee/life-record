import 'package:drift/drift.dart';

import 'connection_native.dart'
    if (dart.library.html) 'connection_web.dart';

export 'connection_native.dart'
    if (dart.library.html) 'connection_web.dart';
