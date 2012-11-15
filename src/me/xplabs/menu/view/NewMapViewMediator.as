package me.xplabs.menu.view 
{
	import me.xplabs.menu.events.NewMapEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * 新建地图Mediator
	 * ...
	 * @author xiaohan
	 */
	public class NewMapViewMediator extends Mediator 
	{
		[Inject]
		public var newMapView:NewMapView;
		public function NewMapViewMediator() 
		{
			super();
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			newMapView.clickClose = clickCloseHandler;
			newMapView.clickEnsure = clickEnsureHandler;
		}
		
		private function clickEnsureHandler():void 
		{
			dispatch(new NewMapEvent(NewMapEvent.ENTER_NEW_MAP));
			clickCloseHandler();
		}
		
		private function clickCloseHandler():void 
		{
			if (newMapView.parent) newMapView.parent.removeChild(newMapView);
		}
		
		override public function onRemove():void 
		{
			super.onRemove();
			newMapView.dispose();
			newMapView = null;
		}
		
	}

}