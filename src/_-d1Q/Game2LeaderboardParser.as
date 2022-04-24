// by nota

//_-d1Q.Game2LeaderboardParser

package _-d1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2LeaderboardParser implements IMessageParser 
    {

        private var _SafeStr_7127:int;
        private var _SafeStr_7204:Array;
        private var _SafeStr_6625:int;


        public function flush():Boolean
        {
            _SafeStr_7127 = -1;
            _SafeStr_7204 = null;
            _SafeStr_6625 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7204 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7204.push(new _SafeStr_1623(_arg_1));
                _local_3++;
            };
            _SafeStr_6625 = _arg_1.readInteger();
            _SafeStr_7127 = _arg_1.readInteger();
            return (true);
        }

        public function get gameTypeId():int
        {
            return (_SafeStr_7127);
        }

        public function get leaderboard():Array
        {
            return (_SafeStr_7204);
        }

        public function get totalListSize():int
        {
            return (_SafeStr_6625);
        }


    }
}//package _-d1Q

// _SafeStr_1623 = "_-g1X" (String#9399, DoABC#3)
// _SafeStr_6625 = "_-Jp" (String#7854, DoABC#3)
// _SafeStr_7127 = "_-co" (String#9157, DoABC#3)
// _SafeStr_7204 = "_-Qs" (String#8333, DoABC#3)


