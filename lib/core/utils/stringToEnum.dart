import 'package:furnitur/core/utils/enums.dart';

CategoryEnum convertStringToEnum(String category) {
  switch (category) {
    case "Lamp":
      return CategoryEnum.Lamp;
      break;
    case "Lounge":
      return CategoryEnum.Lounge;
      break;
    case "Table & Chairs":
      return CategoryEnum.TableAndChair;
      break;
    case "Wooden Furniture":
      return CategoryEnum.WoodenFurniture;
      break;
    case "Plant Vase":
      return CategoryEnum.PlantVase;
      break;
    case "Pencil Holder":
      return CategoryEnum.PencilHolder;
      break;
    default:
      return CategoryEnum.Lamp;
      break;
  }
}
