// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.events.GameChatEvent

package com.sulake.habbo.game.events
{
    import flash.events.Event;

    public class GameChatEvent extends Event 
    {

        public static const GAME_CHAT:String = "gce_game_chat";

        private var _SafeStr_4128:int;
        private var _SafeStr_4132:String;
        private var _SafeStr_4133:int;
        private var _color:uint;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _name:String;
        private var _SafeStr_4134:int;
        private var _SafeStr_4135:Boolean;

        public function GameChatEvent(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:uint, _arg_6:String, _arg_7:String, _arg_8:String, _arg_9:int, _arg_10:Boolean, _arg_11:Boolean=false, _arg_12:Boolean=false)
        {
            super(_arg_1, _arg_11, _arg_12);
            _SafeStr_4128 = _arg_2;
            _SafeStr_4132 = _arg_3;
            _SafeStr_4133 = _arg_4;
            _color = _arg_5;
            _SafeStr_3819 = _arg_6;
            _SafeStr_3834 = _arg_7;
            _name = _arg_8;
            _SafeStr_4134 = _arg_9;
            _SafeStr_4135 = _arg_10;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function get locX():int
        {
            return (_SafeStr_4133);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get teamId():int
        {
            return (_SafeStr_4134);
        }

        public function get notify():Boolean
        {
            return (_SafeStr_4135);
        }


    }
}//package com.sulake.habbo.game.events

// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_4133 = "_-127" (String#20681, DoABC#4)
// _SafeStr_4134 = "_-O1F" (String#21305, DoABC#4)
// _SafeStr_4135 = "_-C1J" (String#5687, DoABC#4)


