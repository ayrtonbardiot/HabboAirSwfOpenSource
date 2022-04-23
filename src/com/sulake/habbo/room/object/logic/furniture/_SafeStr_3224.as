// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3224

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.object.IRoomObjectModelController;

    public class _SafeStr_3224 extends _SafeStr_3108 
    {


        override public function get widget():String
        {
            return ("RWE_CRAFTING");
        }

        override public function useObject():void
        {
            super.useObject();
        }

        public function setAnimationState(_arg_1:int):void
        {
            if (object == null)
            {
                return;
            };
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (_local_2 != null)
            {
                _local_2.setNumber("furniture_automatic_state_index", _arg_1, false);
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)
// _SafeStr_3224 = "_-lw" (String#18201, DoABC#4)


