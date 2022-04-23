// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurniturePlanetSystemLogic

package com.sulake.habbo.room.object.logic.furniture
{
    public class FurniturePlanetSystemLogic extends _SafeStr_3108 
    {


        override public function initialize(_arg_1:XML):void
        {
            var _local_3:* = null;
            super.initialize(_arg_1);
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:XMLList = _arg_1.planetsystem;
            if (_local_2.length() == 0)
            {
                return;
            };
            if (object != null)
            {
                _local_3 = object.getModelController();
                if (_local_3 != null)
                {
                    _local_3.setString("furniture_planetsystem_data", _local_2);
                };
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)


