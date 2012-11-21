package me.xplabs.interfaces
{
	
	/**
	 * 容器的规格尺寸
	 * ...
	 * @author xiaohan
	 */
	public interface IViewStandard 
	{	
		/**
		 * 设置宽高
		 * @param	pw
		 * @param	ph
		 */
		function setWH(pw:int, ph:int):void;
		/**
		 * 设置坐标
		 * @param	px
		 * @param	py
		 */
		function setXY(px:int, py:int):void;
	}
	
}