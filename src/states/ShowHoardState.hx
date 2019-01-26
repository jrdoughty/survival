package states;

import actors.Goblin;
import util.Button;
import hxd.Res;
import h2d.Text;
import h2d.Bitmap;
import hxd.res.DefaultFont;
import actors.Projectile;
import h2d.Anim; 
import nape.space.Space;
import nape.geom.Vec2;


/**
 * ...
 * @author John Doughty
 */
class ShowHoardState extends BaseState
{

	var score:Int = 0;
	var scoreText:Text;
	var coins:Array<Projectile> = [];
	var g:Goblin;
	private var space:Space;


	public override function init():Void 
	{
		new Bitmap(Res.menubackground.toTile(),this);		
		var text1 = new Text(DefaultFont.get(), this);
		text1.text = "GROW YOUR";
		text1.x = 70;
		text1.y = 0;

		var text2 = new Text(DefaultFont.get(), this);
		text2.text = "HOARD";
		text2.x = 85;
		text2.y = 35;
		scoreText = new Text(DefaultFont.get(), this);
		scoreText.text = "0 Gold";
		scoreText.x = 80;
		scoreText.y = 100;
		
		g = new Goblin(Res.goblin1.toTile(), 20 ,20 ,250, 125,5,0,-.3, "goblin", null, null, this);
		new Button(this,25, 155, 275, 80, new Bitmap(Res.button.toTile()), "Invest", buy);
		space = new Space(new Vec2(0,350));
	}
	
	public function buy(e:hxd.Event):Void
	{
		Main.the.changeState(new HoardState());
	}
	
	public override function kill():Void
	{
		super.kill();
		scoreText = null;
		for(i in coins)
		{
			i.kill();
		}
		coins = [];

	}
	
	public override function update(dt:Float):Void 
	{
		if (score < Reg.score && scoreText != null)
		{
			score++;
			scoreText.text = score+" Gold";
			trace(score);
			if(score<=50)
			{
				coins.push(new Projectile(this, Res.coin_png.toTile(),8,8,150 + Math.round(Math.random()*250) - 125, -100,new Anim([Res.coin_png.toTile().split(8)[0]],0), 0, 0));
				space.bodies.add(coins[coins.length-1].body);
				coins[coins.length-1].scale(4);
			}
		}
		space.step(dt/60);
		g.update(dt);
		for(i in coins)
		{
			i.update(dt);
		}
	}
	
}
