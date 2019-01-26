package states;

import util.Tools;
import util.Button;
import h2d.Bitmap;
import hxd.Res;
import systems.Data;

class StartState extends BaseState
{	
	
	public override function init()
	{
        var t = Tools.createTextStringXY(this, 'aaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaa\r\n',0,0);
		t.maxWidth = 140;
		var iteration = 0;
		var pic:Bitmap;
		var pics:Array<Bitmap> = [];
		for(i in Data.items.all)
		{
			var b = new Button(this,5 + iteration * 105, 200, 100, 30, new Bitmap(Res.button.toTile()), i.buttonText, pick, 18);
            pic = new Bitmap(Reg.images[i.itemImage].toTile());
       		pic.x = 140;
			pics.push(pic);
			b.overDelegate = function (){
				t.text = i.flavorText;
				for(j in pics)
				{
					j.remove();
				}
				this.addChild(pic);
				}
			trace(i.buttonText);
			iteration++;
		}
		/*new Button(this,140, 200, 50, 30, new Bitmap(Res.button.toTile()), "Boost 1", pick, 18);
		new Button(this,200, 200, 50, 30, new Bitmap(Res.button.toTile()), "Boost 2", pick, 18);
		new Button(this,260, 200, 50, 30, new Bitmap(Res.button.toTile()), "Boost 3", pick, 18);
		*/
        
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