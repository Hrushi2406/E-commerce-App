### Takes care of Responsive UI

All you have to do is create different screens for different layouts

**NOTE:** always use `width: SizeConfig.setWidth(60.0)`, instead of `width: 60.0`


## Example

```dart
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(),     //normal UI
        landscape: HomeMobileLandscape(),
      ),
      tablet: OrientationLayout(
        portrait: HomeaTabletPortrait(),
        landscape: HomeTabletLandscape(),
      ),
      desktop: OrientationLayout(
        portrait: HomeDesktopPortrait(),
        landscape: HomeDesktopLandscape(),
      ),
    );
  }
}
```
