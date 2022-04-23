// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.HabboClubLevelEnum

package com.sulake.habbo.session
{
    public class HabboClubLevelEnum 
    {

        public static const _SafeStr_8925:int = 0;
        public static const CLUB:int = 1;
        public static const VIP:int = 2;


        public static function HasClub(_arg_1:int):Boolean
        {
            return (_arg_1 >= 1);
        }

        public static function HasVip(_arg_1:int):Boolean
        {
            return (_arg_1 >= 1);
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_8925 = "_-421" (String#34870, DoABC#4)


