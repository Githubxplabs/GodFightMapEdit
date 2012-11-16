package me.xplabs.menu.view 
{
	import flash.display.Sprite;
	import me.xplabs.menu.events.MapMenuEvent;
	import mx.containers.Box;
	import mx.containers.Canvas;
	import mx.containers.Panel;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.MenuBar;
	import mx.core.UIComponent;
	import mx.events.MenuEvent;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MenuView extends UIComponent 
	{
		private var _menuBar:MenuBar;
		public var itemClick:Function;
		public function MenuView() 
		{
			init();
		}
		
		private function init():void
		{
			var canvas:Canvas = new Canvas();
			canvas.autoLayout = true;
			canvas.width = 500;
			canvas.height = 50;
			addChild(canvas);
			
			_menuBar = new MenuBar();
			_menuBar.labelField = "@label";
			_menuBar.dataProvider =  <>
                    <menuitem label="文件" data="top1">
                        <menuitem label="新建地图" data="1A"/>
                        <menuitem label="保存地图" data="1B"/>
                        <menuitem label="导入地图" data="1C"/>
                        <menuitem label="导出地图" data="1D"/>
                        <menuitem label="导入背景" data="1E"/>
                        <menuitem label="导出网格" data="1F"/>
                        <menuitem label="关闭地图" data="1G"/>
                    </menuitem>
					<menuitem label="视图" data="top2">
                        <menuitem label="显示网格" data="2A"/>
                        <menuitem label="隐藏网格" data="2B"/>
                        <menuitem label="显示草地" data="2C"/>
                        <menuitem label="隐藏草地" data="2D"/>
                        <menuitem label="显示建筑" data="2E"/>
                        <menuitem label="隐藏建筑" data="2F"/>
                    </menuitem>
					<menuitem label="帮助" data="top3">
                        <menuitem label="关于" data="3A"/>
                    </menuitem>
                </>;
			addChild(_menuBar);
			canvas.addElement(_menuBar);
			
			_menuBar.addEventListener(MenuEvent.ITEM_CLICK, itemClickHandler);
		}
		
		private function itemClickHandler(e:MenuEvent):void 
		{
			var tempType:String;
			trace(e.item.@data);
			switch(String(e.item.@data))
			{
				case "1A":
					tempType = MapMenuEvent.NEW_MAP;
					break;
				case "1B":
					tempType = MapMenuEvent.SAVE_MAP;
					break;
				case "1C":
					tempType = MapMenuEvent.IMPORT_MAP;
					break;
				case "1D":
					tempType = MapMenuEvent.EXPORT_MAP;
					break;
				case "1E":
					tempType = MapMenuEvent.IMPORT_BACKGROUND;
					break;
				case "1F":
					tempType = MapMenuEvent.EXPORT_GRID;
					break;
				case "1G":
					tempType = MapMenuEvent.CLOSE_MAP;
					break;
				case "2A":
					tempType = MapMenuEvent.SHOW_GRID;
					break;
				case "2B":
					tempType = MapMenuEvent.HIDE_GRID;
					break;
				case "2C":
					tempType = MapMenuEvent.SHOW_GRASS;
					break;
				case "2D":
					tempType = MapMenuEvent.HIDE_GRASS;
					break;
				case "2E":
					tempType = MapMenuEvent.SHOW_BUILDING;
					break;
				case "2F":
					tempType = MapMenuEvent.HIDE_BUILDING;
					break;
				case "3A":
					tempType = MapMenuEvent.ABOUT;
					break;
				default:
					Alert.show("此功能暂没开放!", "友情提示");
					return;
			}
			if (itemClick != null) itemClick(tempType);
			//trace(e.item.@data, e.label);
		}
	}

}