package states;

import util.Tools;
import util.Button;
import h2d.Sprite;
import h2d.Text;
import h2d.Bitmap;
import hxd.Res;


class HoardState extends BaseState
{
	private var subHead:Text;
	private var head:Text;
	private var scoreText:Text;
	private var greedCountText:Text;
	private var ogreCountText:Text;
	private var shieldCountText:Text;
	private var menuButtons:Array<Button>;
	private var ogre:Bitmap;
	private var greed:Bitmap;
	private var shield:Bitmap;
	private var coin:Bitmap;

	private static var buttons = [
		"NEXT LEVEL" => [
			"x"        => 40,
			"y"        => 200,
			"width"    => 240,
			"height"   => 30,
			"callback" => 0
		],
		"OGRE" => [
			"x"        => 40,
			"y"        => 155,
			"width"    => 240,
			"height"   => 30,
			"callback" => 1
		],
		"GREEDY GOBLIN" => [
			"x"        => 40,
			"y"        => 120,
			"width"    => 240,
			"height"   => 30,
			"callback" => 2
		],
		"LARGE SHIELD" => [
			"x"        => 40,
			"y"        => 85,
			"width"    => 240,
			"height"   => 30,
			"callback" => 3
		]
	];

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	public override function init():Void
	{
		menuButtons = [];
		Reg.score = 100;

		new Bitmap(Res.menubackground.toTile(),this);
		subHead = util.Tools.createTextStringXY(this,"GROW YOUR", 20, 0);
		head = util.Tools.createTextStringXY(this,"HOARD", 33, 25);
		
		createUnitCounts();
		createButtons();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	public override function kill():Void
	{
		super.kill();
		head = null;
		subHead = null;
		scoreText = null;
		shieldCountText = null;
		greedCountText = null;
		ogreCountText = null;
		menuButtons = [];
		coin = null;
		greed = null;
		shield = null;
		ogre = null;
	}

	/**
	 * Function that is called once every frame.
	 */
	public override function update(dt:Float):Void
	{
		updateUnitCounts();
	}

	private function buy(itemOrUnitName:String)
	{
		if (Reg.score >= Reg.upgrades[itemOrUnitName]["cost"])
		{
			Reg.score -= Reg.upgrades[itemOrUnitName]["cost"];
			Reg.upgrades[itemOrUnitName]["number"] += 1;
		}
	}

	private function play(e:hxd.Event)
	{
		Main.the.changeState(new PlayState());
	}

	private function buyOgre(e:hxd.Event)
	{
		buy("ogre");
	}

	private function buyGreedyGoblin(e:hxd.Event)
	{
		buy("greedy_goblin");
	}

	private function buyShield(e:hxd.Event)
	{
		buy("large_shield");
	}

	private function createButtons()
	{
		var callbacks = [
			play,
			buyOgre,
			buyGreedyGoblin,
			buyShield
		];
		var callbacksWorth = [
			"",
			"1",
			"1",
			"3"
		];

		for (buttonName in buttons.keys())
		{
			var button:Button = new Button(this,buttons[buttonName]["x"],
										   buttons[buttonName]["y"],
										   buttons[buttonName]["width"],
										   buttons[buttonName]["height"],
										   new Bitmap(Res.button.toTile()),
										   buttonName+" " + callbacksWorth[buttons[buttonName]["callback"]],
										   callbacks[buttons[buttonName]["callback"]]);

			menuButtons.push(button);

		}
	}
	
	private function updateUnitCounts()
	{
		ogreCountText.text = Reg.upgrades["ogre"]["number"]+"";
		greedCountText.text = Reg.upgrades["greedy_goblin"]["number"]+"";
		shieldCountText.text = Reg.upgrades["large_shield"]["number"]+"";
		scoreText.text = Reg.score+"";
	}
	
	private function createUnitCounts()
	{
		scoreText = util.Tools.createTextStringXY(this, "0 Gold", 176, 25);
		shieldCountText = util.Tools.createTextStringXY(this, "", 205, 25);
		greedCountText = util.Tools.createTextStringXY(this, "", 236, 25);
		ogreCountText = util.Tools.createTextStringXY(this, "", 268, 25);

		coin = new Bitmap(Res.coin_png.toTile().sub(0,0,8,8), this);
		coin.scaleX = 2;
		coin.scaleY = 2;
		shield = new Bitmap(Res.shieldui.toTile(),this);
		greed = new Bitmap(Res.goblinbigbag.toTile().split(Std.int(Res.goblinbigbag.toTile().width/20))[0], this);
		ogre = new Bitmap(Res.ogre.toTile().sub(0,0,32,48), this);
		coin.x = 180;
		coin.y = 2;
		shield.x = 210;
		shield.y = 2;
		greed.x = 240;
		greed.y = 2;
		ogre.x = 266;
		ogre.y = 0;
		ogre.setScale(.5);
		
	}
}