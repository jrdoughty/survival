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
						
						Reg.anxiety += Std.int(j.anxietyEffect * Reg.anxietyMod);
						Reg.depression += Std.int(j.depressionEffect * Reg.depressionMod);
						Reg.exhaustion += Std.int(j.exhaustionEffect * Reg.exhaustionMod);

						if(Reg.anxiety < 100 && Reg.depression < 100 && Reg.exhaustion < 100)
						{
							new Button(this,5, 200, 310, 30, new Bitmap(Res.button.toTile()), j.exitBtnText, pick, 18);
						}
						else if(Reg.anxiety < 100)
						{
							new Button(this,5, 200, 310, 30, new Bitmap(Res.button.toTile()), "Nerves have taken hold, and illness sets in...", restart, 18);
						}
						else if(Reg.depression < 100)
						{
							new Button(this,5, 200, 310, 30, new Bitmap(Res.button.toTile()), "Lonelyness kills a man... and it just did", restart, 18);
						}
						else 
						{
							new Button(this,5, 200, 310, 30, new Bitmap(Res.button.toTile()), "Pushing yourself only gets you so far before you just can't", restart, 18);
						}
						break;
					}
				}
			}
		}
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