import 'package:flutter_application_1/Banco%20de%20dados/sql.dart';
import 'package:sqflite/sqlite_api.dart';

Database? db;
//===================================================
//            Inserir dados
Future<int> inserirDados(
    {nome = '', descricao = '', quantidade = '', valor = ''}) async {
  Map<String, dynamic> data = Map<String, dynamic>();
  data['nome'] = (nome).toString();
  data['descricao'] = (descricao).toString();
  data['quantidade'] = (quantidade).toString();
  data['valor'] = (valor).toString();
  try {
    db = await BancoDedados.instance.dados;
    int n = await db!.insert('produto', data);
    return n;
  } catch (e) {
    print(e);
    return 0;
  }
}

//===================================================
//            Inserir dados por Codigo sql
Future<int> inserirDadosSQL(
    {tbnome = 'produto',
    nome = '',
    descricao = '',
    quantidade = '',
    valor = ''}) async {
  Map<String, dynamic> data = Map<String, dynamic>();
  data['nome'] = (nome).toString();
  data['descricao'] = (descricao).toString();
  data['quantidade'] = (quantidade).toString();
  data['valor'] = (valor).toString();
  try {
    db = await BancoDedados.instance.dados;
    int n = await db!.rawInsert(
        "INSERT INTO $tbnome(nome,descricao,quantidade,valor) VALUES( '$nome','$descricao','$quantidade','$valor' )");
    return n;
  } catch (e) {
    print(e);
    return 0;
  }
}

//===================================================
//            Inserir dados por Codigo sql  -- tbcarrinho
Future<int> inserirDadosSQLTBcarrinho(
    {tbnome = 'carrinho',
    nome = '',
    descricao = '',
    quantidade = '',
    valor = ''}) async {
  Map<String, dynamic> data = Map<String, dynamic>();
  data['nome'] = (nome).toString();
  data['quantidade'] = (quantidade).toString();
  data['valor'] = (valor).toString();
  try {
    db = await BancoDedados.instance.dados;
    int n = await db!.rawInsert(
        "INSERT INTO $tbnome(nome,quantidade,valor) VALUES( '$nome','$quantidade','$valor' )");
    return n;
  } catch (e) {
    print(e);
    return 0;
  }
}

//===================================================
//            Buscar dados
Future<List> BuscarDados({tbnome = 'produto', nome = ''}) async {
  String variavel = 'WHERE nome= "$nome"';
  if (nome.length == 0) variavel = '';

  List<Map<String, dynamic>> data;
  try {
    db = await BancoDedados.instance.dados;
    data = await db!.rawQuery('SELECT * FROM $tbnome $variavel');
    return data;
  } catch (e) {
    print(e);
    data = [];
    return data;
  }
}

//===================================================
//            Buscar unico dados
Future<List> BuscarUnicoDados({tbnome = 'produto', nome = ''}) async {
  String variavel = 'WHERE nome= "$nome"';
  // if (nome.length == 0) variavel = '';

  List<Map<String, dynamic>> data;
  try {
    db = await BancoDedados.instance.dados;
    data = await db!.rawQuery('SELECT * FROM $tbnome $variavel');
    return data;
  } catch (e) {
    print(e);
    return [];
  }
}

//===================================================
//            Alterar dados
AlterarDados(
    {tbnome = 'produto',
    nome = '',
    descricao = '',
    quantidade = '',
    valor = '',
    id}) async {
  try {
    db = await BancoDedados.instance.dados;
    //========================================
    if (nome.length > 0) {
      await db!.rawUpdate('UPDATE $tbnome SET nome = "$nome" WHERE id= $id');
    }
    //========================================
    if (descricao.length > 0) {
      await db!.rawUpdate(
          'UPDATE $tbnome SET descricao = "$descricao" WHERE id= $id');
    }
    //========================================
    if (quantidade.length > 0) {
      await db!.rawUpdate(
          'UPDATE $tbnome SET quantidade = "$quantidade" WHERE id= $id');
    }
    //========================================
    if (valor.length > 0) {
      await db!.rawUpdate('UPDATE $tbnome SET valor = "$valor" WHERE id= $id');
    }
    //========================================

  } catch (e) {
    print(e);
  }
}

//===================================================
//            Alterar dados
AlterarDadosprloNome({
  tbnome = 'produto',
  nome = '',
  quantidade = '',
}) async {
  try {
    db = await BancoDedados.instance.dados;

    //========================================

    await db!.rawUpdate(
        'UPDATE $tbnome SET quantidade = "$quantidade" WHERE nome= "$nome" ');

    //========================================

  } catch (e) {
    print(e);
  }
}

//===================================================
//            Buscar dados
deleteDados(id) async {
  try {
    db = await BancoDedados.instance.dados;
    await db!.rawDelete('DELETE FROM produto WHERE id= $id ');
  } catch (e) {
    print(e);
  }
}

//===================================================
//            Buscar dadostb carrinho
deleteDadosTbcarrinho(id) async {
  try {
    db = await BancoDedados.instance.dados;
    await db!.rawDelete('DELETE FROM carrinho WHERE id= $id ');
  } catch (e) {
    print(e);
  }
}

//===================================================
//            Buscar dados
deleteTB(tbnome) async {
  try {
    db = await BancoDedados.instance.dados;
    await db!.rawDelete('DROP TABLE $tbnome');
  } catch (e) {
    print(e);
  }
}

//===================================================
//            Buscar dados
deletetodosDados(tbnome) async {
  try {
    db = await BancoDedados.instance.dados;
    await db!.rawDelete('DELETE FROM $tbnome ');
  } catch (e) {
    print(e);
  }
}
