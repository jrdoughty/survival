package states;
import h2d.Object;
/*
import util.Button;
import kha2d.Scene;
import util.Text;
*/
class BaseState implements IState extends Object
{

	public function init():Void
	{

	}
	public function update(dt:Float):Void
	{

	}

	public function kill():Void
	{
		removeChildren();
		remove();
	}
}