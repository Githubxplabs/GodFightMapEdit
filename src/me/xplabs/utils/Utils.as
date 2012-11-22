package me.xplabs.utils 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.IBitmapDrawable;
	import flash.display.Shape;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import me.xplabs.constant.MapConst;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class Utils 
	{
		
		public function Utils() 
		{
			
		}
		/**
		 * 地图大小转化为需要最小的网格数量及地图最小大小
		 * @param	pw
		 * @param	ph
		 * @return Rectangle
		 */
		public static function pixelToGridRect(pw:int, ph:int):Rectangle
		{
			var rows:int = int((pw / 4 + ph * .5) / (MapConst.tileH * .5));
			var height:int = rows * MapConst.tileH;
			return new Rectangle(rows, rows, height * 2, height);
		}
		/**
		 * 获取等角菱形的BitmapData
		 * @return
		 */
		public static function getIsoDiamond():BitmapData
		{
			var shape:Shape = new Shape();
			shape.graphics.lineStyle(1);
			shape.graphics.moveTo(32, 0);
			shape.graphics.lineTo(0, 16);
			shape.graphics.lineTo(32, 32);
			shape.graphics.lineTo(64, 16);
			shape.graphics.lineTo(32, 0);
			shape.graphics.endFill();
			var bitmapData:BitmapData = new BitmapData(64, 32, true, 0xffffffff);
			bitmapData.draw(shape);
			return bitmapData;
		}
	}

}