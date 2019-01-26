package states;

import util.Button;
import h2d.Bitmap;
import hxd.Res;
import util.Tools;
import systems.Data;

class ResultState extends BaseState
{	
	
	public override function init()
	{ 
		for(i in Data.Missions.all)
		{
			if(i.id == Reg.curMissionID)
			{
				for(j in i.actions)
				{
					if(j.id == Reg.curActionID)
		        		Tools.createTextStringXY(this, j.resultText,0,0);
				}
			}
		}
		new Button(this,140, 200, 160, 30, new Bitmap(Res.button.toTile()), "Start your next mission", pick, 18);
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