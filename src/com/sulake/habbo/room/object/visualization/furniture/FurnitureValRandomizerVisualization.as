// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurnitureValRandomizerVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization 
    {

        private static const ANIMATION_ID_OFFSET_SLOW1:int = 20;
        private static const ANIMATION_ID_OFFSET_SLOW2:int = 10;
        private static const _SafeStr_8750:int = 31;
        private static const _SafeStr_8749:int = 32;
        private static const _SafeStr_8756:int = 30;

        private var _SafeStr_4701:Array = [];
        private var _SafeStr_4016:Boolean = false;

        public function FurnitureValRandomizerVisualization()
        {
            super.setAnimation(30);
        }

        override protected function setAnimation(_arg_1:int):void
        {
            if (_arg_1 == 0)
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
                    if (direction == 2)
                    {
                        _SafeStr_4701.push(((20 + 5) - _arg_1));
                        _SafeStr_4701.push(((10 + 5) - _arg_1));
                    }
                    else
                    {
                        _SafeStr_4701.push((20 + _arg_1));
                        _SafeStr_4701.push((10 + _arg_1));
                    };
                    _SafeStr_4701.push(30);
                    return;
                };
                super.setAnimation(30);
            };
        }

        override protected function updateAnimation(_arg_1:Number):int
        {
            if (super.getLastFramePlayed(11))
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
// _SafeStr_8756 = "_-NL" (String#39333, DoABC#4)


