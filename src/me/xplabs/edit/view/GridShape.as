package me.xplabs.edit.view 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	//public class GridShape extends Shape 
	public class GridShape extends Sprite 
	{
		private var _textField:TextField;
		public function GridShape() 
		{
			super();
			initialize();
		}
		
		private function initialize():void
		{
			graphics.lineStyle(1);
			graphics.moveTo(32, 0);
			graphics.lineTo(0, 16);
			graphics.lineTo(32, 32);
			graphics.lineTo(64, 16);
			graphics.lineTo(32, 0);
			graphics.endFill();
			
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
		
	}

}