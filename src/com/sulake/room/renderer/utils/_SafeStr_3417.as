// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.utils._SafeStr_3417

package com.sulake.room.renderer.utils
{
    import com.sulake.room.object.visualization.ISortableSprite;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    [SecureSWF(rename="true")]
    public class _SafeStr_3417 implements ISortableSprite 
    {

        public static const _SafeStr_9190:Number = 100000000;

        private var _SafeStr_4050:int = 0;
        private var _SafeStr_4051:int = 0;
        private var _SafeStr_4052:Number = 0;
        public var name:String = "";
        private var _SafeStr_6653:IRoomObjectSprite = null;


        public function dispose():void
        {
            _SafeStr_6653 = null;
            _SafeStr_4052 = -(100000000);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function set x(_arg_1:int):void
        {
            _SafeStr_4050 = _arg_1;
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function set y(_arg_1:int):void
        {
            _SafeStr_4051 = _arg_1;
        }

        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function set z(_arg_1:Number):void
        {
            _SafeStr_4052 = _arg_1;
        }

        public function get sprite():IRoomObjectSprite
        {
            return (_SafeStr_6653);
        }

        public function set sprite(_arg_1:IRoomObjectSprite):void
        {
            _SafeStr_6653 = _arg_1;
        }


    }
}//package com.sulake.room.renderer.utils

// _SafeStr_3417 = "_-on" (String#3696, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4052 = "_-Rt" (String#1279, DoABC#4)
// _SafeStr_6653 = "_-t7" (String#4221, DoABC#4)
// _SafeStr_9190 = "_-9b" (String#38737, DoABC#4)


