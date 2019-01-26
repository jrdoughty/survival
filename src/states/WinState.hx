package states;

import h2d.Bitmap;
import actors.Goblin;
import util.Tools;
import util.Button;
import hxd.Res;
import h2d.Sprite;
import h2d.Tile;
import actors.Projectile;
import h2d.Anim;
import h2d.Text;

class WinState extends BaseState
{

	var score:Int = 0;
	var scoreText:Text;
	var coins:Array<Projectile> = [];
	var goblinSurvivors:Int;
	var greedyGoblinSurvivors:Int;
	var ogreSurvivors:Int;

	

	public override function init():Void 
	{
		goblinSurvivors = Reg.counters["goblins_launched"] - Reg.counters["goblins_harmed"];
		greedyGoblinSurvivors = Reg.counters["greedy_goblins_launched"] - Reg.counters["greedy_goblins_harmed"];
		ogreSurvivors = Reg.counters["ogres_launched"] - Reg.counters["ogres_harmed"];

		new Bitmap(Res.menubackground.toTile(),this);
		util.Tools.createTextStringXY(this,"GROW YOUR", 42, 0);
		util.Tools.createTextStringXY(this,"HOARD", 90, 45);
		scoreText = util.Tools.createTextStringXY(this,"0 Gold",61, 100);
		new util.Button(this, 7, 180, 150, 50, new Bitmap(Res.button.toTile()), "Menu", menu, 27);

		new util.Button(this, 165, 180, 150, 50, new Bitmap(Res.button.toTile()), "Credits", credits, 27);
	}

	public function menu(e:hxd.Event)
	{
		Main.the.changeState(new MenuState());
	}

	public function credits(e:hxd.Event)
	{
		Main.the.changeState(new CreditsState());
	}

	public override function update(dt:Float):Void
	{
		var g:Goblin;
		if (Math.random() <= .005 && ogreSurvivors > 0)
		{
			ogreSurvivors -= 1;
			//g = new Goblin(Res.ogre, 32, 64, 0, 113, 5, 1,.3);
		}

		if (Math.random() <= .005 && greedyGoblinSurvivors > 0)
		{
			greedyGoblinSurvivors -= 1;
			//g = new Goblin(Res.goblinbigbag, 20, 20,0, 153, 1, 3, .3, "greedy_goblin",null,new Animation([3,4,5,4], 5));
		}
		
		if (Math.random() <= .03 && goblinSurvivors > 0)
		{
			goblinSurvivors -= 1;
			//g = new Goblin(Res.goblin1, 20, 20, 0, 153, 1, 1,1);
		}


		if (score < Reg.score && scoreText != null)
		{
			score++;
			scoreText.text = score+" Gold";
			//if(score<=100)
			//{
				coins.push(new Projectile(this,Res.coin_png.toTile(),8,8,150 + Math.round(Math.random()*250) - 125, -100,new Anim([Res.coin_png.toTile().sub(0,0,8,8)],0), 0, 0));
				coins[coins.length-1].setScale(4);
			//}
		}
		for(i in coins)
		{
			if(i.y > Reg.gameHeight)
			{
				i.kill();
				coins.remove(i);
			}
		}
	}
}