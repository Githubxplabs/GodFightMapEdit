package me.xplabs.menu.view 
{
	import me.xplabs.menu.events.MapMenuEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class MenuViewMediator extends Mediator 
	{
		[Inject]
		public var menuView:MenuView;
		public function MenuViewMediator() 
		{
			super();
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			menuView.itemClick = menuItemClickHandler;
		}
		
		private function menuItemClickHandler(ptype:String):void 
		{
			dispatch(new MapMenuEvent(ptype));
		}
		
	}

}