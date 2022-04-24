// by nota

//com.sulake.habbo.inventory.events.HabboUnseenItemsUpdatedEvent

package com.sulake.habbo.inventory.events
{
    import flash.events.Event;
    import flash.utils.Dictionary;

    public class HabboUnseenItemsUpdatedEvent extends Event 
    {

        public static const _SafeStr_8633:String = "HUIUE_UNSEEN_ITEMS_CHANGED";

        private var _SafeStr_5224:int;
        private var _SafeStr_5223:Dictionary;

        public function HabboUnseenItemsUpdatedEvent(_arg_1:Boolean=false, _arg_2:Boolean=false)
        {
            super("HUIUE_UNSEEN_ITEMS_CHANGED");
            _SafeStr_5223 = new Dictionary();
        }

        public function setCategoryCount(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_5223[_arg_1.toString()] = _arg_2;
        }

        public function getCategoryCount(_arg_1:int):int
        {
            return (_SafeStr_5223[_arg_1.toString()]);
        }

        public function set inventoryCount(_arg_1:int):void
        {
            _SafeStr_5224 = _arg_1;
        }

        public function get inventoryCount():int
        {
            return (_SafeStr_5224);
        }


    }
}//package com.sulake.habbo.inventory.events

// _SafeStr_5223 = "_-fo" (String#13973, DoABC#4)
// _SafeStr_5224 = "_-B1v" (String#18161, DoABC#4)
// _SafeStr_8633 = "_-ik" (String#32414, DoABC#4)


