package states;

interface IState
{
	public function init():Void;

	public function kill():Void;

	public function update(dt:Float):Void;

}