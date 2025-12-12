import 'package:flutter/material.dart';

void main() {
  runApp(const BookingApp());
}

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BookingHomePage(),
    );
  }
}

class BookingHomePage extends StatelessWidget {
  const BookingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF003580), // màu xanh đậm Booking
        toolbarHeight: 0, // ẩn thanh AppBar mặc định
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm vị trí + ngày
          Container(
            color: const Color(0xFF003580),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: const Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black54),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Xung quanh vị trí hiện tại   23 thg 10 - 24 thg 10",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 👉 Dòng “757 chỗ nghỉ”
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 6, bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "757 chỗ nghỉ",
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ),
          ),

          // Thanh công cụ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _topButton(Icons.sort, "Sắp xếp"),
                _topButton(Icons.filter_alt_outlined, "Lọc"),
                _topButton(Icons.map_outlined, "Bản đồ"),
              ],
            ),
          ),

          // Danh sách khách sạn
          Expanded(
            child: ListView(
              children: [
                _hotelCard(
                  image: "assets/image1.png",
                  breakfast: true,
                  name: "aNhill Boutique",
                  rating: 9.5,
                  reviews: 95,
                  location: "Huế - Cách bạn 0,6km",
                  room: "1 suite riêng tư: 1 giường",
                  price: 109,
                  currency: "US\$",
                  reviewLabel: "Xuất sắc",
                ),
                _hotelCard(
                  image: "assets/image2.png",
                  breakfast: true,
                  name: "An Nam Hue Boutique",
                  rating: 9.2,
                  reviews: 34,
                  location: "Cư Chinh - Cách bạn 0,9km",
                  room: "1 phòng khách sạn: 1 giường",
                  price: 20,
                  currency: "US\$",
                  reviewLabel: "Tuyệt hảo",
                ),
                _hotelCard(
                  image: "assets/image3.png",
                  breakfast: false,
                  name: "Huế Jade Hill Villa",
                  rating: 8.0,
                  reviews: 1,
                  location: "Cư Chinh - Cách bạn 1,3km",
                  room:
                      "1 biệt thự nguyên căn - 1000m²: 4 giường, 3 phòng ngủ",
                  price: 285,
                  currency: "US\$",
                  reviewLabel: "Rất tốt",
                  extra: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 4),
                      Text(
                        "Chỉ còn 1 căn với giá này trên Booking.com",
                        style: TextStyle(color: Colors.red, fontSize: 11),
                      ),
                      Text(
                        "✓ Không cần thanh toán trước",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                _hotelCard(
                  image: "assets/image4.png",
                  breakfast: true,
                  name: "Êm Villa",
                  rating: 8.8,
                  reviews: 12,
                  location: "Huế - Cách bạn 2,1km",
                  room: "1 biệt thự: 2 phòng ngủ, 1 phòng khách",
                  price: 75,
                  currency: "US\$",
                  reviewLabel: "Rất tốt",
                  extra: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 4),
                      Text(
                        "Chỉ còn 1 căn với giá này trên Booking.com",
                        style: TextStyle(color: Colors.red, fontSize: 11),
                      ),
                      Text(
                        "✓ Không cần thanh toán trước",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Nút trên hàng đầu
  static Widget _topButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  // Thẻ khách sạn (ảnh trái - thông tin phải)
  static Widget _hotelCard({
    required String image,
    required String name,
    required double rating,
    required int reviews,
    required String location,
    required String room,
    required double price,
    required String currency,
    required String reviewLabel,
    required bool breakfast,
    Widget? extra,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh khách sạn bên trái
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  image,
                  height: 120,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              // ❤️ Nút trái tim
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.favorite_border,
                        color: Colors.black54, size: 18),
                  ),
                ),
              ),
            ],
          ),

          // Nội dung bên phải
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (breakfast)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "Bao bữa sáng",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          rating.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "$reviewLabel - $reviews đánh giá",
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(location, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(room, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 6),
                  Text(
                    "$currency$price",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Text(
                    "Đã bao gồm thuế và phí",
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  if (extra != null) extra,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
