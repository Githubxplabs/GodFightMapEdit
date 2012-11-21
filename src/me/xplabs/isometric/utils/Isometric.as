package me.xplabs.isometric.utils 
{
	import me.xplabs.isometric.gemo.Point3D;
	import flash.geom.Point;
	/**
	 * ...
	 * @author xiaohan
	 */
	public class Isometric 
	{
		private  var _sinTheta:Number;
		private  var _cosTheta:Number;
		private  var _sinAlpha:Number;
		private  var _cosAlpha:Number;
		private static var _instance:Isometric;
		public function Isometric() 
		{
			var theta:Number = 30;
			var alpha:Number = 45;
			theta *= Math.PI/180;
			alpha *= Math.PI/180;
			_sinTheta = Math.sin(theta);
			_cosTheta = Math.cos(theta);
			_sinAlpha = Math.sin(alpha);
			_cosAlpha = Math.cos(alpha);
		}
		public static function get instance():Isometric
		{
			return _instance ||= new Isometric();
		}
		/**
		 * 将2d坐标转化为3d坐标
		 * @param	pt2d 2d坐标
		 * @param	pt3d 需要被转入的3d坐标，如果pt3d为null，则会创建一个新的Point3d
		 * @return 转化后的3d坐标
		 */
		public function ptTo3d(pt2d:Point,pt3d:Point3D = null):Point3D
		{
			if (!pt3d) pt3d = new Point3D();
			pt3d.z = (pt2d.x / _cosAlpha - pt2d.y / (_sinAlpha * _sinTheta)) * (1 / (_cosAlpha / _sinAlpha + _sinAlpha / _cosAlpha));
			pt3d.x = (1 / _cosAlpha) * (pt2d.x - pt3d.z * _sinAlpha);
			return pt3d;
		}
		/**
		 * 将3d坐标转化为2d坐标
		 * @param	pt3d 3d坐标
		 * @param	pt2d 需要被转入的2d坐标，如果pt2d为null，则会创建一个新的Point
		 * @return
		 */
		public function ptTo2d(pt3d:Point3D, pt2d:Point = null):Point
		{
			if (!pt2d) pt2d = new Point();
			var yp:Number = pt3d.y;
			var xp:Number = pt3d.x * _cosAlpha + pt3d.z * _sinAlpha;
			var zp:Number = pt3d.z * _cosAlpha - pt3d.x * _sinAlpha;
			pt2d.x = pt3d.x * _cosAlpha + pt3d.z * _sinAlpha;
			pt2d.y = pt3d.y * _cosTheta - (pt3d.z * _cosAlpha - pt3d.x * _sinAlpha) * _sinTheta;
			return pt2d;
		}
		/**
		 * 将坐标点转化为3d坐标
		 * @param	x 
		 * @param	y
		 * @return
		 */
		public function xyTo3d(x:Number,y:Number):Point3D
		{
			var pt3d:Point3D = new Point3D();
			pt3d.z = (x / _cosAlpha - y / (_sinAlpha * _sinTheta)) * (1 / (_cosAlpha / _sinAlpha + _sinAlpha / _cosAlpha));
			pt3d.x = (1 / _cosAlpha) * (x - pt3d.z * _sinAlpha);
			return pt3d;
		}
		/**
		 * 将坐标点转化为2d坐标点
		 * @param	x
		 * @param	y
		 * @param	z
		 * @return
		 */
		public function xyTo2d(x:Number, y:Number, z:Number):Point
		{
			var pt2d:Point = new Point();
			var yp:Number = y;
			var xp:Number = x * _cosAlpha + z * _sinAlpha;
			var zp:Number = z * _cosAlpha - x * _sinAlpha;
			pt2d.x = x * _cosAlpha + z * _sinAlpha;
			pt2d.y = y * _cosTheta - (z * _cosAlpha - x * _sinAlpha) * _sinTheta;
			return pt2d;
		}
	}
}