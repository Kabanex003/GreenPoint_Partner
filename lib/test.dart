import 'package:flutter/material.dart';

class GreenPoint extends StatefulWidget {
  const GreenPoint({super.key});

  @override
  State<GreenPoint> createState() => _GreenPointState();
}

class _GreenPointState extends State<GreenPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildCategoryChips(),
            _buildTabs(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildFeaturedCard(),
                  const SizedBox(height: 24),
                  _buildShopListHeader(),
                  const SizedBox(height: 16),
                  _buildShopItem(
                    name: 'G1',
                    rating: '4.3 (99 รีวิว)',
                    distance: '116.5 km',
                    tags: ['รักษ์โลก', 'Eco-Friendly', 'แก้วพกพา'],
                    image: 'assets/sunflower.png', // เปลี่ยนเป็น path รูปของคุณ
                  ),
                  _buildShopItem(
                    name: 'Light up cafe x Nimman',
                    rating: '4.2 (22 รีวิว)',
                    distance: '115.5 km',
                    tags: [],
                    isLocked: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- ส่วนของ Widget ย่อยๆ ---

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          const Icon(Icons.eco, color: Colors.green),
          const SizedBox(width: 8),
          const Text('GreenPoint', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black54),
              onPressed: () {},
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'ค้นหาร้านค้า, ประเภท, สถานที่...',
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: Icon(Icons.tune, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _chipItem('ทั้งหมด', Icons.grid_view, true),
          _chipItem('คาเฟ่', Icons.local_cafe, false),
          _chipItem('ร้านอาหาร', Icons.restaurant, false),
          _chipItem('ช้อปปิ้ง', Icons.shopping_bag, false),
        ],
      ),
    );
  }

  Widget _chipItem(String label, IconData icon, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isActive ? Colors.green : Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: isActive ? Colors.white : Colors.black87),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: Row(
        children: [
          _tabItem('รายชื่อร้าน', true),
          _tabItem('แผนที่', false),
        ],
      ),
    );
  }

  Widget _tabItem(String label, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: isActive ? Colors.green : Colors.transparent, width: 2)),
        ),
        child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: isActive ? Colors.green : Colors.grey, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildFeaturedCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.eco, size: 14, color: Colors.green),
                SizedBox(width: 4),
                Text('ร้านที่คุณสนับสนุนมากที่สุด', style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('11', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Icon(Icons.check_circle, color: Colors.green, size: 18),
                    ],
                  ),
                  const Text('4.8 | คาเฟ่ | 116.4 km', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('แต้มสะสมจากร้านนี้', style: TextStyle(fontSize: 10, color: Colors.grey)),
                            Text('0 GP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                          ],
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
                    child:Image.network('https://mnrhcoopshop.com/uploadpicpdc/202501219388543.jpg',fit: BoxFit.cover,) // แทนที่ด้วย Image.asset
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: StadiumBorder()),
                    child: const Text('ดูรายละเอียด'),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShopListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('ร้านค้าที่ร่วมโครงการ GreenPoint', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: const [
            Text('เรียงตาม: ', style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text('ใกล้ที่สุด', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        )
      ],
    );
  }

  Widget _buildShopItem({required String name, required String rating, required String distance, required List<String> tags, bool isLocked = false, String? image}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
            child: Icon(isLocked ? Icons.lock_outline : Icons.store, color: Colors.grey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    const Icon(Icons.check_circle, color: Colors.green, size: 14),
                  ],
                ),
                Text('$rating | $distance', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                if (tags.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Wrap(
                      spacing: 4,
                      children: tags.map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(4)),
                        child: Text(t, style: const TextStyle(color: Colors.green, fontSize: 10)),
                      )).toList(),
                    ),
                  )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('แต้มจากร้าน', style: TextStyle(fontSize: 9, color: Colors.grey)),
              const Text('0 GP', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              const SizedBox(height: 4),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(0, 24),
                ),
                child: const Text('ดูรายละเอียด', style: TextStyle(fontSize: 10, color: Colors.green)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: 1, // เลือกหน้า Partner Store
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Partner Store'),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}