// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3192

package com.sulake.habbo.room.object.logic.furniture
{
    public class _SafeStr_3192 extends FurnitureMultiStateLogic 
    {


        override public function get widget():String
        {
            return ("RWE_CUSTOM_STACK_HEIGHT");
        }

        override public function initialize(_arg_1:XML):void
        {
            super.initialize(_arg_1);
            if (((!(object == null)) && (!(object.getModelController() == null))))
            {
                object.getModelController().setNumber("furniture_always_stackable", 1);
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3192 = "_-81I" (String#19790, DoABC#4)


