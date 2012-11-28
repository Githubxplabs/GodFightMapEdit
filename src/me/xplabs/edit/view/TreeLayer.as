package me.xplabs.edit.view 
{
	import me.xplabs.interfaces.IViewStandard;
	import mx.core.Container;
	import mx.core.IVisualElement;
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public class TreeLayer extends  Container implements IViewStandard 
	{
		public function TreeLayer() 
		{
			
		}
		
		override public function addElement(element:mx.core.IVisualElement):IVisualElement 
		{
			return super.addElement(element);
		}
		override public function removeElement(element:mx.core.IVisualElement):IVisualElement 
		{
			return super.removeElement(element);
		}
	}

}