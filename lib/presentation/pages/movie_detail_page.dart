import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/movie.dart';
import '../../utils/constants.dart';

class MovieDetailPage extends ConsumerWidget {
  final Movie movie;

  const MovieDetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              actions: [_buildCloseButton(context)],
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  movie.title,
                  style: GoogleFonts.sunflower(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                background: _buildFlexibleSpaceBarBackground(),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildMovieInfoSection(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black54,
      ),
      child: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildFlexibleSpaceBarBackground() {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
          stops: [0.5, 0.9],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        imageUrl: '${Constants.BASE_IMAGE_URL}${movie.backdropPath}',
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const SizedBox.shrink(),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMovieInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white10,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 14,
                ),
                const SizedBox(width: 2),
                Text('${(movie.voteAverage ?? 0).toStringAsFixed(1)}/10'),
                const SizedBox(width: 2),
                Text(
                  '(${movie.voteCount ?? 0})',
                  style: const TextStyle(color: Colors.lightBlue),
                ),
                const Spacer(),
                Text(movie.releaseDate ?? ''),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            movie.overview ?? '',
            style: GoogleFonts.nanumGothic(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
