// by nota

//com.sulake.habbo.catalog.purse.PurseEvent

package com.sulake.habbo.catalog.purse
{
    import flash.events.Event;

    public class PurseEvent extends Event 
    {

        public static const CREDIT_BALANCE:String = "catalog_purse_credit_balance";
        public static const ACTIVITY_POINT_BALANCE:String = "catalog_purse_activity_point_balance";

        private var _SafeStr_4712:int;
        private var _SafeStr_4261:int;

        public function PurseEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(_arg_1, _arg_4, _arg_5);
            _SafeStr_4712 = _arg_2;
            _SafeStr_4261 = _arg_3;
        }

        public function get balance():int
        {
            return (_SafeStr_4712);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }


    }
}//package com.sulake.habbo.catalog.purse

// _SafeStr_4261 = "_-m1a" (String#4020, DoABC#4)
// _SafeStr_4712 = "_-O1J" (String#5664, DoABC#4)


