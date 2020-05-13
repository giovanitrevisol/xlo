import 'package:rxdart/rxdart.dart';

class DrawerBloc {
  final BehaviorSubject<int> _pageController = BehaviorSubject<int>.seeded(0);

  Stream<int> get outPage => _pageController.stream;

  int _page = 0;

  void setPage(int page) {
    if (page == _page)
      return; //pagina inicial setada com 0 - se a pg tocado for a mesma return senao muda de página
    _page = page;
    _pageController.add(page);
  }

  void dispose() {
    _pageController.close();
  }
}
