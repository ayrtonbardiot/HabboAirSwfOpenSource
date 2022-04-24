// by nota

//com.sulake.habbo.room.utils._SafeStr_1662

package com.sulake.habbo.room.utils
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1662 
    {

        private var _SafeStr_3693:int;
        private var _SafeStr_3740:XML;
        private var _SafeStr_4777:String = null;
        private var _SafeStr_4778:String = null;
        private var _SafeStr_4779:String = null;

        public function _SafeStr_1662(_arg_1:int, _arg_2:XML)
        {
            _SafeStr_3693 = _arg_1;
            _SafeStr_3740 = _arg_2;
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get data():XML
        {
            return (_SafeStr_3740);
        }

        public function get floorType():String
        {
            return (_SafeStr_4777);
        }

        public function set floorType(_arg_1:String):void
        {
            _SafeStr_4777 = _arg_1;
        }

        public function get wallType():String
        {
            return (_SafeStr_4778);
        }

        public function set wallType(_arg_1:String):void
        {
            _SafeStr_4778 = _arg_1;
        }

        public function get landscapeType():String
        {
            return (_SafeStr_4779);
        }

        public function set landscapeType(_arg_1:String):void
        {
            _SafeStr_4779 = _arg_1;
        }


    }
}//package com.sulake.habbo.room.utils

// _SafeStr_1662 = "_-dD" (String#4860, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4777 = "_-S1M" (String#5362, DoABC#4)
// _SafeStr_4778 = "_-xi" (String#5315, DoABC#4)
// _SafeStr_4779 = "_-BB" (String#5266, DoABC#4)


