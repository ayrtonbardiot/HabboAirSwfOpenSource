// by nota

//com.sulake.habbo.room.object.data.HighScoreData

package com.sulake.habbo.room.object.data
{
    public class HighScoreData 
    {

        private var _SafeStr_5367:int;
        private var _users:Array = [];

        public function HighScoreData()
        {
            _SafeStr_5367 = -1;
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }

        public function set score(_arg_1:int):void
        {
            _SafeStr_5367 = _arg_1;
        }

        public function get users():Array
        {
            return (_users);
        }

        public function set users(_arg_1:Array):void
        {
            _users = _arg_1;
        }

        public function addUser(_arg_1:String):void
        {
            _users.push(_arg_1);
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)


