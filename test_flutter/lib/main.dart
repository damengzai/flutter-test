import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_flutter/StackTop/StackTop.dart';
import 'package:test_flutter/WOW/AnimatedCrossFadeWidget.dart';
import 'package:test_flutter/WOW/AnimatedIconWidget.dart';
import 'package:test_flutter/WOW/AnimatedListWidget.dart';
import 'package:test_flutter/WOW/AnimatedSwitcherWidget.dart';
import 'package:test_flutter/WOW/AnimatedImplicitWidget.dart';
import 'package:test_flutter/WOW/DismissibleWidget.dart';
import 'package:test_flutter/WOW/ExplicitAnimationWidget.dart';
import 'package:test_flutter/WOW/TransitionWidget.dart';
import 'package:test_flutter/WOW/TweenAnimationBuildWidget.dart';
import 'package:test_flutter/customWidget/CustomWidget.dart';
import 'package:test_flutter/detail/index.dart';
import 'package:test_flutter/dio/request.dart';
import 'package:test_flutter/home/QHomePage.dart';
import 'package:test_flutter/listview/views/refresh_list_view_demo.dart';
import 'package:test_flutter/login/Home.dart';
import 'package:test_flutter/login/constantParam.dart';
import 'package:test_flutter/login/login.dart';
import 'package:test_flutter/nesScrollView/pages/dou_yin_ping_lun.dart';
import 'package:test_flutter/nesScrollView/pages/dynamic_pinned_header_height.dart';
import 'package:test_flutter/nesScrollView/pages/extened_nested_scroll_view_demo.dart';
import 'package:test_flutter/nesScrollView/pages/load_more.dart';
import 'package:test_flutter/nesScrollView/pages/main_page.dart';
import 'package:test_flutter/nesScrollView/pages/pull_to_refresh.dart';
import 'package:test_flutter/nesScrollView/pages/scroll_to_top.dart';
import 'package:test_flutter/provider/providerRoute.dart';
import 'package:test_flutter/suspensionView/index_suspension.dart';
import 'package:test_flutter/ui/FrameLayout.dart';
import 'package:test_flutter/ui/LinearLayout.dart';
import 'package:test_flutter/ui/activity/CActivity.dart';
import 'package:test_flutter/viewpager/view_pager_demo.dart';

