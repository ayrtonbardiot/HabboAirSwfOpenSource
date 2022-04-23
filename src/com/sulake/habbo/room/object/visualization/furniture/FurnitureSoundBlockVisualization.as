// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurnitureSoundBlockVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureSoundBlockVisualization extends AnimatedFurnitureVisualization 
    {

        private var _SafeStr_4191:int = 1;
        private var _SafeStr_4269:Number = 0;


        override protected function get frameIncrease():int
        {
            return (_SafeStr_4191);
        }

        override protected function updateAnimations(_arg_1:Number):int
        {
            _SafeStr_4269 = (_SafeStr_4269 + object.getModel().getNumber("furniture_soundblock_relative_animation_speed"));
            _SafeStr_4191 = _SafeStr_4269;
            _SafeStr_4269 = (_SafeStr_4269 - _SafeStr_4191);
            return (super.updateAnimations(_arg_1));
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_4191 = "_-R1F" (String#10473, DoABC#4)
// _SafeStr_4269 = "_-A1u" (String#9959, DoABC#4)


