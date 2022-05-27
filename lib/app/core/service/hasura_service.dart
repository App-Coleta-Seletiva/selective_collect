import 'package:hasura_connect/hasura_connect.dart';

const key_hasura = 'SXDL1ydEw2V9FGFn3k07v4btrC4FmqGTu89954O64zXcBG0OMVvtWJyCIAhgORa4';
const collectUrl = 'https://selective-collect.hasura.app/v1/graphql';

class HasuraService {
  final _hasuraConnection = HasuraConnect(collectUrl,headers: {
    'x-hasura-admin-secret' : key_hasura
  });


  HasuraService._instance();
  static final _internal = HasuraService._instance();

  factory HasuraService() => _internal;
  HasuraConnect get connect => _hasuraConnection;
}