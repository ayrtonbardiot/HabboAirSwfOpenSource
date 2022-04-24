// by nota

//com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent

package com.sulake.habbo.inventory.events
{
    import flash.events.Event;

    public class HabboInventoryItemAddedEvent extends Event 
    {

        public static const HABBO_INVENTORY_ITEM_ADDED:String = "HABBO_INVENTORY_ITEM_ADDED";

        private var _SafeStr_4862:int;
        private var _SafeStr_4863:int;
        private var _SafeStr_4158:int;

        public function HabboInventoryItemAddedEvent(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("HABBO_INVENTORY_ITEM_ADDED", _arg_4, _arg_5);
            _SafeStr_4862 = _arg_1;
            _SafeStr_4863 = _arg_2;
            _SafeStr_4158 = _arg_3;
        }

        public function get classId():int
        {
            return (_SafeStr_4862);
        }

        public function get stripId():int
        {
            return (_SafeStr_4863);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }


    }
}//package com.sulake.habbo.inventory.events

// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4862 = "_-Q1H" (String#2645, DoABC#4)
// _SafeStr_4863 = "_-A1K" (String#9940, DoABC#4)


