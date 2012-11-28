package me.xplabs.edit.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import mx.core.UIComponent;
	import spark.components.Image;
	import spark.components.Panel;
	
	/**
	 * 选择素材的预览图视图
	 * ...
	 * @author xiaohan
	 */
	public class PreviewIcon extends UIComponent 
	{
		private var _image:Image;
		private var _panel:Panel;
		public function PreviewIcon() 
		{
			init();
		}
		
		private function init():void 
		{
			_panel = new Panel();
			_panel.width = 200;
			_panel.height = 150;
			_panel.title = "预览图";
			addChild(_panel);
			
			_image = new Image();
			_image.width = 200;
			_image.height = 120;
			//_image.source = new BitmapData(50, 50, true, 0xff00ff00);
			_panel.addElement(_image);
		}
		
		public function changeImage(bitmapData:BitmapData):void
		{
			_image.source = bitmapData;
			//_panel.title = "预览图";
		}
		
	}

}