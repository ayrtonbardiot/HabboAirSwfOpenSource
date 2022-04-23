// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurnitureHabboWheelVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization 
    {

        private static const ANIMATION_ID_OFFSET_SLOW1:int = 10;
        private static const ANIMATION_ID_OFFSET_SLOW2:int = 20;
        private static const _SafeStr_8750:int = 31;
        private static const _SafeStr_8749:int = 32;

        private var _SafeStr_4701:Array = [];
        private var _SafeStr_4016:Boolean = false;


        override protected function setAnimation(_arg_1:int):void
        {
            if (_arg_1 == -1)
            {
                if (!_SafeStr_4016)
                {
                    _SafeStr_4016 = true;
                    _SafeStr_4701 = [];
                    _SafeStr_4701.push(31);
                    _SafeStr_4701.push(32);
                    return;
                };
            };
            if (((_arg_1 > 0) && (_arg_1 <= 10)))
            {
                if (_SafeStr_4016)
                {
                    _SafeStr_4016 = false;
                    _SafeStr_4701 = [];
                    _SafeStr_4701.push((10 + _arg_1));
                    _SafeStr_4701.push((20 + _arg_1));
                    _SafeStr_4701.push(_arg_1);
                    return;
                };
                super.setAnimation(_arg_1);
            };
        }

        override protected function updateAnimation(_arg_1:Number):int
        {
            if ((((super.getLastFramePlayed(1)) && (super.getLastFramePlayed(2))) && (super.getLastFramePlayed(3))))
            {
                if (_SafeStr_4701.length > 0)
                {
                    super.setAnimation(_SafeStr_4701.shift());
                };
            };
            return (super.updateAnimation(_arg_1));
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_4016 = "_-z1x" (String#1885, DoABC#4)
// _SafeStr_4701 = "_-y14" (String#1802, DoABC#4)
// _SafeStr_8749 = "_-AD" (String#22702, DoABC#4)
// _SafeStr_8750 = "_-K1f" (String#29773, DoABC#4)


