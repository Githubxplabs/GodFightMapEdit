package me.xplabs.menu.view 
{
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
		public function MenuViewMediator() 
		{
			super();
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			_functions = new Dictionary();
			menuView.itemClick = menuItemClickHandler;
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