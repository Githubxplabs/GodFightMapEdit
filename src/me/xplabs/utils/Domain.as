package me.xplabs.utils 
{
	/**
	 * 资源路径管理
	 * ...
	 * @author xiaohan
	 */
	public class Domain 
	{
		public static const format_swf:String = "swf";
		public static const format_xml:String = "xml";
		public static const format_map:String = "map";
		
		public static const res:String = "resource/";
		
		
		public static const stone:String = res + "stone/r";
		public static const tree:String =  res + "tree/r";
		
		
		
		
		public static const resConfig:String = res + "resConfig.xml";
		
		public static function format(pkey:String,ptype:int):String
		{
			var tempKey:String;
			switch(ptype)
			{
				case ResType.T_SWF:
					tempKey = pkey + "." + format_swf;
					break;
				case ResType.T_XML:
					tempKey = pkey + "." + format_xml;
					break;
				case ResType.T_MAP:
					tempKey = pkey + "." + format_map;
					break;
			}
			return tempKey;
		}
		public static function format_getRes(pkey:String):String
		{
			pkey = pkey.replace(res, "");
			pkey = pkey.replace(/\//g, ".");
			return pkey;
		}
	}
}