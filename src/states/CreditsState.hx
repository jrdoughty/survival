package states;

import h2d.Text.Align;
import util.Tools;
import util.Button;
import hxd.Res;
import util.Button;
import h2d.Bitmap;
import systems.Data;
/**
 * ...
 * @author John Doughty
 */
class CreditsState extends BaseState
{

	override public function init():Void 
	{
        new Bitmap(Reg.images[Data.config.all[0].introBG].toTile(),this);
        var b = new Bitmap(Reg.images[Data.config.all[0].logo].toTile(),this);
		b.x = 45;
		b.y = 10;
		var t = Tools.createTextStringXY(this, 'Elizabeth "Izy" Doughty: Art and Writing',0, 120);
		t.maxWidth = 320;
		t.textAlign = Align.Center;
		t = Tools.createTextStringXY(this, "John Doughty: Code and Audio", 0, 135);
		t.maxWidth = 320;
		t.textAlign = Align.Center;
		//if(Reg.missionIndex >5)
		{
			t = Tools.createTextStringXY(this, "Congrats, ya found yer way home. I was fixin' to pour you a glass of something strong, but... Well, I'll just say good work!", 0, 150);
			t.maxWidth = 320;
			t.textAlign = Align.Center;
		}
		

		
		new util.Button(this, 75, 185, 150, 50, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile(), this), "Menu", menu, 27);
	}

	public function menu(e:hxd.Event)
	{
		Main.the.changeState(new MenuState());
	}
}