// by nota

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamPlayerData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2TeamPlayerData 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _SafeStr_5367:int;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_8425:Game2PlayerStatsData;
        private var _SafeStr_4134:int;
        private var _SafeStr_8426:Boolean;

        public function Game2TeamPlayerData(_arg_1:int, _arg_2:IMessageDataWrapper):void
        {
            _SafeStr_4134 = _arg_1;
            _userName = _arg_2.readString();
            _SafeStr_4128 = _arg_2.readInteger();
            _SafeStr_3819 = _arg_2.readString();
            _SafeStr_3834 = _arg_2.readString();
            _SafeStr_5367 = _arg_2.readInteger();
            _SafeStr_8425 = new Game2PlayerStatsData(_arg_2);
            _SafeStr_8426 = false;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get playerStats():Game2PlayerStatsData
        {
            return (_SafeStr_8425);
        }

        public function get teamId():int
        {
            return (_SafeStr_4134);
        }

        public function get willRejoin():Boolean
        {
            return (_SafeStr_8426);
        }

        public function set willRejoin(_arg_1:Boolean):void
        {
            _SafeStr_8426 = _arg_1;
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4134 = "_-O1F" (String#8136, DoABC#3)
// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)
// _SafeStr_8425 = "_-01R" (String#6480, DoABC#3)
// _SafeStr_8426 = "_-LN" (String#7970, DoABC#3)


