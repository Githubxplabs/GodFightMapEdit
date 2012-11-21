package me.xplabs.edit.view 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import me.xplabs.isometric.utils.Isometric;
	import mx.core.UIComponent;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	//public class GridView extends Sprite 
	public class GridView extends UIComponent 
	{
		private var _grid:Array;
		private var _tileWidth:Number = 0;
		private var _tileHeight:Number = 0;
		private var _rows:int;
		private var _cols:int;
		private var _startX:int;;
		public function GridView() 
		{
			super();
		}
		
		public function init(gridRect:Rectangle):void{
			
			
			_rows = gridRect.x;
			_cols = gridRect.y;
			_tileWidth = Isometric.instance.xyTo3d(64, 0).x;
			_tileHeight = _tileWidth;
			_startX = gridRect.width * .5 - 32;
			buildGrid();
		}
		
		public function dispose():void 
		{
			
		}
		private function buildGrid():void {
			_grid = [];
			
			//establish dimensions
			var cols:int = _rows;
			var rows:int = _cols;
			
			//build the grid
			for (var i:int = 0; i < cols;++i) {
				_grid[i] = [];
				for (var j:int = 0; j < rows;++j) {
					//create tile
					var t:GridShape = new GridShape();
					
					//position it in 3D
					var tx:Number = i * _tileWidth;
					var tz:Number = -j * _tileHeight;
					
					//map 3D to screen
					var coord:Point = Isometric.instance.xyTo2d(tx, 0, tz);
					
					//position on screen
					t.x = _startX + coord.x;
					t.y = coord.y;
					//trace(t.x,t.y);
					//store tile
					_grid[i][j] = t;
					
					//add to screen
					addChild(t);
				}
			}
		}
		
	}

}