// by nota

//com.sulake.habbo.moderation.ModActionDefinition

package com.sulake.habbo.moderation
{
    public class ModActionDefinition 
    {

        public static const ALERT:int = 1;
        public static const MUTE:int = 2;
        public static const BAN:int = 3;
        public static const KICK:int = 4;
        public static const TRADING_LOCK:int = 5;
        public static const MESSAGE:int = 6;

        private var _SafeStr_6702:int;
        private var _name:String;
        private var _SafeStr_5584:int;
        private var _SafeStr_6703:int;
        private var _actionLengthHours:int;

        public function ModActionDefinition(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            _SafeStr_6702 = _arg_1;
            _name = _arg_2;
            _SafeStr_5584 = _arg_3;
            _SafeStr_6703 = _arg_4;
            _actionLengthHours = _arg_5;
        }

        public function get actionId():int
        {
            return (_SafeStr_6702);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get actionType():int
        {
            return (_SafeStr_5584);
        }

        public function get sanctionTypeId():int
        {
            return (_SafeStr_6703);
        }

        public function get actionLengthHours():int
        {
            return (_actionLengthHours);
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_5584 = "_-zg" (String#6975, DoABC#4)
// _SafeStr_6702 = "_-4M" (String#22204, DoABC#4)
// _SafeStr_6703 = "_-8I" (String#22149, DoABC#4)


