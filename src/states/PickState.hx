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
        var mission = Data.Missions.all[Reg.missionIndex];//Math.floor(Data.Missions.all.length*Math.random())];
        var t = Tools.createTextStringXY(this, mission.missionText,0,0);
		t.maxWidth = 320;
        t = Tools.createTextStringXY(this, '',0,160);
        var iteration = 0;
        for(i in mission.actions)
        {
            var b = new Button(this,5 + iteration * 155, 200, 150, 30, new Bitmap(Res.button.toTile()),i.btnText, function(_){pick(mission.id,i.id);}, 18);
            b.overDelegate = function (){t.text = i.flavorText;}
            iteration++;
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