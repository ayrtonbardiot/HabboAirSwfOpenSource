// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.cache.ImageData

package com.sulake.habbo.avatar.cache
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.geom.ColorTransform;

    public class ImageData 
    {

        private var _bitmap:BitmapData;
        private var _SafeStr_6389:Rectangle;
        private var _regPoint:Point;
        private var _flipH:Boolean;
        private var _SafeStr_5882:ColorTransform;

        public function ImageData(_arg_1:BitmapData, _arg_2:Rectangle, _arg_3:Point, _arg_4:Boolean, _arg_5:ColorTransform)
        {
            _bitmap = _arg_1;
            _SafeStr_6389 = _arg_2;
            _regPoint = _arg_3;
            _flipH = _arg_4;
            _SafeStr_5882 = _arg_5;
            if (_arg_4)
            {
                _regPoint.x = (-(_regPoint.x) + _arg_2.width);
            };
        }

        public function dispose():void
        {
            _bitmap = null;
            _regPoint = null;
            _SafeStr_5882 = null;
        }

        public function get bitmap():BitmapData
        {
            return (_bitmap);
        }

        public function get rect():Rectangle
        {
            return (_SafeStr_6389);
        }

        public function get regPoint():Point
        {
            return (_regPoint);
        }

        public function get flipH():Boolean
        {
            return (_flipH);
        }

        public function get colorTransform():ColorTransform
        {
            return (_SafeStr_5882);
        }

        public function get offsetRect():Rectangle
        {
            var _local_1:Rectangle = new Rectangle(0, 0, _SafeStr_6389.width, _SafeStr_6389.height);
            _local_1.offset(-(_regPoint.x), -(_regPoint.y));
            return (_local_1);
        }


    }
}//package com.sulake.habbo.avatar.cache

// _SafeStr_5882 = "_-s5" (String#1584, DoABC#4)
// _SafeStr_6389 = "_-C1U" (String#2446, DoABC#4)


