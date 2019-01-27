package states;

import h2d.Tile;
import h2d.Text.Align;
import util.Button;
import h2d.Bitmap;
import hxd.Res;
import util.Tools;
import systems.Data;

class RestState extends BaseState
{	
	
	public override function init()
	{
        new Bitmap(Res.images.livingSpace.toTile(),this);
        var t = Tools.createTextStringXY(this, 'Rest',0,0);
		t.maxWidth = 320;
        t.textAlign = Align.Center;

        t = Tools.createTextStringXY(this, 'Perhaps you should rest your eyes and mind... or blow off some steam...',5,18);
		t.maxWidth = 300;
        var tile = Tile.fromColor(0xFF10232b,320,80);
        var bmp = new Bitmap(tile,this);
        bmp.y = 163;
        bmp.x = 0;
        bmp.alpha = .5;
        t = Tools.createTextStringXY(this, '',5,160);
        t.maxWidth = 300;
        t.color.setColor(Reg.buttonTextColor);
        
        var b = new Button(this,5, 200, 100, 30, new Bitmap(Res.button.toTile()),'Read', function(_){Reg.depression-=10;pick();}, 18);
        b.overDelegate = function (){t.text = 'Read about fronteirsmen... Makes this bein\' lost feel like it has a purpose. -10 Depression';}
        b = new Button(this,110, 200, 100, 30, new Bitmap(Res.button.toTile()),'Excercise', function(_){Reg.anxiety-=10;pick();}, 18);
        b.overDelegate = function (){t.text = 'Sweatin\' out the shakes settles ones nerves. -10 Anxiety';}
        b = new Button(this,215, 200, 100, 30, new Bitmap(Res.button.toTile()),'Sleep', function(_){Reg.exhaustion-=10;pick();}, 18);
        b.overDelegate = function (){t.text = 'Rest your weary eyes... -10 Exhaustion';}
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}

    function pick()
    {
        Main.the.changeState(new PickState());
    }

}