import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDedados {
  String codeSQL =
      'CREATE TABLE produto(id INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT,descricao TEXT,quantidade TEXT,valor TEXT)';
  String codeSQL1 =
      'CREATE TABLE carrinho(id INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT,quantidade TEXT,valor TEXT)';
  final nomeBancoDados = 'v3';
  BancoDedados._init();
  static final BancoDedados instance = BancoDedados._init();
  static Database? _dados;
  Future<Database?> get dados async {
    if (_dados != null) return _dados;

    return _dados = await iniciaBancoDeDados(nomeBancoDados);
  }

  Future<Database> iniciaBancoDeDados(String filePath) async {
    return await openDatabase(join(await getDatabasesPath(), nomeBancoDados),
        version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(codeSQL);
    await db.execute(codeSQL1);
  }
}
