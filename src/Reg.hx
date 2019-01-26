package;

class Reg
{
	public static var depression:Int = 0;
	public static var anxiety:Int = 0;
	public static var exhaustion:Int = 0;
	public static var depressionMod:Float = 1;
	public static var anxietyMod:Float = 1;
	public static var exhaustionMod:Float = 1;
	//Format for Int colors is AARRGGBB
	public static var buttonColor:Int = 0xFF906f66;
	public static var buttonHoverColor:Int = 0xFFc6654c;
	public static var textColor:Int = 0xFF10232b;
	public static var buttonTextColor:Int = 0xFFFFFFFF;
	public static var backgroundColor:Int = 0xFF80776f;
	public static var missionIndex:Int = 0;
	
	public static var curMissionID:String = "";
	public static var curActionID:String = "";

	
	public static var gameWidth = 320; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	public static var gameHeight = 240; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	public static var images:Map<String, hxd.res.Image>;
	
	//public static var inLevel:Bool = false;

	public static function reset():Void
	{
		depression = 0;
		anxiety = 0;
		exhaustion = 0;
		depressionMod = 1;
		anxietyMod = 1;
		exhaustionMod = 1;
		curMissionID = "";
		curActionID = "";
		missionIndex = 0;
	}

    public static function loadImagesFromImg(fileName:String):Map<String, hxd.res.Image>
    {
        var images = new Map<String, hxd.res.Image>();

        // Загружаем img-файл и парсим его
        var jsonData = haxe.Json.parse(hxd.Res.load(fileName).toText());
        var fields = Reflect.fields(jsonData);

        // Проходим по всем полям полученного объекта
        for (field in fields)
        {
            var imgString:String = Reflect.field(jsonData, field);
            // удаляем префикс, который CastleDB добавляет перед данными изображения
            imgString = imgString.substr(imgString.indexOf("base64,") + "base64,".length);

            // Декодируем данные изображения и загружаем их в Image (контейнер данных изображения)
            var bytes = haxe.crypto.Base64.decode(imgString);
            var bytesFile = new hxd.fs.BytesFileSystem.BytesFileEntry(field, bytes);
            var image = new hxd.res.Image(bytesFile);

            images.set(field, image);
        }

        return images;
    }
}