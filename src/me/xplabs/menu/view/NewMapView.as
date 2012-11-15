package me.xplabs.menu.view 
{
	import flash.events.MouseEvent;
	import mx.controls.TextInput;
	import mx.core.UIComponent;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.TitleWindow;
	
	/**
	 * 新建地图view
	 * ...
	 * @author xiaohan
	 */
	public class NewMapView extends UIComponent 
	{
		public var clickClose:Function;
		public var clickEnsure:Function;
		private var _tiltleWindow:TitleWindow;
		private var _widthLabel:Label;
		private var _widthTextInput:TextInput;
		private var _heightLabel:Label;
		private var _heightTextInput:TextInput;
		private var _nameLabel:Label;
		private var _nameTextInput:TextInput;
		private var _ensureBtn:Button;
		
		public function NewMapView() 
		{
			init();
		}
		
		private function init():void 
		{
			_tiltleWindow  = new TitleWindow();
			_tiltleWindow.width = 400;
			_tiltleWindow.height = 260;
			_tiltleWindow.title = "新建地图";
			addChild(_tiltleWindow);
			_tiltleWindow.addEventListener(CloseEvent.CLOSE, clickCloseHandler);
			
			_widthLabel = new Label();
			_widthLabel.text = "宽度";
			_widthLabel.setStyle("fontSize",18);
			_widthLabel.x = 20;
			_widthLabel.y = 30;
			_tiltleWindow.addElement(_widthLabel);
			
			_widthTextInput = new TextInput();
			_widthTextInput.text = "输入文本";
			_widthTextInput.width = 100;
			_widthTextInput.x = 60;
			_widthTextInput.y = 29;
			_tiltleWindow.addElement(_widthTextInput);
			
			_heightLabel = new Label();
			_heightLabel.text = "高度";
			_heightLabel.setStyle("fontSize",18);
			_heightLabel.x = 200;
			_heightLabel.y = 30;
			_tiltleWindow.addElement(_heightLabel);
			
			_heightTextInput = new TextInput();
			_heightTextInput.text = "输入文本2";
			_heightTextInput.width = 100;
			_heightTextInput.x = 240;
			_heightTextInput.y = 29;
			_tiltleWindow.addElement(_heightTextInput);
			
			_nameLabel = new Label();
			_nameLabel.text = "地图名称";
			_nameLabel.setStyle("fontSize",18);
			_nameLabel.x = 20;
			_nameLabel.y = 80;
			_tiltleWindow.addElement(_nameLabel);
			
			_nameTextInput = new TextInput();
			_nameTextInput.text = "输入文本2";
			_nameTextInput.width = 100;
			_nameTextInput.x = 100;
			_nameTextInput.y = 79;
			_tiltleWindow.addElement(_nameTextInput);
			
			
			_ensureBtn = new Button();
			_ensureBtn.label = "确定";
			_ensureBtn.width = 100;
			_ensureBtn.height = 30;
			_tiltleWindow.addElement(_ensureBtn);
			_ensureBtn.x = 150;
			_ensureBtn.y = 160;
			_ensureBtn.addEventListener(MouseEvent.CLICK, ensureEnterHandler);
			
		}
		public function get uiW():Number
		{
			return _tiltleWindow.width;
		}
		public function get uiH():Number
		{
			return _tiltleWindow.height;
		}
		
		
		private function ensureEnterHandler(e:MouseEvent):void 
		{
			if (clickEnsure != null) clickEnsure();
		}
		
		private function clickCloseHandler(e:CloseEvent):void 
		{
			if (clickClose != null) clickClose.call();
		}
		
		public function dispose():void
		{
			_tiltleWindow.removeEventListener(CloseEvent.CLOSE, clickCloseHandler);
			_ensureBtn.removeEventListener(MouseEvent.CLICK, ensureEnterHandler);
			_tiltleWindow.removeAllElements();
			_widthLabel = null;
			_widthTextInput = null;
			_heightLabel = null;
			_heightTextInput = null;
			_nameLabel = null;
			_nameTextInput = null;
			_ensureBtn = null;
			_tiltleWindow = null;
			clickEnsure = null;
			clickClose = null;
		}
		
		
	}

}