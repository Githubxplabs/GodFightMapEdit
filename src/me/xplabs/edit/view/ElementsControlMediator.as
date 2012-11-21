package me.xplabs.edit.view 
{
	import me.xplabs.edit.events.MapResizeEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class ElementsControlMediator extends Mediator 
	{
		[Inject]
		public var elementsConrolView:ElementsControlView;
		public function ElementsControlMediator() 
		{
			super();
			
		}
		
		override public function onRegister():void 
		{
			super.onRegister();
			elementsConrolView.init();
			elementsConrolView.x = 800;
			elementsConrolView.y = 20;
			
			addContextListener(MapResizeEvent.UPDATE_RESIZE, updateResizeHandler);
		}
		
		private function updateResizeHandler(e:MapResizeEvent):void 
		{
			elementsConrolView.setXY(e.stageW - 200, -1);
		}
	}

}