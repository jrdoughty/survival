package util;

import h2d.Bitmap;
import h2d.Object;
import h2d.Text;
import h2d.Interactive;
import h2d.Tile;
import h2d.Font;
import hxd.Event;
import hxd.Res;
import hxd.res.DefaultFont;
import systems.Data;

class Button extends h2d.Object
{
	public static var buttons:Array<Button> = [];
	public var background:Bitmap;
	public var text:Text;
	public var overDelegate:Void->Void;
	//public var clickRegion:FlxObject;
	
	public var interactive:Interactive;

	public function new(p:Object, x:Float, y:Float, width:Int, height:Int, backgroundTile:Bitmap, textString:String, click:Event->Void,?fontSize:Int)
	{
		super(p);
		this.x = x;
		this.y = y;
		background = backgroundTile;
		background.color.setColor(Reg.buttonColor);
		background.scaleX = width/background.getBounds().width;
		background.scaleY = height/background.getBounds().height;
		addChild(background);
		text = new Text(DefaultFont.get(), this);
		text.text = textString;
		text.x = 0;
		text.y = 0;
		text.color.setColor(Reg.buttonTextColor);
		interactive = new Interactive(width, height, this);
		interactive.onClick = click;
		interactive.onOver = over;
		interactive.onOut = out;
		buttons.push(this);
	}


	public function kill()
	{
		removeChildren();
		background = null;
		text = null;
	}

	public static function clear()
	{
		for(i in buttons)
		{
			i.kill();
		}
		buttons = [];
	}

	

	public function over(e:Event)
	{
		background.color.setColor(Reg.buttonHoverColor);
		if(overDelegate != null)
			overDelegate();
	}

	public function out(e:Event)
	{
		trace(Data.config.all[0].buttonHover);
		background.color.setColor(Reg.buttonColor);
	}
	/*
	public function update():Void 
	{
		//super.update();
	}
	*/	
}