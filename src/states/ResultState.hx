package states;

import util.Button;
import h2d.Bitmap;
import hxd.Res;
import util.Tools;

class ResultState extends BaseState
{	
	
	public override function init()
	{ 
        Tools.createTextStringXY(this, 'cccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\ncccccccccccccccccccc\r\n',0,0);
		
		new Button(this,140, 200, 160, 30, new Bitmap(Res.button.toTile()), "  Start your next mission", pick, 18);
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