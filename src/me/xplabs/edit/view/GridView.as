package me.xplabs.edit.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import me.xplabs.constant.MapConst;
	import me.xplabs.isometric.utils.Isometric;
	import me.xplabs.utils.Utils;
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
		private var _startX:int;
		private var _rowframe:int;
		private var _colframe:int;
		private var _totalframe:int;
		private var _gap:int = 10;
		private var _left_up:Point;
		private var _right_up:Point;
		private var _left_down:Point;
		private var _right_down:Point;
		//private var _graphics:BitmapData;
		
		
		
		
		public function GridView() 
		{
			super();
		}
		
		public function init(gridRect:Rectangle, mapW:int, mapH:int):void{
			
			
			_rows = gridRect.x;
			_cols = gridRect.y;
			_tileWidth = Isometric.instance.xyTo3d(64, 0).x;
			_tileHeight = _tileWidth;
			_startX = gridRect.width * .5 - 32;
			_colframe = 0;
			_totalframe = Math.ceil(_rows / _gap);
			addEventListener(Event.ENTER_FRAME, onEnterframe);

			
			//_graphics = Utils.getIsoDiamond();
			
			//var height:Number = gridRect.height * .5;
			var tempRows:int = int(((gridRect.height * .5) - mapH * .5) / (MapConst.tileH * .5));
			//var height2:Number = height - mapW * .5;
			_left_up = new Point(0, tempRows);
			Isometric.instance.ptCellToMatrix(_left_up, _left_up)
			_right_down = new Point(gridRect.y, gridRect.y - tempRows);
			Isometric.instance.ptCellToMatrix(_right_down, _right_down)
		}
		
		private function onEnterframe(e:Event):void 
		{
			buildGrid();
		}
		
		public function dispose():void 
		{
			
		}
		private function buildGrid():void {
			this.x = 0;
			this.y = 0;
			if (_colframe >= _totalframe) 
			{
				removeEventListener(Event.ENTER_FRAME, onEnterframe);
				return;
			}
			_grid = [];
			
			//establish dimensions
			var cols:int = _rows;
			var rows:int = _cols;
			
			var startR:int = _colframe * _gap;
			var endR:int = Math.min(_colframe * _gap + _gap, _cols);
			
			
			//build the grid
			var pts1:Point = new Point();
			var pts2:Point = new Point();
			for (var i:int = startR; i < endR;++i) {
				_grid[i] = [];
				for (var j:int = 0; j < rows;++j) {
					pts1.x = i;
					pts1.y = j;
					Isometric.instance.ptCellToMatrix(pts1, pts2);
					if (pts2.x < _left_up.x || pts2.y < _left_up.y || pts2.x > _right_down.x - 1 || pts2.y > _right_down.y)
					{
						_grid[i][j] = null;
						//trace(pts1, pts2);
						continue;
					}
					
					
					var t:GridShape = new GridShape();
					//t.text = "(" + pts1.x + "," + pts1.y + ")" + "(" + pts2.x + "," + pts2.y + ")";
					//t.text = "(" + pts1.x + "," + pts1.y + ")";
					//t.text = "(" + pts2.x + "," + pts2.y + ")";
					var tx:Number = i * _tileWidth;
					var tz:Number = -j * _tileHeight;
					
					var coord:Point = Isometric.instance.xyTo2d(tx, 0, tz);
					t.x = _startX + coord.x;
					t.y = coord.y;
					_grid[i][j] = t;
					addChild(t);
				}
			}
			_colframe++;
		}
		
	}

}