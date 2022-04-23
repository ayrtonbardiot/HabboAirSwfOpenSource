// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurnitureQueueTileVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization 
    {

        private static const _SafeStr_8749:int = 3;
        private static const _SafeStr_8752:int = 2;
        private static const ANIMATION_ID_NORMAL:int = 1;
        private static const _SafeStr_8753:int = 15;

        private var _SafeStr_4701:Array = [];
        private var _SafeStr_5105:int;


        override protected function setAnimation(_arg_1:int):void
        {
            if (_arg_1 == 2)
            {
                _SafeStr_4701 = [];
                _SafeStr_4701.push(1);
                _SafeStr_5105 = 15;
            };
            super.setAnimation(_arg_1);
        }

        override protected function updateAnimation(_arg_1:Number):int
        {
            if (_SafeStr_5105 > 0)
            {
                _SafeStr_5105--;
            };
            if (_SafeStr_5105 == 0)
            {
                if (_SafeStr_4701.length > 0)
                {
                    super.setAnimation(_SafeStr_4701.shift());
                };
            };
            return (super.updateAnimation(_arg_1));
        }

        override protected function usesAnimationResetting():Boolean
        {
            return (true);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_4701 = "_-y14" (String#1802, DoABC#4)
// _SafeStr_5105 = "_-ux" (String#9389, DoABC#4)
// _SafeStr_8749 = "_-AD" (String#22702, DoABC#4)
// _SafeStr_8752 = "_-w1x" (String#32857, DoABC#4)
// _SafeStr_8753 = "_-Z17" (String#35627, DoABC#4)


