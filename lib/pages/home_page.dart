import 'package:flutter/material.dart';
import 'package:hello_app/components/item_note.dart';
import 'package:hello_app/model/note.dart';

final List<Tea> tea = [
  Tea(0,
      'Черная смородина',
      'https://main-cdn.sbermegamarket.ru/big2/hlr-system/-53/187/341/930/623/100059988726b0.jpg',
      'Смесь цейлонского и индийского чёрного чая с добавлением листа и ягод чёрной смородины',
      'Цена: 450 руб/100 г'),
  Tea(1,
      'Молочный улун',
      'https://cdn1.ozone.ru/s3/multimedia-1-h/7025810489.jpg',
      'Китайский улун с карамельным ароматом и сливочными оттенками во вкусе',
      'Цена: 420 руб/100 г'),
  Tea(2,
      'Цейлон рухуна',
      'https://cdn.100sp.ru/pictures/103638444',
      'Чай из южной части Шри-Ланки с цветочным ароматом и насыщенным вкусом с нотами ириса, дерева и мёда',
      'Цена: 360 руб/100 г'),
  Tea(3,
      'Ганпаудер',
      'https://bergamotik.ru/upload/iblock/b26/b26418c08e1aa21075f2dfcee2a87dc2.jpg',
      'Классический насыщенный зелёный чай из Китая, скрученный в шарики',
      'Цена: 270 руб/100 г'),
  Tea(4,
      'Тегуаньинь',
      'https://avatars.mds.yandex.net/get-mpic/11764182/2a0000018afe58653142943baef9c142fa4c/orig',
      'Популярный китайский улун со свежим цветочным ароматом и насыщенным глубоким вкусом с нотами орхидеи и ириса',
      'Цена: 450 руб/100 г'),
  Tea(5,
      'Гречишный',
      'https://8gramm.ru/wa-data/public/shop/products/28/31/3128/images/4683/4683.970.jpg',
      'Тизан с лёгким сладковатым ароматом, с оттенками ореха и овсяного печенья',
      'Цена: 380 руб/100 г'),
  Tea(6,
      'Липовый',
      'https://xn--e1aaalojbdrrfdi7p.xn--p1ai/upload/iblock/55f/55fa7b9b088ce9312c74e428319c5814.JPG',
      'Китайская сенча с лимонной травой, листьями липы, цедрой лимона, ромашкой и вербеной',
      'Цена: 400 руб/100 г'),
  Tea(7,
      'Вишневый',
      'https://cdn1.ozone.ru/multimedia/1037475173.jpg',
      'Индийский чёрный чай с кусочками вишни, корицей и вишнёвым листом',
      'Цена: 500 руб/100 г'),
  Tea(8,
      'Барбарисовый',
      'https://avatars.mds.yandex.net/get-mpic/5290046/img_id1883767293663323622.jpeg/orig',
      'Смесь цейлонского и индийского чёрного чая с ягодами барбариса и клубники, кусочками ананаса и папайи, лепестками розы, календулы и василька',
      'Цена: 420 руб/100 г'),
  Tea(9,
      'Маласа',
      'https://lavka.demomax.ru/upload/iblock/204/2042b818e0969b0ee95e563f250b0955.jpg',
      'Смесь чёрного цейлонского и индийского чая с корицей, анисом, фенхелем, имбирём, гвоздикой и чёрным перцем',
      'Цена: 400 руб/100 г'),
];
  class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _addNewNoteDialog(BuildContext context) async {
    String name = '';
    String description = '';
    String image = '';
    String price = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить новый чай'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Название'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Описание'),
                onChanged: (value) {
                  description = value;
                },
              ),
              TextField(
                  decoration: const InputDecoration(labelText: 'Картинка'),
                  onChanged: (value){
                    image = value;
                  }
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Цена'),
                onChanged: (value) {
                  price = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Добавить'),
              onPressed: () {
                if (name.isNotEmpty && image.isNotEmpty && description.isNotEmpty && price.isNotEmpty) {
                  setState(() {
                    tea.add(
                      Tea(
                        tea.length,
                          name,
                          image,
                          description,
                          price,
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чай'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: tea.length,
          itemBuilder: (BuildContext context, int index) {
            final teaItem = tea[index];
            return Dismissible(
              key: Key(teaItem.id.toString()),
              onDismissed: (direction) {
                setState(() {
                  tea.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${teaItem.name} был удален')),
                );
              },
              background: Container(color: Colors.red),
              child: ItemNote(
                tea: teaItem,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 80.0,
          height: 80.0,
          child: FloatingActionButton(
            onPressed: () {
              _addNewNoteDialog(context);
            },
            backgroundColor: Colors.white.withOpacity(0.8),
            foregroundColor: Colors.white,
            splashColor: Colors.white60,
            elevation: 10.0,
            child: const Icon(
              Icons.add,
              size: 40.0,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}