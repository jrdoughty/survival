package states;

import h2d.Text.Align;
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
		var t = Tools.createTextStringXY(this, "GROW YOUR", 0, 0);
		t.maxWidth = 320;
		t.textAlign = Align.Center;
		t = Tools.createTextStringXY(this, "HOARD", 0, 25);
		t.maxWidth = 320;
		t.textAlign = Align.Center;
		t = Tools.createTextStringXY(this, 'Elizabeth "Izy" Doughty: Art and Writing',0, 55);
		t.maxWidth = 320;
		t.textAlign = Align.Center;
		t = Tools.createTextStringXY(this, "John Doughty: Code and Audio", 0, 80);
		t.maxWidth = 320;
		t.textAlign = Align.Center;
		
		new util.Button(this, 75, 180, 150, 50, new Bitmap(Res.button.toTile(), this), "Menu", menu, 27);
	}

	public function menu(e:hxd.Event)
	{
		Main.the.changeState(new MenuState());
	}
}