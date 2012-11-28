package me.xplabs.edit.view 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class GridShape extends Sprite 
	{
		private var _textField:TextField;
		public var clickCall:Function;
		public var row:int;
		public var col:int;
		public var colorType:int;
		public var isHinder:Boolean;
		public var isCenter:Boolean;

		public function GridShape() 
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			//alpha = .5;
			delFillColor();
			addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(e:MouseEvent):void 
		{
			if (clickCall != null) clickCall(row, col);
		}
		
		public function set text(value:String):void
		{
			if (!_textField)
			{
				_textField = new TextField();
				_textField.textColor = 0xDD0005;
				addChild(_textField);
			}
			var textFormat:TextFormat = _textField.defaultTextFormat;
			_textField.text = value;
			textFormat.size = 9;
			_textField.x = 10;
			_textField.y = 7;
			_textField.setTextFormat(textFormat);
			
		}
		
		public function fillColor(color:uint):void
		{
			graphics.clear();
			graphics.beginFill(color);
			drawLineShape();
		}
		public function delFillColor():void
		{
			graphics.clear();
			graphics.beginFill(0x000000, 0);
			drawLineShape();
		}
		private function drawLineShape():void
		{
			graphics.lineStyle(1);
			/*graphics.moveTo(32, 0);
			graphics.lineTo(0, 16);
			graphics.lineTo(32, 32);
			graphics.lineTo(64, 16);
			graphics.lineTo(32, 0);*/
			/*graphics.moveTo(0, -16);
			graphics.lineTo(-32, 0);
			graphics.lineTo(0, 16);
			graphics.lineTo(32, 0);
			graphics.lineTo(0, -16);*/
			graphics.moveTo(0, 0);
			graphics.lineTo(-32, 16);
			graphics.lineTo(0, 32);
			graphics.lineTo(32, 16);
			graphics.lineTo(0, 0);
			graphics.endFill();
		}
	}

}