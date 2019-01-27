package states;

import util.Tools;
import h2d.Bitmap;
import systems.Data;
//import util.Button;

import Reg;

import h2d.Sprite;
import h2d.Scene;
import h2d.Anim;
import h2d.Text;

import hxd.Res;
import hxd.Event;
import hxd.BitmapData;
import hxd.res.DefaultFont;
import h2d.Tile;
import util.Button;

//import states.PlayState;

class MenuState extends BaseState
{

	public override function init()
	{
		Reg.reset();
        new Bitmap(Reg.images[Data.config.all[0].introBG].toTile(),this);
        var b = new Bitmap(Reg.images[Data.config.all[0].logo].toTile(),this);
		b.x = 45;
		b.y = 10;
		new Button(this,100, 120, 120, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "PLAY", play, 18);
		new Button(this,100, 158, 120, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "RULES", help, 18);		
		new Button(this,100, 196, 120, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "CREDITS", credits, 18);	
		
	}

	public function play(e:hxd.Event)
	{
		Reg.reset();
		Main.the.changeState(new StartState());
	}

	public function help(e:hxd.Event)
	{
		Main.the.changeState(new HelpState());
	}

	public function credits(e:hxd.Event)//sprite:FlxSprite = null)
	{
		Main.the.changeState(new CreditsState());
	}
	public override function kill():Void
	{
		super.kill();
	}

}