// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-sq._SafeStr_1158

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2SnowWarGameStats;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2GameResult;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamScoreData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1158 implements IMessageParser 
    {

        private var _SafeStr_7522:int;
        private var _teams:Array;
        private var _SafeStr_6168:Array;
        private var _SafeStr_7523:Game2SnowWarGameStats;
        private var _SafeStr_6232:Game2GameResult;


        public function flush():Boolean
        {
            _SafeStr_7522 = -1;
            _teams = [];
            _SafeStr_6168 = [];
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7522 = _arg_1.readInteger();
            _SafeStr_6232 = new Game2GameResult(_arg_1);
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _teams.push(new Game2TeamScoreData(_arg_1));
                _local_3++;
            };
            _SafeStr_7523 = new Game2SnowWarGameStats(_arg_1);
            return (true);
        }

        public function get timeToNextState():int
        {
            return (_SafeStr_7522);
        }

        public function get teams():Array
        {
            return (_teams);
        }

        public function get teamScores():Array
        {
            return (_SafeStr_6168);
        }

        public function get gameResult():Game2GameResult
        {
            return (_SafeStr_6232);
        }

        public function get generalStats():Game2SnowWarGameStats
        {
            return (_SafeStr_7523);
        }


    }
}//package _-sq

// _SafeStr_1158 = "_-QA" (String#8313, DoABC#3)
// _SafeStr_6168 = "_-SQ" (String#8444, DoABC#3)
// _SafeStr_6232 = "_-AM" (String#7279, DoABC#3)
// _SafeStr_7522 = "_-7w" (String#7064, DoABC#3)
// _SafeStr_7523 = "_-L1b" (String#7952, DoABC#3)


