package states;

import util.Tools;
import util.Button;
import hxd.Res;
import util.Button;
import h2d.Bitmap;
/**
 * ...
 * @author John Doughty
 */
class CreditsState extends BaseState
{

	override public function init():Void 
	{
		new Bitmap(Res.menubackground.toTile(), this);
		Tools.createTextStringXY(this, "GROW YOUR", 70, 0);
		Tools.createTextStringXY(this, "HOARD", 90, 25);
		Tools.createTextStringXY(this, "Nicholas Cash Code",55, 55);
		Tools.createTextStringXY(this, "John Doughty Code and Art", 30, 80);
		
		new util.Button(this, 75, 180, 150, 50, new Bitmap(Res.button.toTile(), this), "Menu", menu, 27);
	}

	public function menu(e:hxd.Event)
	{
		Main.the.changeState(new MenuState());
	}
}