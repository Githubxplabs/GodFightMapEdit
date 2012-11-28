package me.xplabs.edit.view
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import me.xplabs.interfaces.IImageRes;
	import me.xplabs.interfaces.IResLibrary;
	import me.xplabs.interfaces.IResName;
	import me.xplabs.interfaces.IViewStandard;
	import mx.collections.ArrayCollection;
	import mx.core.Container;
	import mx.core.UIComponent;
	import spark.components.DropDownList;
	import spark.components.Image;
	import spark.events.IndexChangeEvent;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class ElementsControlView extends UIComponent implements IViewStandard
	{
		private var _previewIcon:PreviewIcon;
		private var _dropDownList:DropDownList;
		private var _images:Vector.<ImageRes>;
		public var resLibrary:IResLibrary;
		public var resName:IResName;
		private var _box:Container;
		private var _filters:Array;
		
		public var imageClick:Function;
		
		public function ElementsControlView()
		{
			super();
		}
		
		public function init():void
		{
			
			_filters = [new GlowFilter(0xDB06F9, 1, 6, 6, 4, 1)];
			_previewIcon = new PreviewIcon();
			addChild(_previewIcon);
			
			_dropDownList = new DropDownList();
			_dropDownList.y = 150;
			_dropDownList.width = 200;
			_dropDownList.height = 20;
			_dropDownList.selectedIndex = 0;
			_dropDownList.labelField = "label";
			_dropDownList.dataProvider = new ArrayCollection([ /*{label:"草地", data:"grass"}, */ /*{label:"建筑", data:"build"}, */{label: "树木", data: "tree"}, {label: "石头", data: "stone"},]);
			addChild(_dropDownList);
			
			_dropDownList.addEventListener(IndexChangeEvent.CHANGE, dropDownListChangeHandler);
			
			_box = new Container();
			_box.width = 200;
			_box.height = 390;
			_box.y = 170;
			_box.autoLayout = false;
			addChild(_box);
			_images = new Vector.<ImageRes>();
			updateRes("tree");
		}
		
		private function updateRes(pkey:String):void
		{
			var len:int = _images.length;
			for (var j:int = 0; j < len; j++)
			{
				_images[i].source = null;
				_images[i].removeEventListener(MouseEvent.CLICK, imageClickHandler);
				_images[i].removeEventListener(MouseEvent.MOUSE_OVER, imageOverHandler);
				_images[i].removeEventListener(MouseEvent.MOUSE_OUT, imageOutHandler);
			}
			_images.length = 0;
			_box.removeAllElements();
			
			var tempResNames:Vector.<String> = resName.getResName(pkey);
			len = tempResNames.length;
			for (var i:int = 0; i < len; i++)
			{
				var image:ImageRes = new ImageRes();
				image.width = 90;
				image.height = 100;
				image.x = (i % 2) * 90;
				image.y = int(i / 2) * 100;
				image.resName = pkey + "." + tempResNames[i];
				image.source = resLibrary.getResObj(pkey + "." + tempResNames[i]);
				image.addEventListener(MouseEvent.CLICK, imageClickHandler);
				image.addEventListener(MouseEvent.MOUSE_OVER, imageOverHandler);
				image.addEventListener(MouseEvent.MOUSE_OUT, imageOutHandler);
				_box.addElement(image);
				//trace(image.id,image.uid);
			}
		}
		
		private function imageOverHandler(e:MouseEvent):void
		{
			e.currentTarget.filters = _filters;
		}
		private function imageOutHandler(e:MouseEvent):void
		{
			e.currentTarget.filters = [];
		}
		
		private function imageClickHandler(e:MouseEvent):void
		{
			if (imageClick != null) imageClick(IImageRes(e.currentTarget));
			changeImage(ImageRes(e.currentTarget).bitmapData);
			//trace("鼠标点击");
		}
		public function changeImage(bitmapData:BitmapData):void
		{
			_previewIcon.changeImage(bitmapData);
		}
		
		/* INTERFACE me.xplabs.interfaces.IViewStandard */
		
		public function setWH(pw:int, ph:int):void
		{
			_box.height = ph - 170;
		}
		
		public function setXY(px:int, py:int):void
		{
			if (px != -1)
				this.x = px;
			if (py != -1)
				this.y = py;
		}
		
		private function dropDownListChangeHandler(e:Event):void
		{
			updateRes(_dropDownList.selectedItem.data);
		}
		
		private function updateResouce(ptype:int):void
		{
		
		}
		
		private function tileMouseMoveHandler(e:MouseEvent):void
		{
			var row:int = e.localX / 100;
			var col:int = e.localY / 100;
			
			var tempIndex:int = col * 2 + row;
			if (tempIndex >= _images.length)
				return;
		
		}
	}
}