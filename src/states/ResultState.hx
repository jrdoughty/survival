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
					{
		        		Tools.createTextStringXY(this, j.resultText,0,0);
						Reg.anxiety += j.anxietyEffect;
						Reg.depression += j.depressionEffect;
						Reg.exhaustion += j.exhaustionEffect;
						if(Reg.anxiety < 100 && Reg.depression < 100 && Reg.exhaustion < 100)
						{
							new Button(this,5, 200, 310, 30, new Bitmap(Res.button.toTile()), j.exitBtnText, pick, 18);
						}
						else 
						{
							new Button(this,5, 200, 310, 30, new Bitmap(Res.button.toTile()), "The End", restart, 18);
						}
						break;
					}
				}
			}
		}
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

    function restart(e:hxd.Event)
    {
        Main.the.changeState(new MenuState());
    }

}