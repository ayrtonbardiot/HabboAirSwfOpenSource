// by nota

//com.sulake.habbo.room.object.RoomObjectUserTypes

package com.sulake.habbo.room.object
{
    import flash.utils.Dictionary;

    public class RoomObjectUserTypes 
    {

        public static const USER:String = "user";
        public static const PET:String = "pet";
        public static const BOT:String = "bot";
        public static const RENTABLE_BOT:String = "rentable_bot";
        public static const MONSTERPLANT:String = "monsterplant";
        private static const _SafeStr_4875:Dictionary = new Dictionary();

        {
            _SafeStr_4875["user"] = 1;
            _SafeStr_4875["pet"] = 2;
            _SafeStr_4875["bot"] = 3;
            _SafeStr_4875["rentable_bot"] = 4;
        }


        public static function getTypeId(_arg_1:String):int
        {
            return (_SafeStr_4875[_arg_1]);
        }

        public static function getName(_arg_1:int):String
        {
            for (var _local_2:String in _SafeStr_4875)
            {
                if (_SafeStr_4875[_local_2] == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public static function getVisualizationType(_arg_1:String):String
        {
            switch (_arg_1)
            {
                case "bot":
                case "rentable_bot":
                    return ("user");
                default:
                    return (_arg_1);
            };
        }


    }
}//package com.sulake.habbo.room.object

// _SafeStr_4875 = "_-jX" (String#7304, DoABC#4)


