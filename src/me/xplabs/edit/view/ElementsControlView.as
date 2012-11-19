package me.xplabs.edit.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.XMLListCollection;
	import mx.containers.VBox;
	import mx.controls.TileList;
	import mx.core.UIComponent;
	import mx.events.ListEvent;
	import spark.components.ComboBox;
	import spark.components.DropDownList;
	import spark.components.Image;
	import spark.components.TileGroup;
	import spark.events.IndexChangeEvent;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class ElementsControlView extends UIComponent 
	{
		private var _previewIcon:PreviewIcon;
		private var _dropDownList:DropDownList;
		private var _tileList:TileList;
		private var _tileGroup:TileGroup;
		[Embed(source = "../../../../assets/mouse/blueHand.png")]
		public const phone2:Class;

		
		private var _images:Vector.<Image>;
		public function ElementsControlView() 
		{
			super();
		}
		public function init():void
		{
			_previewIcon = new PreviewIcon();
			addChild(_previewIcon);
			
			_dropDownList = new DropDownList();
			_dropDownList.y = 150;
			_dropDownList.width = 200;
			_dropDownList.height = 20;
			_dropDownList.selectedIndex = 0;
			_dropDownList.labelField = "label";
			_dropDownList.dataProvider = new ArrayCollection([
					{label:"草地", data:"1A"}, 
                    {label:"建筑", data:"1B"}, 
                    {label:"树木", data:"1C"}, 
                ]);
			addChild(_dropDownList);
			
			_dropDownList.addEventListener(IndexChangeEvent.CHANGE, dropDownListChangeHandler);
			
			
			_tileGroup = new TileGroup();
			_tileGroup.width = 200;
			_tileGroup.height = 390;
			_tileGroup.y = 170;
			_tileGroup.horizontalGap = 100;
			_tileGroup.verticalGap = 100;
			//_tileGroup.requestedColumnCount = 2;
			addChild(_tileGroup);
			
			_images = new Vector.<Image>();
			
			var image:Image = new Image();
			image.source = new phone2();
			var image1:Image = new Image();
			image1.source = new phone2();
			var image2:Image = new Image();
			image2.source = new phone2();
			var image3:Image = new Image();
			image3.source = new phone2();
			_tileGroup.addElement(image);
			_tileGroup.addElement(image1);
			_tileGroup.addElement(image2);
			_tileGroup.addElement(image3);
			
			_images.push(image);
			_images.push(image1);
			_images.push(image2);
			_images.push(image3);

			_tileGroup.addEventListener(MouseEvent.MOUSE_MOVE, tileMouseMoveHandler);
			
			
		}
		
		private function dropDownListChangeHandler(e:IndexChangeEvent):void 
		{
			trace(e.newIndex);
			
		}
		
		
		private function updateResouce(ptype:int):void
		{
			
		}
		
		private function tileMouseMoveHandler(e:MouseEvent):void 
		{
			var row:int = e.localX / 100;
			var col:int = e.localY / 100;
			
			var tempIndex:int = col * 2 + row;
			if (tempIndex >= _images.length) return;
			
			
		}
		
		private function onItemClick(e:ListEvent):void 
		{
			trace("点击");
		}
		
		private function onChange(e:ListEvent):void 
		{
			trace("切换");
		}
		
	}

}