import 'animation/animated_container_app.dart';
import 'animation/animated_list/animated_list_sample.dart';
import 'animation/explicit_animation/explicit_animation_page.dart';
import 'animation/fade_in_and_out_box.dart';
import 'animation/hero/hero_animation.dart';
import 'animation/hero/hero_animation_page2.dart';
import 'animation/hero/radial/radial_hero_animation.dart';
import 'customPaintView/draggable_widget_page.dart';
import 'methodChannel/method_channel_page.dart';
const oneYear = ['006279', '320007', '002939', '519674', '003745', '006751', '005911', '002560', '003793', '162703', '213001', '001717', '007581', '004851', '000924', '161903', '000977', '257070', '007579', '001915', '000717', '006002', '004997', '519026', '001645', '005689', '006003', '006228', '007490', '001410', '002482', '006229', '161616', '007491', '000727', '004374', '001822', '000601', '001956', '002408', '004375', '003230', '004075', '161726', '000960', '000404', '003231', '519773', '000452', '007300', '005176', '003956', '001643', '007301', '003095', '460005', '000336', '270050', '000031', '001644', '003096', '002213', '005962', '005805', '000339', '360016', '005310', '005963', '270028', '001069', '000940', '519670', '006257', '290011', '000913', '540010', '001171', '002264', '519133', '000831', '519642', '000780', '001809', '006736', '002124', '200012', '006314', '002669', '004636', '003516', '000522', '005303', '000220', '000939', '161810', '550009', '001701', '005304', '001210', '005668'];
const twoYear = ['006011', '003106', '003105', '001679', '002079', '161903', '002939', '005689', '360016', '519778', '003230', '003231', '003793', '002770', '519002', '005805', '002771', '003853', '000727', '162703', '519674', '001410', '003745', '005885', '001875', '519727', '000977', '519056', '003516', '213001', '519773', '161810', '001643', '002621', '050026', '000924', '005106', '000339', '003956', '001644', '519133', '005825', '005682', '001224', '320007', '001480', '002697', '257070', '005760', '004997', '002669', '001126', '000294', '001579', '001856', '004851', '002692', '005620', '001538', '720001', '001071', '001694', '000601', '001508', '000746', '001852', '000717', '005621', '004075', '001510', '005176', '001104', '290011', '004424', '001445', '003190', '005794', '001543', '005311', '005630', '003984', '002482', '001616', '001985', '001717', '003985', '005541', '002780', '005542', '002124', '003191', '000960', '004374', '003238', '005400', '005312', '004375', '005875', '002980', '002446'];
const threeYear = twoYear;// ['519760', '003106', '003105', '002079', '001679', '003096', '003095', '001508', '000727', '004075', '001510', '213001', '001717', '000924', '002621', '002697', '519056', '519778', '000913', '000220', '161903', '550016', '000960', '050026', '519772', '001766', '001071', '001410', '002939', '000294', '110023', '161616', '002482', '003793', '000339', '002770', '001915', '002708', '003516', '003889', '002771', '003230', '519773', '161726', '003231', '003853', '161606', '162703', '001875', '161725', '003890', '519674', '000751', '519915', '000083', '260108', '001815', '163415', '160222', '002692', '000717', '002082', '160632', '519002', '001224', '003745', '519727', '001714', '001645', '001171', '162605', '001579', '360016', '399011', '501010', '001445', '501009', '460007', '460005', '240020', '001102', '001417', '000878', '001985', '004374', '100039', '000746', '001852', '000879', '000634', '004375', '001513', '000831', '001538', '002124', '001694', '519644', '161035', '002264', '000248'];
const sixMonth = ['161616', '001717', '161726', '006002', '006003', '005620', '001915', '004851', '005621', '002542', '000727', '003230', '050026', '003231', '000960', '501009', '000977', '501010', '004997', '002621', '002697', '161122', '001171', '001679', '002079', '006228', '001218', '006229', '008227', '008228', '005303', '006218', '005304', '005805', '002446', '000294', '121005', '000452', '002124', '001102', '200012', '519171', '004075', '005453', '005454', '001815', '005176', '008370', '002082', '003581', '000831', '002408', '003095', '162006', '007553', '007718', '003096', '007111', '002264', '001558', '270050', '000976', '001559', '005689', '003291', '007835', '006756', '004683', '006757', '000220', '110023', '161035', '163001', '164401', '003284', '001606', '162412', '001398', '000780', '005738', '240020', '000336', '501005', '470008', '519642', '006615', '001040', '501006', '470006', '006616', '310388', '121006', '005680', '005028', '206009', '004905', '004224', '000913', '001365', '002152'];
const threeMonth = ['002542', '001135', '000977', '004997', '001643', '001644', '540008', '002079', '001679', '004640', '560003', '519918', '040020', '001606', '001102', '460010', '001475', '001985', '000336', '002190', '470008', '560002', '001040', '006179', '519702', '005668', '000746', '001616', '001126', '008314', '519670', '005481', '162204', '008315', '000793', '002560', '005004', '481015', '005819', '006250', '160632', '000991', '570008', '481010', '270023', '001156', '040016', '519664', '006604', '370027', '519915', '360016', '570001', '006605', '001838', '519665', '001880', '000529', '163818', '002340', '001476', '519714', '000742', '162006', '004995', '001705', '519026', '005968', '007047', '008371', '001856', '001538', '519008', '001404', '005969', '100060', '001542', '320007', '270028', '001496', '006348', '000880', '000017', '161725', '001490', '000173', '000083', '005453', '005454', '001986', '001365', '006122', '004868', '007084', '005680', '002446', '161706', '000031', '160605', '005472'];
const oneMonth = ['001838', '001475', '004698', '000535', '002251', '004224', '160643', '501019', '163115', '005609', '502003', '000596', '004069', '004070', '002199', '160630', '501016', '502053', '502010', '164402', '160633', '501047', '501048', '000690', '161720', '008590', '008591', '006098', '007531', '003017', '005693', '161024', '002983', '160419', '008960', '163113', '006266', '006269', '161027', '001552', '001553', '004997', '007992', '007993', '160516', '007851', '007850', '001880', '003993', '001607', '004423', '001608', '001606', '004856', '004857', '005968', '005819', '673030', '005969', '460010', '630011', '005248', '008184', '160625', '000742', '398041', '270023', '003304', '008928', '004139', '003305', '008929', '001542', '002263', '003554', '002190', '004351', '168501', '001186', '001725', '202027', '003624', '005207', '003625', '470098', '040020', '001398', '002560', '000336', '002910', '257040', '005802', '000746', '007113', '007114', '001616', '000969', '001667', '040016', '460007'];
//const oneMonth = threeMonth;


