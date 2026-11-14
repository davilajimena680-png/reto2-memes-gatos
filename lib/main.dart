import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/cat_meme/data/datasources/cat_meme_remote_datasource.dart';
import 'features/cat_meme/data/repositories/cat_meme_repository_impl.dart';
import 'features/cat_meme/domain/usecases/build_cat_meme_url.dart';
import 'features/cat_meme/presentation/pages/cat_meme_page.dart';
import 'features/cat_meme/presentation/providers/cat_meme_provider.dart';

void main() {
  // Composicion de dependencias: datasource -> repositorio -> caso de uso.
  const dataSource = CatMemeRemoteDataSource();
  const repository = CatMemeRepositoryImpl(dataSource);
  const buildCatMemeUrl = BuildCatMemeUrl(repository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => CatMemeProvider(buildCatMemeUrl),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memes de Gatos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: const CatMemePage(),
    );
  }
}
