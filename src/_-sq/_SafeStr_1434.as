// by nota

//_-sq._SafeStr_1434

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1434 implements IMessageParser 
    {

        private var _SafeStr_5722:int;
        private var _SafeStr_7528:int;
        private var _numberOfTeams:int;
        private var _players:Array;
        private var _SafeStr_5731:GameLevelData;

        public function _SafeStr_1434()
        {
            _players = [];
        }

        public function flush():Boolean
        {
            _SafeStr_5722 = -1;
            _SafeStr_7528 = -1;
            _numberOfTeams = -1;
            for each (var _local_1:Game2PlayerData in _players)
            {
                _local_1.dispose();
            };
            _players = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:* = null;
            _SafeStr_5722 = _arg_1.readInteger();
            _SafeStr_7528 = _arg_1.readInteger();
            _numberOfTeams = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = new Game2PlayerData();
                _local_4.parse(_arg_1);
                _players.push(_local_4);
                _local_3++;
            };
            _SafeStr_5731 = new GameLevelData(_arg_1);
            return (true);
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

        public function get players():Array
        {
            return (_players);
        }

        public function get gameLevel():GameLevelData
        {
            return (_SafeStr_5731);
        }


    }
}//package _-sq

// _SafeStr_1434 = "_-qx" (String#10105, DoABC#3)
// _SafeStr_5722 = "_-A1H" (String#7218, DoABC#3)
// _SafeStr_5731 = "_-bM" (String#9084, DoABC#3)
// _SafeStr_7528 = "_-R1J" (String#8342, DoABC#3)


