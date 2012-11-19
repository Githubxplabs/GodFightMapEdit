package me.xplabs.edit.controller 
{
	import me.xplabs.edit.view.ElementsControlMediator;
	import me.xplabs.edit.view.ElementsControlView;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class ElementsControlCommand extends Command 
	{
		
		public function ElementsControlCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
			
			if (!mediatorMap.hasMapping(ElementsControlView)) mediatorMap.mapView(ElementsControlView, ElementsControlMediator);
			contextView.addChild(new ElementsControlView());
			
		}
		
	}

}