package me.xplabs.edit.model 
{
	import flash.geom.Rectangle;
	import me.xplabs.constant.MapConst;
	import me.xplabs.edit.events.GridEvent;
	import me.xplabs.isometric.interfance.IIsoTile;
	import me.xplabs.isometric.iso.IsoTile;
	import me.xplabs.isometric.iso.IsoWorld;
	import me.xplabs.utils.Utils;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MapIsoWorld extends Actor 
	{
		private var _isoWorld:IsoWorld;
		public function MapIsoWorld() 
		{
			super();
			
		}
		public function init(pw:int, ph:int):void
		{
			var gridRect:Rectangle = Utils.pixelToGridRect(pw, ph);
			var rows:int = gridRect.x
			var cols:int = gridRect.y;
			
			var grids:Vector.<Vector.<IsoTile>> = new Vector.<Vector.<IsoTile>>();
			for (var i:int = 0; i < rows; i++) 
			{
				grids[i] = new Vector.<IsoTile>();
				for (var j:int = 0; j < cols; j++) 
				{
					var tile:IsoTile = new IsoTile();
					tile.row = j;
					tile.col = i;
					grids[i][j] = tile;
				}
			}
			
			_isoWorld = new IsoWorld(rows, cols, grids);
			
			var tempEvent:GridEvent = new GridEvent(GridEvent.CREAT_GRID);
			tempEvent.rows = rows;
			tempEvent.cols = cols;
			dispatch(tempEvent);
		}
		
	}

}