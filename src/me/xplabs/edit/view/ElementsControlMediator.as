package me.xplabs.edit.view 
{
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
		}
	}

}