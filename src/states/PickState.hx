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
        var t = Tools.createTextStringXY(this, '',0,0);
		t.maxWidth = 320;
        var iteration = 0;
        for(i in Data.Missions.all)
        {
            var b = new Button(this,5 + iteration * 105, 200, 100, 30, new Bitmap(Res.button.toTile()),i.btnText, function(_){pick(i.id);}, 18);
            b.overDelegate = function (){t.text = i.missionText;}
            iteration++;
        }
        trace(Data.Missions);
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}

    function pick(missionText:String)
    {
        Reg.curMissionID = missionText;
        Main.the.changeState(new ResultState());
    }

}