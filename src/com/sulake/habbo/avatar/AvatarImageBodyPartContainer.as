// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.AvatarImageBodyPartContainer

package com.sulake.habbo.avatar
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class AvatarImageBodyPartContainer 
    {

        private var _SafeStr_4204:BitmapData;
        private var _regPoint:Point;
        private var _offset:Point = new Point(0, 0);
        private var _SafeStr_6007:Boolean;

        public function AvatarImageBodyPartContainer(_arg_1:BitmapData, _arg_2:Point, _arg_3:Boolean)
        {
            _SafeStr_4204 = _arg_1;
            _regPoint = _arg_2;
            _SafeStr_6007 = _arg_3;
            cleanPoints();
        }

        public function get isCacheable():Boolean
        {
            return (_SafeStr_6007);
        }

        public function dispose():void
        {
            if (_SafeStr_4204)
            {
                _SafeStr_4204.dispose();
            };
            _SafeStr_4204 = null;
            _regPoint = null;
            _offset = null;
        }

        public function set image(_arg_1:BitmapData):void
        {
            if (((_SafeStr_4204) && (!(_SafeStr_4204 == _arg_1))))
            {
                _SafeStr_4204.dispose();
            };
            _SafeStr_4204 = _arg_1;
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function setRegPoint(_arg_1:Point):void
        {
            _regPoint = _arg_1;
            cleanPoints();
        }

        public function get regPoint():Point
        {
            return (_regPoint.add(_offset));
        }

        public function set offset(_arg_1:Point):void
        {
            _offset = _arg_1;
            cleanPoints();
        }

        private function cleanPoints():void
        {
            _regPoint.x = _regPoint.x;
            _regPoint.y = _regPoint.y;
            _offset.x = _offset.x;
            _offset.y = _offset.y;
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_6007 = "_-U18" (String#15787, DoABC#4)


