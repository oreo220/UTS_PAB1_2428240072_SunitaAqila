
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_2428240072/models/gado_gado.dart';

class DetailScreen extends StatefulWidget {
  final GadoGado modelGadoGado;

  const DetailScreen({
    super.key,
    required this.modelGadoGado,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isFavorite;

  final Color darkGreen = const Color(0xFF315C45);
  final Color orange = const Color(0xFFE69A45);
  final Color background = const Color(0xFFFAF7F0);

  @override
  void initState() {
    super.initState();
    isFavorite = widget.modelGadoGado.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar utama
            Stack(
              children: [
                Image.asset(
                  widget.modelGadoGado.imageAsset,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 45,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isFavorite ? Colors.red : darkGreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  Text(
                    widget.modelGadoGado.name,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: darkGreen,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Informasi makanan
                  _buildInfo(
                    Icons.place_rounded,
                    'Asal',
                    widget.modelGadoGado.location,
                    const Color(0xFFCB7855),
                  ),

                  _buildInfo(
                    Icons.spa_rounded,
                    'Bahan Utama',
                    widget.modelGadoGado.mainIngredient,
                    const Color(0xFF6D9B67),
                  ),

                  _buildInfo(
                    Icons.ramen_dining_rounded,
                    'Disajikan',
                    widget.modelGadoGado.serving,
                    const Color(0xFFE69A45),
                  ),

                  const SizedBox(height: 22),

                  // Deskripsi
                  Text(
                    'Tentang Hidangan',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: darkGreen,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.modelGadoGado.description,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      height: 1.8,
                      color: const Color(0xFF625E55),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Galeri
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Galeri Foto',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: darkGreen,
                        ),
                      ),
                      Icon(
                        Icons.photo_library_rounded,
                        color: orange,
                        size: 23,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.modelGadoGado.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 135,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl:
                                  widget.modelGadoGado.imageUrls[index],
                              fit: BoxFit.cover,
                              placeholder: (context, url) {
                                return Container(
                                  color: Colors.black12,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  color: Colors.black12,
                                  child: const Icon(
                                    Icons.image_not_supported_rounded,
                                    size: 35,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Identitas mahasiswa
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EEDC),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFD3DFC5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.school_rounded,
                              color: darkGreen,
                              size: 22,
                            ),
                            const SizedBox(width: 9),
                            Text(
                              'Identitas Mahasiswa',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: darkGreen,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        Text(
                          'Nama : Sunita Aqila',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: const Color(0xFF52634F),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'NPM : 2428240072',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: const Color(0xFF52634F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget informasi makanan
  Widget _buildInfo(
    IconData icon,
    String title,
    String value,
    Color iconColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.13),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 21,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF393C35),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
