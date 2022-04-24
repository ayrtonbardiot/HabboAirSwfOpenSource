// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetOpenInventoryMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9060:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
        public static const INVENTORY_EFFECTS:String = "inventory_effects";
        public static const INVENTORY_BADGES:String = "inventory_badges";
        public static const INVENTORY_CLOTHES:String = "inventory_clothes";
        public static const INVENTORY_FURNITURE:String = "inventory_furniture";

        private var _SafeStr_6783:String;

        public function RoomWidgetOpenInventoryMessage(_arg_1:String)
        {
            super("RWGOI_MESSAGE_OPEN_INVENTORY");
            _SafeStr_6783 = _arg_1;
        }

        public function get inventoryType():String
        {
            return (_SafeStr_6783);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_6783 = "_-o1z" (String#21037, DoABC#4)
// _SafeStr_9060 = "_-P1u" (String#41290, DoABC#4)


