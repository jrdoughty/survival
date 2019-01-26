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
        var t = Tools.createTextStringXY(this, 'You\'re and astronaut from the lovely Blue Planet formally known as Earth. Your peace keeping mission on Mars was a success. However, thanks to a glitch in your autopilot you have been sucked into a vortex somewhere deep, deep into space.\n\rYour ship is damaged; the navigation equipment is dead and your ship\'s generator has stopped working. Reality hits you like a brick:\n\rSpace is infinite, dark, cold and reasonably quiet... and you are alone and far from home...\n\rAnd what\'s that noise coming from the lower deck of your ship?',0,0);
		t.maxWidth = 300;
		var iteration = 0;
		var pics:Array<Bitmap> = [];
		for(i in Data.items.all)
		{
			var b = new Button(this,5 + iteration * 105, 200, 100, 30, new Bitmap(Res.button.toTile()), i.buttonText, pick, 18);
			var pic:Bitmap = new Bitmap(Reg.images[i.itemImage].toTile());
       		pic.x = 140;
			pics.push(pic);
			b.overDelegate = function (){
				t.text = i.flavorText;
				t.maxWidth = 140;
				for(j in pics)
				{
					j.remove();
				}
				this.addChild(pic);
				}
			trace(i.buttonText);
			iteration++;
		}
		/*
		new Button(this,140, 200, 50, 30, new Bitmap(Res.button.toTile()), "Boost 1", pick, 18);
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