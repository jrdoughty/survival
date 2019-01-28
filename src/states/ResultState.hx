package states;

import util.Button;
import h2d.Bitmap;
import hxd.Res;
import util.Tools;
import systems.Data;
import h2d.Tile;

class ResultState extends BaseState
{	

	public override function init()
	{ 
        var mission = Data.Missions.all[Reg.missionIndex];
		if(Reg.missionIndex != 6)
			Reg.missionIndex++;
		if(Reg.missionIndex == 4)
		{
			for(i in mission.actions)
			{
				if(i.id == Reg.curActionID && i.id == 'space')	
					Reg.missionIndex++;
			}
		}
		if(mission.missionImage != null && mission.missionImage != "")
        {
            new Bitmap(Reg.images[mission.missionImage].toTile(),this);
        }
		for(j in mission.actions)
		{
			if(j.id == Reg.curActionID)
			{
				var t = Tools.createTextStringXY(this, j.resultText,0,0);
				t.maxWidth = 300;
				var tile = Tile.fromColor(0xFF10232b,320,80);
				var bmp = new Bitmap(tile,this);
				bmp.y = 163;
				bmp.x = 0;
				bmp.alpha = .5;

				Reg.anxiety += Std.int(j.anxietyEffect * Reg.anxietyMod);
				t = Tools.createTextStringXY(this, "           +"+Std.int(j.anxietyEffect * Reg.anxietyMod)+"\n\rAnxiety: "+Reg.anxiety,5,165);
				t.color.setColor(Reg.buttonTextColor);
				
				Reg.depression += Std.int(j.depressionEffect * Reg.depressionMod);
				t = Tools.createTextStringXY(this,  "                 +"+Std.int(j.depressionEffect * Reg.depressionMod)+"\n\rDepression: "+Reg.depression,105,165);
				t.color.setColor(Reg.buttonTextColor);
				
				Reg.exhaustion += Std.int(j.exhaustionEffect * Reg.exhaustionMod);
				t = Tools.createTextStringXY(this, "                 +"+Std.int(j.exhaustionEffect * Reg.exhaustionMod)+"\n\rExhaustion: "+Reg.exhaustion,210,165);
				t.color.setColor(Reg.buttonTextColor);
				
				trace(Reg.missionIndex);
				if(Reg.missionIndex == 6)
				{
					new Button(this,5, 200, 310, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), j.exitBtnText, restart, 18);
				}
				else if(Reg.anxiety < 100 && Reg.depression < 100 && Reg.exhaustion < 100)
				{
					new Button(this,5, 200, 310, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), j.exitBtnText, pick, 18);
				}
				else if(Reg.anxiety >= 100)
				{
					new Button(this,5, 200, 310, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "Nerves have taken hold, and illness sets in...", restart, 18);
				}
				else if(Reg.depression >= 100)
				{
					new Button(this,5, 200, 310, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "Lonelyness kills a man... and it just got you", restart, 18);
				}
				else 
				{
					new Button(this,5, 200, 310, 30, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), "Pushing yourself only gets you so far before you just can't. You collapse...", restart, 18);
				}
				break;
			}
		}
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}

    function pick(e:hxd.Event)
    {
		if(Reg.missionIndex<4)
	        Main.the.changeState(new RestState());
		else if(Reg.missionIndex >= 2 && Reg.missionIndex <= 4)
		{
	        Main.the.changeState(new PickState());
		}
		else if(Reg.missionIndex > 3)
		{
	        Main.the.changeState(new CreditsState());
		}
    }

    function restart(e:hxd.Event)
    {
		if(Reg.missionIndex != 6)
		{
			Reg.missionIndex = 6;
			Reg.curActionID = 'action1';
			Main.the.changeState(new ResultState());
		}
		else
			Main.the.changeState(new MenuState());
    }

}