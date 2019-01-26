package states;

import util.Tools;
import util.Button;
import h2d.Bitmap;
import hxd.Res;

class StartState extends BaseState
{	
	
	public override function init()
	{
        Tools.createTextStringXY(this, 'aaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\n',0,0);
		new Button(this,140, 200, 50, 30, new Bitmap(Res.button.toTile()), "Boost 1", pick, 18);
		new Button(this,200, 200, 50, 30, new Bitmap(Res.button.toTile()), "Boost 2", pick, 18);
		new Button(this,260, 200, 50, 30, new Bitmap(Res.button.toTile()), "Boost 3", pick, 18);
		var pic = new Bitmap(Res.goblin1.toTile(),this);
        pic.x = 140;
        
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}

    function pick(e:hxd.Event)
    {
        Main.the.changeState(new PickState());
    }

}