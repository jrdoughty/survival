package states;

import util.Button;
import h2d.Bitmap;
import hxd.Res;
import util.Tools;
import systems.Data;

class PickState extends BaseState
{	
	
	public override function init()
	{
        Tools.createTextStringXY(this, 'bbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\nbbbbbbbbbbbbbbbbbbbb\r\n',0,0);
		var iteration = 0;
        for(i in Data.Missions.all)
        {
            new Button(this,140 + iteration * 60, 200, 50, 30, new Bitmap(Res.button.toTile()),i.btnText , pick, 18);
            iteration++;
        }
		var pic = new Bitmap(Res.goblin1.toTile(),this);
        pic.x = 140;
        trace(Data.Missions);
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}

    function pick(e:hxd.Event)
    {
        Main.the.changeState(new ResultState());
    }

}