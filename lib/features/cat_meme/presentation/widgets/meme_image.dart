import 'package:flutter/material.dart';

/// Muestra la imagen del gato con estados de carga y error.
class MemeImage extends StatelessWidget {
  const MemeImage({super.key, required this.url, required this.onRetry});

  final String url;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ColoredBox(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Image.network(
            url,
            key: ValueKey(url),
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stack) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.pets, size: 48),
                    const SizedBox(height: 8),
                    const Text('No se pudo cargar el gato'),
                    TextButton(
                      onPressed: onRetry,
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
