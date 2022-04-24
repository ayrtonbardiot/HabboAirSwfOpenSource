// by nota

//com.sulake.habbo.window.enum._SafeStr_3472

package com.sulake.habbo.window.enum
{
    public class _SafeStr_3472 
    {

        public static const _SafeStr_9146:String = "up, left";
        public static const UP_CENTER:String = "up, center";
        public static const UP_RIGHT:String = "up, right";
        public static const DOWN_LEFT:String = "down, left";
        public static const DOWN_CENTER:String = "down, center";
        public static const DOWN_RIGHT:String = "down, right";
        public static const _SafeStr_9147:String = "left, top";
        public static const _SafeStr_9148:String = "left, middle";
        public static const LEFT_BOTTOM:String = "left, bottom";
        public static const _SafeStr_9149:String = "right, top";
        public static const _SafeStr_9150:String = "right, middle";
        public static const RIGHT_BOTTOM:String = "right, bottom";
        public static const ALL:Array = ["up, left", "up, center", "up, right", "down, left", "down, center", "down, right", "left, top", "left, middle", "left, bottom", "right, top", "right, middle", "right, bottom"];
        public static const _SafeStr_8169:String = "up";
        public static const DOWN:String = "down";
        public static const _SafeStr_8170:String = "left";
        public static const RIGHT:String = "right";
        public static const _SafeStr_9151:String = "minimum";
        public static const _SafeStr_9152:String = "middle";
        public static const MAXIMUM:String = "maximum";


        public static function directionFromPivot(_arg_1:String):String
        {
            return (_arg_1.substr(0, _arg_1.indexOf(",")));
        }

        public static function positionFromPivot(_arg_1:String):String
        {
            switch (_arg_1)
            {
                case "up, left":
                case "down, left":
                case "left, top":
                case "right, top":
                    return ("minimum");
                case "up, right":
                case "down, right":
                case "left, bottom":
                case "right, bottom":
                    return ("maximum");
                default:
                    return ("middle");
            };
        }


    }
}//package com.sulake.habbo.window.enum

// _SafeStr_3472 = "_-9g" (String#10332, DoABC#4)
// _SafeStr_8169 = "_-Ym" (String#19322, DoABC#4)
// _SafeStr_8170 = "_-z1C" (String#12053, DoABC#4)
// _SafeStr_9146 = "_-pC" (String#32191, DoABC#4)
// _SafeStr_9147 = "_-K1t" (String#39744, DoABC#4)
// _SafeStr_9148 = "_-O1z" (String#40960, DoABC#4)
// _SafeStr_9149 = "_-J1I" (String#38793, DoABC#4)
// _SafeStr_9150 = "_-31R" (String#33117, DoABC#4)
// _SafeStr_9151 = "_-T15" (String#40025, DoABC#4)
// _SafeStr_9152 = "_-Mw" (String#39344, DoABC#4)


