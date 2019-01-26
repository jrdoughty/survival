package states;

import hxd.Res;
import h2d.Text;
import h2d.Bitmap;
import util.Button;
import hxd.res.DefaultFont;

/**
 * A FlxState which can be used for the game's menu.
 */
class HelpState extends BaseState
{
	var playBtn:Button;
	var menuBtn:Button;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function init():Void
	{
		super.init();
		new Bitmap(Res.menubackground.toTile(), this);
		var text:Text;
		text = new Text(DefaultFont.get(), this);
		text.text = "Help";
		text.x =120;

		text = new Text(DefaultFont.get(), this);
		text.text = "Press A Left or Click to";
		text.x = 0;
		text.y = 50;

		text = new Text(DefaultFont.get(), this);
		text.text = "go Left and Press D Right";
		text.x = 0;
		text.y = 70;

		text = new Text(DefaultFont.get(), this);
		text.text = "or Right Click to go Right";
		text.x = 0;
		text.y = 90;

		text = new Text(DefaultFont.get(), this);
		text.text = "and shield your loyal";
		text.x = 0;
		text.y = 110;

		text = new Text(DefaultFont.get(), this);
		text.text = "minions from arrow fire";
		text.x = 0;
		text.y = 130;

		text = new Text(DefaultFont.get(), this);
		text.text = "Double Tap to perform a dash";
		text.x = 0;
		text.y = 150;

		text = new Text(DefaultFont.get(), this);
		text.text = "Double Tap to perform a dash";
		text.x = 0;
		text.y = 170;
		new Button(this,25, 200, 120, 30, new Bitmap(Res.button.toTile()), "PLAY", play);
		new Button(this,160, 200, 120, 30, new Bitmap(Res.button.toTile()), "MENU", menu);
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function kill():Void
	{
		super.kill();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(dt:Float):Void
	{
		super.update(dt);
	}

	public function play(e:hxd.Event)
	{
		Reg.reset();
		Main.the.changeState(new PlayState());
	}

	public function menu(e:hxd.Event)
	{
		Main.the.changeState(new MenuState());
	}
}