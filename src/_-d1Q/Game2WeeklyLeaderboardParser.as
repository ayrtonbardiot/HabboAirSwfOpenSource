// by nota

//_-d1Q.Game2WeeklyLeaderboardParser

package _-d1Q
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2WeeklyLeaderboardParser extends Game2LeaderboardParser 
    {

        private var _SafeStr_5098:int;
        private var _SafeStr_7205:int;
        private var _maxOffset:int;
        private var _SafeStr_7206:int;
        private var _SafeStr_7207:int;


        public function get year():int
        {
            return (_SafeStr_5098);
        }

        public function get week():int
        {
            return (_SafeStr_7205);
        }

        public function get maxOffset():int
        {
            return (_maxOffset);
        }

        public function get currentOffset():int
        {
            return (_SafeStr_7206);
        }

        public function get minutesUntilReset():int
        {
            return (_SafeStr_7207);
        }

        override public function flush():Boolean
        {
            _SafeStr_5098 = -1;
            _SafeStr_7205 = -1;
            _maxOffset = -1;
            _SafeStr_7206 = -1;
            _SafeStr_7207 = -1;
            return (super.flush());
        }

        override public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5098 = _arg_1.readInteger();
            _SafeStr_7205 = _arg_1.readInteger();
            _maxOffset = _arg_1.readInteger();
            _SafeStr_7206 = _arg_1.readInteger();
            _SafeStr_7207 = _arg_1.readInteger();
            return (super.parse(_arg_1));
        }


    }
}//package _-d1Q

// _SafeStr_5098 = "_-vC" (String#10411, DoABC#3)
// _SafeStr_7205 = "_-8M" (String#7125, DoABC#3)
// _SafeStr_7206 = "_-9A" (String#7183, DoABC#3)
// _SafeStr_7207 = "_-v1A" (String#10380, DoABC#3)


