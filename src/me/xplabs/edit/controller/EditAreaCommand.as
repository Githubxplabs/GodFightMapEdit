package me.xplabs.edit.controller 
{
	import me.xplabs.edit.view.EditAreaMediator;
	import me.xplabs.edit.view.EditAreaView;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class EditAreaCommand extends Command 
	{
		
		public function EditAreaCommand() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			super.execute();
						
			if (!mediatorMap.hasMapping(EditAreaView)) mediatorMap.mapView(EditAreaView, EditAreaMediator);
			contextView.addChild(new EditAreaView());
			
		}
		
	}

}