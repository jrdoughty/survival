package;

class Reg
{
	public static var depression:Int = 0;
	public static var anxiety:Int = 0;
	public static var exhaustion:Int = 0;
	
	public static var curMissionID:String = "";

	
	public static var gameWidth = 320; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	public static var gameHeight = 240; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	
	//public static var inLevel:Bool = false;

	public static function reset():Void
	{
		depression = 0;
		anxiety = 0;
		exhaustion = 0;
	}

}