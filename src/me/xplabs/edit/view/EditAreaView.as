package me.xplabs.edit.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import me.xplabs.interfaces.IViewStandard;
	import me.xplabs.utils.Utils;
	import mx.containers.Panel;
	import spark.components.Image;
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
		
		
		private var _image:Image;
		
		public function EditAreaView() 
		{
		}
		
		public function init(pw:int,ph:int):void 
		{
			_titleWindow = new TitleWindow();
			_titleWindow.width = 800;
			_titleWindow.height = 550;
			_titleWindow.title = "编辑区域";
			_titleWindow.autoLayout = false;
			addChild(_titleWindow);
			
			
			_image = new Image();
			_image.x = 0;
			_image.y = 0;
			_titleWindow.addElement(_image);
			
			var gridRect:Rectangle = Utils.pixelToGridRect(pw, ph);
			_gridView = new GridView();
			/*_gridView.width = gridRect.width;
			_gridView.height = gridRect.height;*/
			_gridView.width = pw;
			_gridView.height = ph;
			_gridView.init(gridRect, pw, ph);
			_titleWindow.addElement(_gridView);
			_gridView.x = 0;
			_gridView.y = 0;
			
			/*_titleWindow.horizontalScrollPosition = gridRect.width * .5;
			 * _titleWindow.verticalScrollPosition = gridRect.height * .5;*/
			_titleWindow.horizontalScrollPosition = pw * .5;
			_titleWindow.verticalScrollPosition = ph * .5;
		}
		
		public function setBitmapData(bitmapData:BitmapData):void
		{
			//_backGroundLayer.bitmapData = bitmapData;
			if (_image.source && _image.source is BitmapData)
			{
				(_image.source as BitmapData).dispose();
			}
			_image.source = bitmapData;
			_image.width = bitmapData.width;
			_image.height = bitmapData.height;
			/*_image.x = (_gridView.width - bitmapData.width) * .5;
			_image.y = (_gridView.height - bitmapData.height) * .5;*/
			_image.x = 0;
			_image.y = 0;
			_gridView.x = 0;
			_gridView.y = 0;
			trace(_gridView.width , _gridView.height, _image.width, _image.height);
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
		
		public function showGridHandler():void 
		{
			_gridView.visible = true;
		}
		
		public function hideGridHandler():void 
		{
			_gridView.visible = false;
		}
	}

}