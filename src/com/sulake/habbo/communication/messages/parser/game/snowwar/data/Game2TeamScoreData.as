// by nota

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamScoreData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2TeamScoreData 
    {

        private var _SafeStr_5367:int;
        private var _SafeStr_8427:int;
        private var _players:Array;

        public function Game2TeamScoreData(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_8427 = _arg_1.readInteger();
            _SafeStr_5367 = _arg_1.readInteger();
            _players = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _players.push(new Game2TeamPlayerData(_SafeStr_8427, _arg_1));
                _local_3++;
            };
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }

        public function get teamReference():int
        {
            return (_SafeStr_8427);
        }

        public function get players():Array
        {
            return (_players);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)
// _SafeStr_8427 = "_-1o" (String#6618, DoABC#3)


