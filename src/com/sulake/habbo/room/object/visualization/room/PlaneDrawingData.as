// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.PlaneDrawingData

package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization._SafeStr_1318;
    import __AS3__.vec.Vector;
    import flash.geom.Point;

    public class PlaneDrawingData implements _SafeStr_1318 
    {

        private var _SafeStr_4052:Number;
        private var _SafeStr_5591:Vector.<Point>;
        private var _color:uint;
        private var _SafeStr_5587:Array;
        private var _SafeStr_5588:Array;
        private var _SafeStr_5589:Array;
        private var _SafeStr_5590:Array;
        private var _SafeStr_5592:Boolean = false;
        private var _SafeStr_4179:Array = [];

        public function PlaneDrawingData(_arg_1:PlaneDrawingData=null, _arg_2:uint=0, _arg_3:Boolean=false)
        {
            _SafeStr_5587 = [];
            _SafeStr_5588 = [];
            _SafeStr_5589 = [];
            _SafeStr_5590 = [];
            if (_arg_1 != null)
            {
                _SafeStr_5587 = _arg_1._SafeStr_5587;
                _SafeStr_5588 = _arg_1._SafeStr_5588;
                _SafeStr_5589 = _arg_1._SafeStr_5589;
                _SafeStr_5590 = _arg_1._SafeStr_5590;
            };
            _color = _arg_2;
            _SafeStr_5592 = _arg_3;
        }

        public function addMask(_arg_1:String, _arg_2:Point, _arg_3:Boolean, _arg_4:Boolean):void
        {
            _SafeStr_5587.push(_arg_1);
            _SafeStr_5588.push(_arg_2);
            _SafeStr_5589.push(_arg_3);
            _SafeStr_5590.push(_arg_4);
        }

        public function addAssetColumn(_arg_1:Array):void
        {
            _SafeStr_4179.push(_arg_1);
        }

        public function set z(_arg_1:Number):void
        {
            _SafeStr_4052 = _arg_1;
        }

        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function set cornerPoints(_arg_1:Vector.<Point>):void
        {
            _SafeStr_5591 = _arg_1;
        }

        public function get cornerPoints():Vector.<Point>
        {
            return (_SafeStr_5591);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get maskAssetNames():Array
        {
            return (_SafeStr_5587);
        }

        public function get maskAssetLocations():Array
        {
            return (_SafeStr_5588);
        }

        public function get maskAssetFlipHs():Array
        {
            return (_SafeStr_5589);
        }

        public function get maskAssetFlipVs():Array
        {
            return (_SafeStr_5590);
        }

        public function isBottomAligned():Boolean
        {
            return (_SafeStr_5592);
        }

        public function get assetNameColumns():Array
        {
            return (_SafeStr_4179);
        }


    }
}//package com.sulake.habbo.room.object.visualization.room

// _SafeStr_1318 = "_-31X" (String#19685, DoABC#4)
// _SafeStr_4052 = "_-Rt" (String#1279, DoABC#4)
// _SafeStr_4179 = "_-Z1J" (String#3682, DoABC#4)
// _SafeStr_5587 = "_-VB" (String#10056, DoABC#4)
// _SafeStr_5588 = "_-71t" (String#9895, DoABC#4)
// _SafeStr_5589 = "_-41V" (String#9195, DoABC#4)
// _SafeStr_5590 = "_-02F" (String#10229, DoABC#4)
// _SafeStr_5591 = "_-r1R" (String#21278, DoABC#4)
// _SafeStr_5592 = "_-Fo" (String#22499, DoABC#4)


