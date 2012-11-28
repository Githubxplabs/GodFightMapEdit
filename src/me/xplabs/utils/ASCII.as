package me.xplabs.utils 
{
	/**
	 * ...
	 * @author Scott Lee
	 */
	public class ASCII 
	{
		public static function isASCII(x:int):Boolean
		{
			return x >= 0 && x <= 127;
		}
		
		/** Returns true if <i>x</i> is a decimal digit ([0-9]). */
		public static function isDigit(x:int):Boolean
		{
			return x >= ZERO && x <= NINE;
		}
		
		/** Returns true if <i>x</i> is whitespace. */
		public static function isWhite(x:int):Boolean
		{
			return x <= SPACE;
		}
		
		/** Returns true if <i>x</i> is printable. */
		public static function isPrintable(x:int):Boolean
		{
			return x >= EXCLAM && x <= TILDE;
		}
		
		/** Returns true if <i>x</i> is a uppercase alphabetic character ([A-Z]). */
		public static function isUpperCaseAlphabetic(x:int):Boolean
		{
			return x >= A && x <= Z;
		}
		
		/** Returns true if <i>x</i> is a lowercase alphabetic character ([a-z]). */
		public static function isLowerCaseAlphabetic(x:int):Boolean
		{
			return x >= a && x <= z;
		}
		
		/** Returns true if <i>x</i> is an alphabetic character ([a-z,A-Z]). */
		public static function isAlphabetic(x:int):Boolean
		{
			return isUpperCaseAlphabetic(x) || isLowerCaseAlphabetic(x);
		}
		
		/** Returns true if <i>x</i> is a alphanumeric character ([a-zA-Z0-9]). */
		public static function isAlphaNumeric(x:int):Boolean
		{
			return isDigit(x) || isUpperCaseAlphabetic(x) || isLowerCaseAlphabetic(x);
		}
		 /**bs*/public static var BACKSPACE:uint    = 8;
		/**tab*/public static var TAB:uint          = 9;
	/**newline*/public static var NEWLINE:uint      = 10;
		/** CR*/public static var CR:uint 			= 13;
		/**' '*/public static var SPACE:uint        = 32; 
		/** ! */public static var EXCLAM:uint       = 33; 
		/** " */public static var QUOTEDBL:uint     = 34; 
		/** # */public static var NUMBERSIGN:uint   = 35; 
		/** $ */public static var DOLLAR:uint       = 36; 
		/** % */public static var PERCENT:uint      = 37; 
		/** & */public static var AMPERSAND:uint    = 38; 
		/** ' */public static var QUOTESINGLE:uint  = 39; 
		/** ( */public static var PARENLEFT:uint    = 40; 
		/** ) */public static var PARENRIGHT:uint   = 41; 
	 /** &#42 */public static var ASTERISK:uint     = 42; 
		/** + */public static var PLUS:uint         = 43; 
		/** , */public static var COMMA:uint        = 44; 
		/** - */public static var HYPHEN:uint       = 45; 
		/** . */public static var PERIOD:uint       = 46; 
		/** / */public static var SLASH:uint        = 47; 
		
		/** 0 */public static var ZERO:uint         = 48; 
		/** 1 */public static var ONE:uint          = 49;
		/** 2 */public static var TWO:uint          = 50;
		/** 3 */public static var THREE:uint        = 51;
		/** 4 */public static var FOUR:uint         = 52;
		/** 5 */public static var FIVE:uint         = 53;
		/** 6 */public static var SIX:uint          = 54;
		/** 7 */public static var SEVEN:uint        = 55;
		/** 8 */public static var EIGHT:uint        = 56;
		/** 9 */public static var NINE:uint         = 57;
		
		/** : */public static var COLON:uint        = 58;
		/** ; */public static var SEMICOLON:uint    = 59;
		/** < */public static var LESS:uint         = 60;
		/** = */public static var EQUAL:uint        = 61;
		/** > */public static var GREATER:uint      = 62;
		/** ? */public static var QUESTION:uint     = 63;
		/** @ */public static var AT:uint           = 64;
		
		/** A */public static var A:uint            = 65;
		/** B */public static var B:uint            = 66;
		/** C */public static var C:uint            = 67;
		/** D */public static var D:uint            = 68;
		/** E */public static var E:uint            = 69;
		/** F */public static var F:uint            = 70;
		/** G */public static var G:uint            = 71;
		/** H */public static var H:uint            = 72;
		/** I */public static var I:uint            = 73;
		/** J */public static var J:uint            = 74;
		/** K */public static var K:uint            = 75;
		/** L */public static var L:uint            = 76;
		/** M */public static var M:uint            = 77;
		/** N */public static var N:uint            = 78;
		/** O */public static var O:uint            = 79;
		/** P */public static var P:uint            = 80;
		/** Q */public static var Q:uint            = 81;
		/** R */public static var R:uint            = 82;
		/** S */public static var S:uint            = 83;
		/** T */public static var T:uint            = 84;
		/** U */public static var U:uint            = 85;
		/** V */public static var V:uint            = 86;
		/** W */public static var W:uint            = 87;
		/** X */public static var X:uint            = 88;
		/** Y */public static var Y:uint            = 89;
		/** Z */public static var Z:uint            = 90;
		
		/** [ */public static var BRACKETLEFT:uint  = 91;
		/** \ */public static var BACKSLASH:uint    = 92;
		/** ] */public static var BRACKETRIGHT:uint = 93;
		/** ^ */public static var CIRCUM:uint       = 94;
		/** _ */public static var UNDERSCORE:uint   = 95;
		/** ` */public static var GRAVE:uint        = 96;
		
		/** a */public static var a:uint            = 97;
		/** b */public static var b:uint            = 98;
		/** c */public static var c:uint            = 99;
		/** d */public static var d:uint            = 100;
		/** e */public static var e:uint            = 101;
		/** f */public static var f:uint            = 102;
		/** g */public static var g:uint            = 103;
		/** h */public static var h:uint            = 104;
		/** i */public static var i:uint            = 105;
		/** j */public static var j:uint            = 106;
		/** k */public static var k:uint            = 107;
		/** l */public static var l:uint            = 108;
		/** m */public static var m:uint            = 109;
		/** n */public static var n:uint            = 110;
		/** o */public static var o:uint            = 111;
		/** p */public static var p:uint            = 112;
		/** q */public static var q:uint            = 113;
		/** r */public static var r:uint            = 114;
		/** s */public static var s:uint            = 115;
		/** t */public static var t:uint            = 116;
		/** u */public static var u:uint            = 117;
		/** v */public static var v:uint            = 118;
		/** w */public static var w:uint            = 119;
		/** x */public static var x:uint            = 120;
		/** y */public static var y:uint            = 121;
		/** z */public static var z:uint            = 122;
		
		/** { */public static var BRACELEFT:uint    = 123;
		/** | */public static var BAR:uint          = 124;
		/** } */public static var BRACERIGTH:uint   = 125;
		/** ~ */public static var TILDE:uint        = 126;
		/** ~ */public static var POINT:uint        = 192;
	}

}