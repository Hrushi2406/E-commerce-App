import 'package:furnitur/core/utils/enums.dart';

String convertEnumToString(CategoryEnum category) {
  switch (category) {
    case CategoryEnum.Lamp:
      return "lamp";
      break;
    case CategoryEnum.Lounge:
      return "lounge";
      break;
    case CategoryEnum.TableAndChair:
      return "table_chair";
      break;
    case CategoryEnum.WoodenFurniture:
      return "wooden_furniture";
      break;
    case CategoryEnum.PlantVase:
      return "flower_vase";
      break;
    case CategoryEnum.PencilHolder:
      return "pencil_holder";
      break;
    default:
      return "lamp";
      break;
  }
}
