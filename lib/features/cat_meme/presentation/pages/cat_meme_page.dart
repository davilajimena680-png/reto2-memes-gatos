import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cat_meme_provider.dart';
import '../widgets/filter_selector.dart';
import '../widgets/meme_image.dart';

class CatMemePage extends StatefulWidget {
  const CatMemePage({super.key});

  @override
  State<CatMemePage> createState() => _CatMemePageState();
}

class _CatMemePageState extends State<CatMemePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _apply() {
    FocusScope.of(context).unfocus();
    context.read<CatMemeProvider>().applyText(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CatMemeProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Generador de Memes de Gatos')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            MemeImage(
              url: provider.meme.imageUrl,
              onRetry: provider.newCat,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLength: 60,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _apply(),
              decoration: InputDecoration(
                labelText: 'Escribe tu frase',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.check),
                  tooltip: 'Aplicar texto',
                  onPressed: _apply,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text('Filtro', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            FilterSelector(
              selected: provider.filter,
              onSelected: provider.selectFilter,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: provider.newCat,
              icon: const Icon(Icons.refresh),
              label: const Text('Otro gato'),
            ),
          ],
        ),
      ),
    );
  }
}
