import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class NavTab {
  NavTab({required this.rootName, required this.label, required this.icon});

  final String rootName;
  final String label;
  final Widget icon;

  final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
}

class NavProvider extends ChangeNotifier {
  NavProvider(Map<String, NavTab> tabs) {
    int index = 0;
    _tabs.addAll(tabs);
    _tabs.forEach((key, _) {
      _tabIndex[key] = index++;
    });
    _currentTab = _tabs.keys.first;
  }

  String _currentTab = '';
  final Map<String, int> _tabIndex = {};
  final Map<String, NavTab> _tabs = {};

  int get currentTabIndex => _tabIndex[_currentTab] ?? 0;

  List<NavTab> get tabs => _tabs.values.toList();

  void setTab(String tabName) {
    if (_tabs[tabName] != null) {
      // If the user is already on this tab, pop the entire stack
      if (tabName == _currentTab) {
        _tabs[_currentTab]
            ?.navigatorState
            .currentState
            ?.popUntil((route) => route.isFirst);
      } else {
        _currentTab = tabName;
        notifyListeners();
      }
    }
  }

  void setTabIndex(int index) {
    final tabName = _tabs.keys.elementAt(index);
    setTab(tabName);
  }

  Future<bool> onWillPop(BuildContext context) async {
    final navState = _tabs[_currentTab]?.navigatorState.currentState;
    if (navState?.canPop() == true) {
      // Normal case
      navState?.pop();
      return false;
    } else if (_currentTab != _tabs.keys.first) {
      // If the user is at the root of the nav stack
      // and they are not on the first stack, move to the first stack
      setTabIndex(0);
      notifyListeners();
      return false;
    }
    return true;
  }
}
