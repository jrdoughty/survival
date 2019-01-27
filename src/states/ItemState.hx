package states;

import h2d.Text.Align;
import util.Tools;
import util.Button;
import h2d.Bitmap;
import hxd.Res;
import h2d.Tile;
import systems.Data;

class ItemState extends BaseState
{	
	
	public override function init()
	{
        new Bitmap(Reg.images[Data.config.all[0].introBG].toTile(),this);
        var tile = Tile.fromColor(0xFF10232b,320,240);
        var bmp = new Bitmap(tile,this);
        bmp.y = 0;
        bmp.x = 0;
        bmp.alpha = .5;
        var t = Tools.createTextStringXY(this, 'PICK YOUR MOMENTO',0,0);
		t.maxWidth = 300;
		t.color.setColor(Reg.buttonTextColor);
        t.textAlign = Align.Center;
        t = Tools.createTextStringXY(this, 'This trinket will help you on your adventure',10,20);		t.maxWidth = 300;
		t.color.setColor(Reg.buttonTextColor);
		t.textAlign = Align.Center;
        t = Tools.createTextStringXY(this, '',0,40);
		t.maxWidth = 300;
		t.color.setColor(Reg.buttonTextColor);
		var iteration = 0;
		var pics:Array<Bitmap> = [];
		for(i in Data.items.all)
		{
			var b = new Button(this,5 + iteration * 105, 200, 100, 34, new Bitmap(Reg.images[Data.config.all[0].buttonBG].toTile()), i.buttonText, function(_){pick(i.id);}, 18);
			var pic:Bitmap = new Bitmap(Reg.images[i.itemImage].toTile());
       		pic.x = 164;
            pic.y = 40;
			pics.push(pic);
			b.overDelegate = function (){
				t.text = i.flavorTitle+"\n\r\n\r"+i.flavorText;
				t.maxWidth = 160;
				for(j in pics)
				{
					j.remove();
				}
				this.addChild(pic);
				}
			trace(i.buttonText);
			iteration++;
		}
        
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