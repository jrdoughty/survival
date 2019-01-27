package states;

import util.Tools;
import util.Button;
import h2d.Bitmap;
import hxd.Res;
import h2d.Tile;
import systems.Data;

class StartState extends BaseState
{	
	
	public override function init()
	{
        new Bitmap(Reg.images[Data.config.all[0].introBG].toTile(),this);
        var tile = Tile.fromColor(0xFF10232b,320,240);
        var bmp = new Bitmap(tile,this);
        bmp.y = 0;
        bmp.x = 0;
        bmp.alpha = .5;
        var t = Tools.createTextStringXY(this, 'Your peace keepin\' mission on a frontier world was a success. However, thanks to a glitch in your tin can\'s autopilot you\'ve been sucked into a swirl of darkness into deep space.\n\rYour vessel is damaged; the navigation equipment is nothin\' but a hunk of scrap and your ship\'s generator has stopped workin\'.\n\rYou\'re alone among the stars in the dark, cold, and quiet... and you are far from home...\n\r\n\rWhat\'s that noise comin\' from the lower deck of your ship?',0,0);
		t.maxWidth = 300;
		t.color.setColor(Reg.buttonTextColor);
		var iteration = 0;
		var pics:Array<Bitmap> = [];
		
		var b = new Button(this, 10, 200, 300, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "Don't go alone\n\rChoose a Momento of Home", function(_){pick();}, 18);
		
		/*
		new Button(this,140, 200, 50, 30, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "Boost 1", pick, 18);
		new Button(this,200, 200, 50, 30, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "Boost 2", pick, 18);
		new Button(this,260, 200, 50, 30, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "Boost 3", pick, 18);
		*/
        
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}

    function pick()
    {
        Main.the.changeState(new ItemState());
    }

}