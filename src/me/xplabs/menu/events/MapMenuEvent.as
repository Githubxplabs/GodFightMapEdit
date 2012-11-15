package me.xplabs.menu.events 
{
	import flash.events.Event;
	
	/**
	 * 事件类型参见MenuType.as
	 * ...
	 * @author xiaohan
	 */
	public class MapMenuEvent extends Event 
	{
		/**
		 * 新建地图
		 */
		public static const NEW_MAP:String = "MapMenuEvent.NEW_MAP";
		/**
		 * 保存地图
		 */
		public static const SAVE_MAP:String = "MapMenuEvent.SAVE_MAP";
		/**
		 * 导入地图
		 */
		public static const IMPORT_MAP:String = "MapMenuEvent.IMPORT_MAP";
		/**
		 * 导出地图
		 */
		public static const EXPORT_MAP:String = "MapMenuEvent.EXPORT_MAP";
		/**
		 * 导入背景
		 */
		public static const IMPORT_BACKGROUND:String = "MapMenuEvent.IMPORT_BACKGROUND";
		/**
		 * 导出网格
		 */
		public static const EXPORT_GRID:String = "MapMenuEvent.EXPORT_GRID";
		
		/**
		 * 显示网格
		 */
		public static const SHOW_GRID:String = "MapMenuEvent.SHOW_GRID";
		/**
		 * 隐藏网格
		 */
		public static const HIDE_GRID:String = "MapMenuEvent.HIDE_GRID";
		/**
		 * 显示草地
		 */
		public static const SHOW_GRASS:String = "MapMenuEvent.SHOW_GRASS";
		/**
		 * 隐藏草地
		 */
		public static const HIDE_GRASS:String = "MapMenuEvent.HIDE_GRASS";
		/**
		 * 显示建筑
		 */
		public static const SHOW_BUILDING:String = "MapMenuEvent.SHOW_BUILDING";
		/**
		 * 隐藏建筑
		 */
		public static const HIDE_BUILDING:String = "MapMenuEvent.HIDE_BUILDING";
		
		/**
		 * 关于
		 */
		public static const ABOUT:String = "MapMenuEvent.ABOUT";
		public function MapMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}

}