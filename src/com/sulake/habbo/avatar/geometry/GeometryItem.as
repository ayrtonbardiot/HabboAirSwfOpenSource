// by nota

//com.sulake.habbo.avatar.geometry.GeometryItem

package com.sulake.habbo.avatar.geometry
{
    public class GeometryItem extends Node3D 
    {

        private var _SafeStr_3820:String;
        private var _radius:Number;
        private var _normal:Vector3D;
        private var _isDoubleSided:Boolean = false;
        private var _SafeStr_6512:Boolean = false;

        public function GeometryItem(_arg_1:XML, _arg_2:Boolean=false)
        {
            super(parseFloat(_arg_1.@x), parseFloat(_arg_1.@y), parseFloat(_arg_1.@z));
            _SafeStr_3820 = String(_arg_1.@id);
            _radius = parseFloat(_arg_1.@radius);
            _normal = new Vector3D(parseFloat(_arg_1.@nx), parseFloat(_arg_1.@ny), parseFloat(_arg_1.@nz));
            _isDoubleSided = (parseInt(_arg_1.@double) as Boolean);
            _SafeStr_6512 = _arg_2;
        }

        public function getDistance(_arg_1:Vector3D):Number
        {
            var _local_3:Number = Math.abs(((_arg_1.z - this.transformedLocation.z) - _radius));
            var _local_2:Number = Math.abs(((_arg_1.z - this.transformedLocation.z) + _radius));
            return (Math.min(_local_3, _local_2));
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get normal():Vector3D
        {
            return (_normal);
        }

        public function get isDoubleSided():Boolean
        {
            return (_isDoubleSided);
        }

        public function toString():String
        {
            return ((((_SafeStr_3820 + ": ") + this.location) + " - ") + this.transformedLocation);
        }

        public function get isDynamic():Boolean
        {
            return (_SafeStr_6512);
        }


    }
}//package com.sulake.habbo.avatar.geometry

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_6512 = "_-V1m" (String#21731, DoABC#4)


