package states;

import h2d.Bitmap;
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
import util.Button;

//import states.PlayState;

class MenuState extends BaseState
{

	public override function init()
	{
		new Bitmap(Res.menubackground.toTile(), this);
		new Button(this,100, 100, 120, 30, new Bitmap(Res.button.toTile()), "PLAY", play, 18);

		new Button(this,100, 135, 120, 30, new Bitmap(Res.button.toTile()), "HELP", help, 18);
		
		new Button(this,100, 170, 120, 30, new Bitmap(Res.button.toTile()), "Credits", credits, 18);


	
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