// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomEngineUseProductEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineUseProductEvent extends RoomEngineObjectEvent 
    {

        public static const USE_PRODUCT_FROM_ROOM:String = "ROSM_USE_PRODUCT_FROM_ROOM";
        public static const USE_PRODUCT_FROM_INVENTORY:String = "ROSM_USE_PRODUCT_FROM_INVENTORY";

        private var _SafeStr_4677:int;
        private var _SafeStr_4678:int;

        public function RoomEngineUseProductEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int=-1, _arg_6:int=-1, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_7, _arg_8);
            _SafeStr_4677 = _arg_5;
            _SafeStr_4678 = _arg_6;
        }

        public function get inventoryStripId():int
        {
            return (_SafeStr_4677);
        }

        public function get furnitureTypeId():int
        {
            return (_SafeStr_4678);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4677 = "_-S18" (String#22058, DoABC#4)
// _SafeStr_4678 = "_-Tc" (String#18711, DoABC#4)


