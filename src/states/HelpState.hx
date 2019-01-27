package states;

import hxd.Res;
import h2d.Text;
import h2d.Bitmap;
import util.Button;
import hxd.res.DefaultFont;
import systems.Data;

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
		var text:Text;
		text = new Text(DefaultFont.get(), this);
		text.text = "RULES";
		text.maxWidth = 320;
		text.textAlign = Align.Center;

		text = new Text(DefaultFont.get(), this);
		text.text = "Bein' in the deep darkness of space would break lesser folk, but even those with your git only have so much time.\n\rThe longer yer out, the worse yer Anxiety, Depression, and Exhaustion will get. If any of these go over 100, your mind will slip, and you won't be able to make it home...\n\rRemember, that momento you took from home may be the one thing to steel yer nerves out in deep space.";
		text.x = 5;
		text.y = 20;
		text.maxWidth = 300;
		new Button(this,25, 200, 120, 30, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "PLAY", play);
		new Button(this,160, 200, 120, 30, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "MENU", menu);
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