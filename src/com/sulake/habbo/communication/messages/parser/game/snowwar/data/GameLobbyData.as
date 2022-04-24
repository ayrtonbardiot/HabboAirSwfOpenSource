// by nota

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameLobbyData 
    {

        private var _SafeStr_8428:int;
        private var _levelName:String;
        private var _SafeStr_5722:int;
        private var _SafeStr_7528:int;
        private var _numberOfTeams:int;
        private var _SafeStr_8429:int;
        private var _SafeStr_8430:String;
        private var _SafeStr_8431:int;
        private var _players:Array = [];

        public function GameLobbyData(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_8428 = _arg_1.readInteger();
            _levelName = _arg_1.readString();
            _SafeStr_5722 = _arg_1.readInteger();
            _SafeStr_7528 = _arg_1.readInteger();
            _numberOfTeams = _arg_1.readInteger();
            _SafeStr_8429 = _arg_1.readInteger();
            _SafeStr_8430 = _arg_1.readString();
            _SafeStr_8431 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _players.push(new GameLobbyPlayerData(_arg_1));
                _local_3++;
            };
        }

        public function get gameId():int
        {
            return (_SafeStr_8428);
        }

        public function get gameType():int
        {
            return (_SafeStr_5722);
        }

        public function get fieldType():int
        {
            return (_SafeStr_7528);
        }

        public function get numberOfTeams():int
        {
            return (_numberOfTeams);
        }

        public function get maximumPlayers():int
        {
            return (_SafeStr_8429);
        }

        public function get owningPlayerName():String
        {
            return (_SafeStr_8430);
        }

        public function get levelEntryId():int
        {
            return (_SafeStr_8431);
        }

        public function get players():Array
        {
            return (_players);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_5722 = "_-A1H" (String#7218, DoABC#3)
// _SafeStr_7528 = "_-R1J" (String#8342, DoABC#3)
// _SafeStr_8428 = "_-N5" (String#8086, DoABC#3)
// _SafeStr_8429 = "_-l1" (String#9721, DoABC#3)
// _SafeStr_8430 = "_-120" (String#6560, DoABC#3)
// _SafeStr_8431 = "_-c1O" (String#9114, DoABC#3)


