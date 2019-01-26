package;

import systems.Data;
import hxd.Res;
import Reg;
import states.BaseState;
import states.MenuState;

/**
 * ...
 * @author John Doughty
 */
class Main extends hxd.App
{
    var activeState:BaseState;
	public static var the:Main;

	static function main() 
	{
		Res.initEmbed();
		the = new Main();
	}
	
	override function init() 
	{
		Data.load(Res.data.entry.getText());
		Reg.images = Reg.loadImagesFromImg('data.img');
		engine.backgroundColor = Reg.backgroundColor;
		activeState = new MenuState(s2d);
        activeState.init();
		//engine.fullScreen = true;
		activeState.setScale(engine.width/Reg.gameWidth);
	}
	override function update(dt:Float) 
	{
		activeState.update(dt);
	}
	
	public function changeState(state:BaseState) 
	{
		activeState.kill();
		activeState = state;
		activeState.init();
		s2d.addChild(activeState);
		scaleActiveState();
	}

	function scaleActiveState()
	{
		if(Reg.gameWidth/engine.width > Reg.gameHeight/engine.height)
		{
			activeState.setScale(engine.width/Reg.gameWidth);
			activeState.y = (engine.height - Reg.gameHeight * activeState.scaleY) / 2;
			activeState.x = (engine.width - Reg.gameWidth * activeState.scaleX) / 2;
		}
		else
		{
			activeState.setScale(engine.height/Reg.gameHeight);
			activeState.x = (engine.width - Reg.gameWidth * activeState.scaleX) / 2;
			activeState.y = (engine.height - Reg.gameHeight * activeState.scaleY) / 2;
		}
		
	}

	override function onResize() {
		super.onResize();
		scaleActiveState();
	}
}