// by nota

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameLobbyPlayerData 
    {

        public static var _SafeStr_3616:Function = comparePlayersByTotalScore;
        public static var _SafeStr_3617:Function = comparePlayersBySkillLevel;

        private var _SafeStr_4128:int;
        private var _name:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_4134:int;
        private var _SafeStr_8432:int;
        private var _SafeStr_7548:int;
        private var _SafeStr_8433:int;

        public function GameLobbyPlayerData(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _name = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
            _SafeStr_4134 = _arg_1.readInteger();
            _SafeStr_8432 = _arg_1.readInteger();
            _SafeStr_7548 = _arg_1.readInteger();
            _SafeStr_8433 = _arg_1.readInteger();
        }

        private static function comparePlayersByTotalScore(_arg_1:GameLobbyPlayerData, _arg_2:GameLobbyPlayerData):Number
        {
            var _local_3:int = _arg_1.totalScore;
            var _local_4:int = _arg_2.totalScore;
            if (_local_3 < _local_4)
            {
                return (1);
            };
            if (_local_3 == _local_4)
            {
                return (0);
            };
            return (-1);
        }

        private static function comparePlayersBySkillLevel(_arg_1:GameLobbyPlayerData, _arg_2:GameLobbyPlayerData):Number
        {
            var _local_4:int = _arg_1.skillLevel;
            var _local_3:int = _arg_2.skillLevel;
            if (_local_4 < _local_3)
            {
                return (1);
            };
            if (_local_4 == _local_3)
            {
                return (0);
            };
            return (-1);
        }


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get teamId():int
        {
            return (_SafeStr_4134);
        }

        public function get skillLevel():int
        {
            return (_SafeStr_8432);
        }

        public function get totalScore():int
        {
            return (_SafeStr_7548);
        }

        public function get scoreToNextLevel():int
        {
            return (_SafeStr_8433);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_3616 = "_-vL" (String#10414, DoABC#3)
// _SafeStr_3617 = "_-H1j" (String#7677, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4134 = "_-O1F" (String#8136, DoABC#3)
// _SafeStr_7548 = "_-CE" (String#7384, DoABC#3)
// _SafeStr_8432 = "_-qL" (String#10077, DoABC#3)
// _SafeStr_8433 = "_-22x" (String#6682, DoABC#3)


