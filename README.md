# flutter-test
文章介绍移步微信公众号：Flutter入门

![Flutter入门](https://github.com/damengzai/flutter-test/blob/master/test_flutter/images/qrcode_for_gh_9227e8476358_258.jpg)

### Theme

试用了一下Flutter的Theme，真香，特别是对于创建小而美的APP来说，控制集中，提供了整体样式修改方案。

首先先看看官方ThemeData的构造函数：

额，太多，选择几个吧

accentColor-Color类型，前景色（文本、按钮等）

accentColorBrightness-Brightness类型，accentColor的亮度，用于确定放置在突出颜色顶部的文本和图标颜色

backgroundColor-Color类型，与primaryColor对比的颜色（用作进度条的剩余部分）

buttonTheme-ButtonThemeData类型，定义了按钮等空间的默认配置

cardColor-Color类型，Material被用作Card时的颜色

dialogBackgroundColor-Color类型，dialog元素的背景色

disableColor-Color类型，用于Widget无效的颜色

dividerColor-Color类型，Dividers和PopupMenuDividers的颜色，也用于ListTiles中间和DataTables中间

errorColor-Color类型，用于输入验证错误的颜色，例如在TextField中

highlightColor-Color类型，用于类似墨水喷溅动画或指示菜单被选中的高亮色

hintColor-Color类型，用于提示文本占位符颜色，如TextField中

Platforn-TargetPlatform类型，Widget需要适配的目标类型

primaryColor-Color类型，App主要部分的背景色

primaryColorBrightness-Brightness类型，primaryColor的亮度

primaryColorDark-Color类型，primaryColor的较暗版本

primaryColorLight-Color类型，primaryColor的较亮版本

textTheme-TextTheme类型，与卡片和画布对比的文本样式

runtimeType-Type类型，便是对象运行时类型

使用：

自定义一个ThemeData，可以是一个常量

```dart
final ThemeData defaultTheme = new ThemeData(
  accentColor: Colors.red,
  accentColorBrightness: Brightness.dark,
  primaryColor: Colors.red,
  primarySwatch: Colors.orange,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange,
    padding: EdgeInsets.all(7),
  ),
  textTheme: TextTheme(
    title: TextStyle(color: Colors.black, fontSize: 33),
    display1: TextStyle(color: Colors.black, fontSize: 40),
  ),
);
```

在使用的时候在最外层的MaterialApp的theme添加自定义的theme（main.dart），这样就会创建一个全局的theme

```dart
theme: defaultTheme
```

这样在新加的页面中，login.dart、Home.dart中整个theme就会变化

Widget会向上查找，使用离它层级最近的Theme。

对于某一个Widget想使用特定的theme的话：

```dart
new Theme(
  data: ThemeData(
    accentColor: Colors.red,
  ),
  child: FloatingActionButton(
    onPressed: _incrementCounter,
    tooltip: 'Increment',
    child: Icon(Icons.add),
  ),
)
```

看是很完美，但是用到一个Text上，没效果，这是因为context错了，使用Builder

```dart
new Theme(
  data: new ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.red,
    textTheme: TextTheme(
      title: TextStyle(color: Colors.black),
    ),
  ),
  child: Builder(
    builder: (context) {
      return Text(
        '登录',
        style: Theme.of(context).textTheme.title,
      );
    },
  ),
)
```

但是其他想和主Theme一样，只想改动一个属性咋办

```dart
new Theme(
  data: Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme.copyWith(
          title: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.white),
        ),
  ),
  child: Builder(
    builder: (context) {
      return Text(
        '登录',
        style: Theme.of(context).textTheme.title,
      );
    },
  ),
)
```

这样就只改了title的颜色了,只是改里层的属性的时候，需要多次copyWith



顺便，还有页面之间传递数据

构造函数的样子看着不是很习惯，拓展性不是很强，想和Android一样的Bundle携带数据多好。

```dart
Navigator.pushNamed(context, '/Home', arguments: 'String~~~').then((data) {
  print(data);
});
```

通过argument携带数据

下一个页面接收数据

```dart
dynamic obj = ModalRoute.of(context).settings.arguments;
```

返回数据在then回调里面

```dart
Navigator.of(context).pop('ok~~~')
```

会遇到的问题，MaterialApp最好只用一个，其实应该强制，除非其他需求。在这里添加router、theme，否则会发现router找不到或者theme无效

