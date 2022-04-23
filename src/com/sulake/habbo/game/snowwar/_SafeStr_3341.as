// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar._SafeStr_3341

package com.sulake.habbo.game.snowwar
{
    public class _SafeStr_3341 
    {

        public static const _SafeStr_8602:int = 0;
        public static const THROW_FAST_BALL:int = 1;
        public static const THROW_LONG_LOB_BALL:int = 2;
        public static const THROW_SHORT_LOB_BALL:int = 3;
        public static const THROW_DEFAULT:int = 4;


        public static function getClickTypeOnTile(_arg_1:Boolean, _arg_2:Boolean):int
        {
            if (_arg_1)
            {
                if (_arg_2)
                {
                    return (3);
                };
                return (2);
            };
            if (_arg_2)
            {
                return (1);
            };
            return (0);
        }

        public static function getClickTypeOnOpponent(_arg_1:Boolean, _arg_2:Boolean):int
        {
            if (_arg_1)
            {
                if (_arg_2)
                {
                    return (3);
                };
                return (2);
            };
            if (_arg_2)
            {
                return (1);
            };
            return (4);
        }


    }
}//package com.sulake.habbo.game.snowwar

// _SafeStr_3341 = "_-T1j" (String#13902, DoABC#4)
// _SafeStr_8602 = "_-Xk" (String#32055, DoABC#4)


