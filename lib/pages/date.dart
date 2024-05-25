import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Candidate {
  final String name;
  final String bio;
  final String imageUrl;

  Candidate({required this.name, required this.bio, required this.imageUrl});
}

List<Candidate> candidates = [
  Candidate(
    name: 'John Doe',
    bio:
        'Passionate about technology and innovation. Loves coding and building cool apps.',
    imageUrl: 'https://picsum.photos/200/300',
  ),
  Candidate(
    name: 'Jane Smith',
    bio:
        'Adventurous spirit with a passion for travel. Enjoys exploring new cultures and cuisines.',
    imageUrl:
        'https://i.imgur.com/TCuH33Z_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Alex Johnson',
    bio:
        'Fitness enthusiast and health advocate. Enjoys outdoor activities and staying active.',
    imageUrl:
        'https://i.imgur.com/bDBhYCF_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Emily Brown',
    bio:
        'Artistic soul with a love for painting and photography. Expresses creativity in various forms.',
    imageUrl:
        'https://i.imgur.com/Wpcduz7_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Michael Lee',
    bio:
        'Music lover and aspiring musician. Plays multiple instruments and enjoys composing.',
    imageUrl:
        'https://i.imgur.com/FuRY8YK_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Olivia Taylor',
    bio:
        'Bookworm and literature enthusiast. Finds joy in reading and discussing great novels.',
    imageUrl:
        'https://i.imgur.com/IRUns4S_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Daniel Garcia',
    bio:
        'Foodie at heart with a passion for culinary arts. Enjoys experimenting with new recipes.',
    imageUrl:
        'https://i.imgur.com/U7cdJCv_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Sophia Kim',
    bio:
        'Environmental activist and nature lover. Works towards creating a sustainable future.',
    imageUrl:
        'https://i.imgur.com/8NJKuAU_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'William Robinson',
    bio:
        'Sports enthusiast with a love for soccer and basketball. Enjoys playing and watching games.',
    imageUrl:
        'https://i.imgur.com/sQmsMuI_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Ava Martinez',
    bio:
        'Tech geek with a keen interest in artificial intelligence. Enjoys coding and robotics.',
    imageUrl:
        'https://i.imgur.com/Xg6l8Zi_d.jpg?maxwidth=520&shape=thumb&fidelity=high',
  ),
  Candidate(
    name: 'Ella Anderson',
    bio:
        'Passionate dancer and choreographer. Expresses emotions through the art of dance.',
    imageUrl:
        'https://i.imgur.com/yKh2a2W_d.webp?maxwidth=520&shape=thumb&fidelity=high',
  ),
];

class ExampleCard extends StatelessWidget {
  final Candidate candidate;

  const ExampleCard({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
            child: Image.network(
              candidate.imageUrl,
              height: 800,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 88.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    candidate.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    candidate.bio,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateScreen extends StatefulWidget {
  const DateScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  final CardSwiperController controller = CardSwiperController();

  final cards =
      candidates.map((candidate) => ExampleCard(candidate: candidate)).toList();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAKE FRIENDS',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(
            255, 0, 0, 0), // Set the app bar background color to yellow
      ),
      backgroundColor: const Color.fromARGB(
          255, 9, 9, 9), // Set the scaffold background color to yellow

      body: Stack(
        children: [
          Positioned.fill(
            child: CardSwiper(
              controller: controller,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 1,
              backCardOffset: const Offset(40, 40),
              padding: EdgeInsets.zero, // No padding
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) =>
                  cards[index],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.undo,
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/r.png', height: 70, width: 70),
                  ),
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.left),
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/c.png', height: 70, width: 70),
                  ),
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.top),
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/sl.png', height: 70, width: 70),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.right),
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/l.png', height: 70, width: 70),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // Handle boost button press
                      // Add your custom logic here
                    },
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/b.png', height: 70, width: 70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );

    // Allow swiping in all directions except down
    return direction != CardSwiperDirection.bottom;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undone from the ${direction.name}',
    );
    return true;
  }
}
