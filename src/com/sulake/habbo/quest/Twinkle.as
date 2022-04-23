// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.Twinkle

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Point;
    import flash.display.BitmapData;

    public class Twinkle implements AnimationObject, _SafeStr_13 
    {

        private static const FRAME_DURATION_IN_MSECS:int = 100;
        private static const FRAME_SEQUENCE:Array = [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1];
        private static const FRAME_NOT_STARTED:int = -1;
        private static const FRAME_FINISHED:int = -2;
        private static const _SafeStr_4708:Point = new Point(44, 44);

        private var _SafeStr_3953:TwinkleImages;
        private var _SafeStr_4709:int;
        private var _position:Point;

        public function Twinkle(_arg_1:TwinkleImages, _arg_2:int)
        {
            _SafeStr_3953 = _arg_1;
            _SafeStr_4709 = _arg_2;
        }

        public function dispose():void
        {
            _SafeStr_3953 = null;
            _position = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_3953 == null);
        }

        public function onAnimationStart():void
        {
            _position = new Point(Math.round((Math.random() * _SafeStr_4708.x)), Math.round((Math.random() * _SafeStr_4708.y)));
        }

        public function getPosition(_arg_1:int):Point
        {
            return (_position);
        }

        public function isFinished(_arg_1:int):Boolean
        {
            return (getFrame(_arg_1) == -2);
        }

        public function getBitmap(_arg_1:int):BitmapData
        {
            var _local_3:int = getFrame(_arg_1);
            return (_SafeStr_3953.getImage(FRAME_SEQUENCE[_local_3]));
        }

        private function getFrame(_arg_1:int):int
        {
            var _local_2:int = (_arg_1 - _SafeStr_4709);
            if (_local_2 < 0)
            {
                return (-1);
            };
            var _local_3:int = int(Math.floor((_local_2 / 100)));
            if (_local_3 >= FRAME_SEQUENCE.length)
            {
                return (-2);
            };
            return (_local_3);
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3953 = "_-o1s" (String#4824, DoABC#4)
// _SafeStr_4708 = "_-N1m" (String#15432, DoABC#4)
// _SafeStr_4709 = "_-o5" (String#17937, DoABC#4)