void main() {
//  debugPaintBaselinesEnabled = true; // 以可视的方式调试布局，边界
//  debugPaintBaselinesEnabled = true; // 标识组件基线
//  debugPaintPointersEnabled = true; // 标识点击的对象
//  debugPaintLayerBordersEnabled = true; //标识每层边界
//  debugRepaintRainbowEnabled = true; // 重绘时候被一组旋转色覆盖
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: defaultTheme,
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/refreshList': (BuildContext context) => new RefreshListViewDemo(),
          //list列表页
          '/viewPager': (BuildContext context) => new ViewPagerDemo(),
          //viewpager
          '/request': (BuildContext context) => new RequestRoute(),
          //Draggable
          '/draggable': (BuildContext context) => new DraggableWidgetPage(),
          //animation
          '/animation': (BuildContext context) => new AnimatedContainerApp(),
          //fadeInAndOutAnimation
          '/fadeInAndOutAnim': (BuildContext context) => new FadeInAndOutBoxPage(),
          //explicitAnimation 显式动画，更多的实现自己的效果
          '/explicitAnimation': (BuildContext context) => new ExplicitAnimationPage(),
          //AnimatedList
          '/animatedList': (BuildContext context) => new AnimatedListSample(),
          //HeroAnimation
          '/heroAnimation': (BuildContext context) => new HeroAnimation(),
          //HeroAnimationPage2
          '/heroAnimationPage2': (BuildContext context) => new HeroAnimationPage(),
          //RadialHeroAnimation
          '/radialHeroAnimation': (BuildContext context) => new RadialExpansionDemo(),
          //Native方法
          '/methodChannelPage': (BuildContext context) => new MethodChannelPage(),
          //仿写Activity
          '/CAvtivity': (BuildContext context) => new CActivity(),
          //仿写LinearLayout
          '/LinearLayout': (BuildContext context) => new LinearLayoutWidget(),
          //仿写FrameLayout
          '/FrameLayout': (BuildContext context) => new FrameLayout(),
          //Login
          '/Login': (BuildContext context) => new Login(),
          //Home
          '/Home': (BuildContext context) => new Home(),
          //DismissibleWidget
          '/DismissibleWidget': (BuildContext context) => new DismissibleWidget(),
          //AnimatedListWidget
          '/AnimatedListWidget': (BuildContext context) => new AnimatedListWidget(),
          //AnimatedIconWidget
          '/AnimatedIconWidget': (BuildContext context) => new AnimatedIconWidget(),
          //AnimatedSwitcher
          '/AnimatedSwitcher': (BuildContext context) => new AnimatedSwitcherWidget(),
          //AnimatedCrossFade
          '/AnimatedCrossFade': (BuildContext context) => new AnimatedCrossFadeWidget(),
          //AnimatedImplicitWidget
          '/AnimatedImplicitWidget': (BuildContext context) => new AnimatedImplicitWidget(),
          //TweenAnimationBuilderWidget
          '/TweenAnimationBuilderWidget':(BuildContext context) => new TweenAnimationBuilderWidget(),
          //TransitionWidget
          '/TransitionWidget': (BuildContext context) => new TransitionWidget(),
          //ExplicitAnimationWidget
          '/ExplicitAnimationWidget': (BuildContext context) => new ExplicitAnimationWidget(),
          //CustomWidget
          '/CustomWidget': (BuildContext context) => new CustomWidget(),
          //Detail
          '/Detail': (BuildContext context) => new Detail(),
          //吸顶
          '/Suspension': (BuildContext context) => new IndexSuspensionRoute(),
          //吸顶
          '/StackTop': (BuildContext context) => new StackTop(),
          //
          '/PingLunDemo': (BuildContext context) => new PingLunDemo(),
          '/TextFieldPage': (BuildContext context) => new TextFieldPage(text: 'text',),
          '/DouYinPingLunDemo': (BuildContext context) => new DouYinPingLunDemo(),
          '/LoadMoreDemo': (BuildContext context) => new LoadMoreDemo(),
          '/MainPage': (BuildContext context) => new MainPage(),
          '/OldExtendedNestedScrollViewDemo': (BuildContext context) => new OldExtendedNestedScrollViewDemo(),
          '/DynamicPinnedHeaderHeightDemo': (BuildContext context) => new DynamicPinnedHeaderHeightDemo(),
          '/PullToRefreshDemo': (BuildContext context) => new PullToRefreshDemo(),
          '/ScrollToTopDemo': (BuildContext context) => new ScrollToTopDemo(),
          '/Provider': (BuildContext context) => new ProviderRoute(),
          'QHomePage': (BuildContext context) => new QHomePage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Map<String, String> routMap = {
    '/refreshList': '列表页',
    '/viewPager': 'Viewpager',
    '/request': 'Request',
    '/draggable': 'Draggable',
    '/animation': 'Animation',
    '/fadeInAndOutAnim': 'FadeInAndOut',
    '/explicitAnimation': 'ExplicitAnimation',
    '/animatedList': 'AnimatedList',
    '/heroAnimation': 'HeroAnimation',
    '/radialHeroAnimation': 'RadialHeroAnimation',
    '/methodChannelPage': 'MethodChannel',
    '/CAvtivity': 'CActivity',
    '/LinearLayout': 'LinearLayout',
    '/FrameLayout': 'FrameLayout',
    '/Login': 'Login',
    '/DismissibleWidget': 'DismissibleWidget',
    '/AnimatedListWidget': 'AnimatedListWidget',
    '/AnimatedIconWidget': 'AnimatedIconWidget',
    '/AnimatedSwitcher': 'AnimatedSwitcher',
    '/AnimatedCrossFade': 'AnimatedCrossFade',
    '/AnimatedImplicitWidget': 'AnimatedImplicitWidget',
    '/TweenAnimationBuilderWidget': 'TweenAnimationBuilderWidget',
    '/TransitionWidget': 'TransitionWidget',
    '/ExplicitAnimationWidget': 'ExplicitAnimationWidget',
    '/CustomWidget': 'CustomWidget',
    '/Detail': '常规详情',
    '/Suspension': '城市列表吸顶',
    '/StackTop': '吸顶',
    '/PingLunDemo': 'PingLunDemo',
    '/TextFieldPage': 'TextFieldPage',
    '/DouYinPingLunDemo': 'DouYinPingLunDemo',
    '/LoadMoreDemo': 'LoadMoreDemo',
    '/MainPage': 'MainPage',
    '/OldExtendedNestedScrollViewDemo': 'OldExtendedNestedScrollViewDemo',
    '/DynamicPinnedHeaderHeightDemo': 'DynamicPinnedHeaderHeightDemo',
    '/PullToRefreshDemo': 'PullToRefreshDemo',
    '/ScrollToTopDemo':'ScrollToTopDemo',
    '/Provider': 'Provider',
    'QHomePage': 'QHomePage'
  };

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _toNewNamedPage(routeName) {
    Navigator.pushNamed(context, routeName);
  }

  List<Widget> widgetItems = [];

  _generateWidgetItems() {
    routMap.forEach((key, value) => {widgetItems.add(_buildItem(key, value))});
  }

  Widget _buildItem(String routeName, String pageName) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: RaisedButton(
        onPressed: () {
          _toNewNamedPage(routeName);
        },
        child: Text(pageName),
      ),
    );
  }

  getMaxWin() {
    for(int ty = 0; ty < threeYear.length; ++ty) {
      String tyItem = threeYear[ty];
      for(int twy = 0; twy < twoYear.length; ++twy) {
        String twyItem = twoYear[twy];
        if (tyItem == twyItem) {
          for(int oy = 0; oy < oneYear.length; ++oy) {
            String oyItem = oneYear[oy];
            if(oyItem == twyItem) {
              for(int sm = 0; sm < sixMonth.length; ++sm) {
                String smItem = sixMonth[sm];
                if(smItem == oyItem) {
                  for(int tm = 0; tm < threeMonth.length; ++tm) {
                    String tmItem = threeMonth[tm];
                    if(tmItem == smItem) {
                      for(int om = 0; om < oneMonth.length; ++om){
                        String omItem = oneMonth[om];
                        if(omItem == tmItem){
                          print(tmItem);
                          print('-----------');
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  Widget _itemBuilder(int index) {
    return widgetItems[index];
  }

  @override
  void initState() {
    super.initState();
    _generateWidgetItems();
//    getMaxWin();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( // 物理返回键拦截
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title + 'times:$_counter'),
          ),
          body: GridView.builder(
              itemCount: widgetItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              itemBuilder: (BuildContext context, int index) => _itemBuilder(index)),
          floatingActionButton: new Theme(
            data: ThemeData(
              accentColor: Colors.red,
            ),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
