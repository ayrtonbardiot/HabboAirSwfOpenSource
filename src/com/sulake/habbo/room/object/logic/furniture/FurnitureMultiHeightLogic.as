// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurnitureMultiHeightLogic

package com.sulake.habbo.room.object.logic.furniture
{
    public class FurnitureMultiHeightLogic extends FurnitureMultiStateLogic 
    {


        override public function initialize(_arg_1:XML):void
        {
            super.initialize(_arg_1);
            object.getModelController().setNumber("furniture_is_variable_height", 1, true);
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

