// by nota

//com.sulake.habbo.inventory.events.HabboInventoryFurniListParsedEvent

package com.sulake.habbo.inventory.events
{
    import flash.events.Event;

    public class HabboInventoryFurniListParsedEvent extends Event 
    {

        public static const _SafeStr_8631:String = "HFLPE_FURNI_LIST_PARSED";

        private var _SafeStr_4158:String;

        public function HabboInventoryFurniListParsedEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("HFLPE_FURNI_LIST_PARSED");
            _SafeStr_4158 = _arg_1;
        }

        public function get category():String
        {
            return (_SafeStr_4158);
        }


    }
}//package com.sulake.habbo.inventory.events

// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_8631 = "_-U1S" (String#36136, DoABC#4)


