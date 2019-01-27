package states;

import util.Tools;
import util.Button;
import h2d.Bitmap;
import hxd.Res;
import h2d.Tile;
import systems.Data;

class StartState extends BaseState
{	
	
	public override function init()
	{
        new Bitmap(Res.images.introBG.toTile(),this);
        var tile = Tile.fromColor(0xFF10232b,320,240);
        var bmp = new Bitmap(tile,this);
        bmp.y = 0;
        bmp.x = 0;
        bmp.alpha = .5;
        var t = Tools.createTextStringXY(this, 'You\'re and astronaut from the lovely Blue Planet formally known as Earth. Your peace keepin\' mission on Mars was a success. However, thanks to a glitch in your autopilot you have been sucked into a vortex somewhere deep, deep into space.\n\rYour ship is damaged; the navigation equipment is dead and your ship\'s generator has stopped workin\'. Reality hits you like a brick:\n\rSpace is infinite, dark, cold and reasonably quiet... and you are alone and far from home...\n\rAnd what\'s that noise comin\' from the lower deck of your ship?',0,0);
		t.maxWidth = 300;
		t.color.setColor(Reg.buttonTextColor);
		var iteration = 0;
		var pics:Array<Bitmap> = [];
		for(i in Data.items.all)
		{
			var b = new Button(this,5 + iteration * 105, 200, 100, 30, new Bitmap(Res.button.toTile()), i.buttonText, function(_){pick(i.id);}, 18);
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

    function pick(s:String)
    {
		switch(s)
		{
			case 'item1': Reg.anxietyMod = .7;
			case 'item2': Reg.depressionMod = .7;
			case 'item3': Reg.exhaustionMod = .7;
		}
        Main.the.changeState(new PickState());
    }

}