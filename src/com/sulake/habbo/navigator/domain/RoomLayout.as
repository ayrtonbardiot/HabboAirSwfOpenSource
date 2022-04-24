// by nota

//com.sulake.habbo.navigator.domain.RoomLayout

package com.sulake.habbo.navigator.domain
{
    import com.sulake.core.window._SafeStr_3133;

    public class RoomLayout 
    {

        private var _SafeStr_3623:int;
        private var _SafeStr_5860:int;
        private var _name:String;
        private var _SafeStr_3882:_SafeStr_3133;

        public function RoomLayout(_arg_1:int, _arg_2:int, _arg_3:String)
        {
            _SafeStr_3623 = _arg_1;
            _SafeStr_5860 = _arg_2;
            _name = _arg_3;
        }

        public function get requiredClubLevel():int
        {
            return (_SafeStr_3623);
        }

        public function get tileSize():int
        {
            return (_SafeStr_5860);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get view():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function set view(_arg_1:_SafeStr_3133):void
        {
            _SafeStr_3882 = _arg_1;
        }


    }
}//package com.sulake.habbo.navigator.domain

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3623 = "_-OF" (String#2491, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_5860 = "_-Vr" (String#10066, DoABC#4)


