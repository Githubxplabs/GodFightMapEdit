package me.xplabs.menu.view 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import me.xplabs.edit.events.EditEvent;
	import me.xplabs.menu.events.MapMenuEvent;
	import me.xplabs.menu.events.NewMapEvent;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MenuViewMediator extends Mediator 
	{
		[Inject]
		public var menuView:MenuView;
		private var _functions:Dictionary;
		private var _curClickType:String;
		private var _file:File;
		public function MenuViewMediator() 
		{
			super();
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			_functions = new Dictionary();
			menuView.itemClick = menuItemClickHandler;
			_file = new File();
			_file.addEventListener(Event.SELECT, fileSelectHandler);
		}
		
		private function fileSelectHandler(e:Event):void 
		{
			var url:String = File(e.currentTarget).nativePath;
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderComplementHandler);
			loader.load(new URLRequest(url));
		}
		
		private function loaderComplementHandler(e:Event):void 
		{
			var loaderInfo:LoaderInfo = LoaderInfo(e.currentTarget);
			loaderInfo.removeEventListener(Event.COMPLETE, loaderComplementHandler);
			
			var event:EditEvent = new EditEvent(EditEvent.LOADER_BACKGROUND);
			event.data = Bitmap(loaderInfo.content).bitmapData;
			dispatch(event);
			
			loaderInfo.loader.unload();
			loaderInfo.loader.unloadAndStop();
			loaderInfo = null;
		}
		
		private function menuItemClickHandler(ptype:String):void 
		{
			if (_functions[ptype])
			{
				_curClickType = ptype;
				switch(ptype)
				{
					case MapMenuEvent.NEW_MAP:
						Alert.show("地图已经被创建，你确定要关闭当前编辑面板，重新创建新面板吗？", "友情提示", Alert.YES | Alert.NO, null,clickCloseHandler);
						return;
				}
			}
			_functions[ptype] = true
			switch(ptype)
			{
				case MapMenuEvent.CLOSE_MAP:
					_functions[ptype] = false;
					dispatch(new EditEvent(EditEvent.CLOSE_EDIT_MAP));
					return;
				case MapMenuEvent.IMPORT_BACKGROUND:
					if (!_functions[MapMenuEvent.NEW_MAP])
					{
						Alert.show("没创建地图，无法进行导入背景图片，请先新建地图！", "友情提示");
					}else
					{
						_file.browse();
					}
					return;
				default:
					dispatch(new MapMenuEvent(ptype));
					return;
			}
		}
		
		private function clickCloseHandler(e:CloseEvent):void 
		{
			switch(_curClickType)
			{
				case MapMenuEvent.NEW_MAP:
					if (e.detail == Alert.YES)
					{
						dispatch(new EditEvent(EditEvent.CLOSE_EDIT_MAP));
						dispatch(new MapMenuEvent(_curClickType));
					}
					break;
			}
		}
		
	}

}