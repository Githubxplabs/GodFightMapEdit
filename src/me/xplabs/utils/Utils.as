package me.xplabs.utils 
{
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
			var rows:int = int((pw / 4 + ph * .5) / (MapConst.tileH * .5)) + 1;
			var height:int = rows * MapConst.tileH;
			return new Rectangle(rows, rows, height * 2, height);
		}
	}

}