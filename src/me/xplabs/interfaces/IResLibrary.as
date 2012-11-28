package me.xplabs.interfaces 
{
	
	/**
	 * ...
	 * @author xiaohan
	 */
	public interface IResLibrary 
	{
		/**
		 * 加载资源
		 * @param	data
		 * @param	vars
		 * @param	childrenVars
		 * @return
		 */
		function parse(data:*, vars:Object = null, childrenVars:Object = null):*;
		/**
		 * 获取资源
		 * @param	pkey
		 * @param	cache
		 * @return
		 */
		function getResObj(pkey:String, cache:Boolean = true):*;
		/**
		 * 检测是否有资源
		 * @param	pkey
		 * @return
		 */
		function hasResObj(pkey:String):Boolean;
	}
	
}