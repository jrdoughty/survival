package states;

import h2d.Tile;
import h2d.Text.Align;
import util.Button;
import h2d.Bitmap;
import hxd.Res;
import util.Tools;
import systems.Data;

class PickState extends BaseState
{	
	
	public override function init()
	{
        var mission = Data.Missions.all[Reg.missionIndex];//Math.floor(Data.Missions.all.length*Math.random())];
        if(mission.missionImage != null && mission.missionImage != "")
        {
            new Bitmap(Reg.images[mission.missionImage].toTile(),this);
        }
        var t = Tools.createTextStringXY(this, mission.title,0,0);
		t.maxWidth = 320;
        t.textAlign = Align.Center;

        t = Tools.createTextStringXY(this, mission.missionText,5,18);
		t.maxWidth = 300;
        var tile = Tile.fromColor(0xFF10232b,320,80);
        var bmp = new Bitmap(tile,this);
        bmp.y = 163;
        bmp.x = 0;
        bmp.alpha = .5;
        t = Tools.createTextStringXY(this, '',5,160);
        t.maxWidth = 300;
        t.color.setColor(Reg.buttonTextColor);
        var iteration = 0;
        if(mission.actions.length != 0)
        {
            for(i in mission.actions)
            {
                var b = new Button(this,5 + iteration * 155, 200, 150, 30, new Bitmap(Res.button.toTile()),i.btnText, function(_){pick(mission.id,i.id);}, 18);
                b.overDelegate = function (){t.text = i.flavorText;}
                iteration++;
            }
        }
        else 
        {
            Main.the.changeState(new MenuState());
        }
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}

    function pick(missionID:String,actionID:String)
    {
        Reg.curMissionID = missionID;
        Reg.curActionID = actionID;
        Main.the.changeState(new ResultState());
    }

}