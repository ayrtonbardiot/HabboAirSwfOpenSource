﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.utils.FriendlyTime

package com.sulake.habbo.utils
{
    import com.sulake.habbo.localization._SafeStr_18;

    public class FriendlyTime 
    {

        private static const _SafeStr_9138:uint = 60;
        private static const _SafeStr_9139:uint = 3600;
        private static const _SafeStr_9140:uint = 86400;
        private static const _SafeStr_9141:uint = 604800;
        private static const MONTH_IN_SECONDS:uint = 0x278D00;
        private static const YEAR_IN_SECONDS:uint = 31536000;


        public static function getFriendlyTime(_arg_1:_SafeStr_18, _arg_2:Number, _arg_3:String="", _arg_4:int=3):String
        {
            if (_arg_2 > (_arg_4 * 31536000))
            {
                return (getLocalization(_arg_1, ("friendlytime.years" + _arg_3), Math.round((_arg_2 / 31536000))));
            };
            if (_arg_2 > (_arg_4 * 0x278D00))
            {
                return (getLocalization(_arg_1, ("friendlytime.months" + _arg_3), Math.round((_arg_2 / 0x278D00))));
            };
            if (_arg_2 > (_arg_4 * 86400))
            {
                return (getLocalization(_arg_1, ("friendlytime.days" + _arg_3), Math.round((_arg_2 / 86400))));
            };
            if (_arg_2 > (_arg_4 * 3600))
            {
                return (getLocalization(_arg_1, ("friendlytime.hours" + _arg_3), Math.round((_arg_2 / 3600))));
            };
            if (_arg_2 > (_arg_4 * 60))
            {
                return (getLocalization(_arg_1, ("friendlytime.minutes" + _arg_3), Math.round((_arg_2 / 60))));
            };
            return (getLocalization(_arg_1, ("friendlytime.seconds" + _arg_3), Math.round(_arg_2)));
        }

        public static function getShortFriendlyTime(_arg_1:_SafeStr_18, _arg_2:Number, _arg_3:String="", _arg_4:int=3):String
        {
            if (_arg_2 > (_arg_4 * 31536000))
            {
                return (getLocalization(_arg_1, ("friendlytime.years.short" + _arg_3), Math.round((_arg_2 / 31536000))));
            };
            if (_arg_2 > (_arg_4 * 0x278D00))
            {
                return (getLocalization(_arg_1, ("friendlytime.months.short" + _arg_3), Math.round((_arg_2 / 0x278D00))));
            };
            if (_arg_2 > (_arg_4 * 86400))
            {
                return (getLocalization(_arg_1, ("friendlytime.days.short" + _arg_3), Math.round((_arg_2 / 86400))));
            };
            if (_arg_2 > (_arg_4 * 3600))
            {
                return (getLocalization(_arg_1, ("friendlytime.hours.short" + _arg_3), Math.round((_arg_2 / 3600))));
            };
            if (_arg_2 > (_arg_4 * 60))
            {
                return (getLocalization(_arg_1, ("friendlytime.minutes.short" + _arg_3), Math.round((_arg_2 / 60))));
            };
            return (getLocalization(_arg_1, ("friendlytime.seconds.short" + _arg_3), Math.round(_arg_2)));
        }

        public static function getLocalization(_arg_1:_SafeStr_18, _arg_2:String, _arg_3:int):String
        {
            return (_arg_1.getLocalizationWithParams(_arg_2, _arg_2, "amount", _arg_3.toString()));
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_9138 = "_-W1X" (String#36655, DoABC#4)
// _SafeStr_9139 = "_-LG" (String#39784, DoABC#4)
// _SafeStr_9140 = "_-B1V" (String#32089, DoABC#4)
// _SafeStr_9141 = "_-ES" (String#39681, DoABC#4)


