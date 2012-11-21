package me.xplabs.edit.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import me.xplabs.interfaces.IViewStandard;
	import me.xplabs.utils.Utils;
	import mx.containers.Panel;
	//import spark.components.TitleWindow;
	import mx.containers.TitleWindow;
	import mx.containers.VBox;
	import mx.controls.scrollClasses.ScrollBar;
	import mx.core.UIComponent;
	import spark.components.Group;
	import spark.components.TileGroup;
	
	/**
	 * 编辑视图区域
	 * ...
	 * @author xiaohan
	 */
	public class EditAreaView extends UIComponent implements IViewStandard
	{
		private var _titleWindow:TitleWindow;
		private var _gridView:GridView;
		
		private var _backGroundLayer:Bitmap;
		public function EditAreaView() 
		{
		}
		
		public function init(pw:int,ph:int):void 
		{
			_titleWindow = new TitleWindow();
			_titleWindow.width = 800;
			_titleWindow.height = 550;
			_titleWindow.title = "编辑区域";
			addChild(_titleWindow);
			
			var gridRect:Rectangle = Utils.pixelToGridRect(pw, ph);
			_gridView = new GridView();
			_gridView.width = gridRect.width;
			_gridView.height = gridRect.height;
			_gridView.init(gridRect);
			_titleWindow.addElement(_gridView);
			
			_titleWindow.verticalScrollPosition = gridRect.height * .5;
			_titleWindow.horizontalScrollPosition = gridRect.width * .5;
			
		}
		
		public function setBitmapData(bitmapData:BitmapData):void
		{
		}
		
		public function dispose():void
		{
			_titleWindow.removeAllChildren();
			_titleWindow.removeAllElements();
			_gridView.dispose();
		}
		
		/* INTERFACE IViewStandard */
		
		public function setWH(pw:int, ph:int):void 
		{
			_titleWindow.width = pw;
			_titleWindow.height = ph;
			//trace("编辑区域大小" + _titleWindow.width, _titleWindow.height);
		}
		
		public function setXY(px:int, py:int):void 
		{
			
		}
	}

}