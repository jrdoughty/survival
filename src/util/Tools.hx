package util;

import hxd.res.DefaultFont;
import h2d.Object;
import h2d.Bitmap;
import hxd.Res;
import h2d.Text;
import h2d.Tile;

class Tools 
{
    public static function createTextStringXY(p:Object,s:String,x:Float,y:Float)
    {
        var t = new Text(DefaultFont.get(),p);
        t.text = s;
        t.x = x;
        t.y = y;
        return t;
    }
}