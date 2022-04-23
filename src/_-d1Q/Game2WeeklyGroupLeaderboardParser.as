// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1Q.Game2WeeklyGroupLeaderboardParser

package _-d1Q
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2WeeklyGroupLeaderboardParser extends Game2LeaderboardParser 
    {

        private var _SafeStr_5098:int;
        private var _SafeStr_7205:int;
        private var _maxOffset:int;
        private var _SafeStr_7206:int;
        private var _SafeStr_7207:int;
        private var _SafeStr_6620:int;


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

        public function get favouriteGroupId():int
        {
            return (_SafeStr_6620);
        }

        override public function flush():Boolean
        {
            _SafeStr_5098 = -1;
            _SafeStr_7205 = -1;
            _maxOffset = -1;
            _SafeStr_7206 = -1;
            _SafeStr_7207 = -1;
            _SafeStr_6620 = -1;
            return (super.flush());
        }

        override public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5098 = _arg_1.readInteger();
            _SafeStr_7205 = _arg_1.readInteger();
            _maxOffset = _arg_1.readInteger();
            _SafeStr_7206 = _arg_1.readInteger();
            _SafeStr_7207 = _arg_1.readInteger();
            super.parse(_arg_1);
            _SafeStr_6620 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-d1Q

// _SafeStr_5098 = "_-vC" (String#10411, DoABC#3)
// _SafeStr_6620 = "_-u8" (String#10338, DoABC#3)
// _SafeStr_7205 = "_-8M" (String#7125, DoABC#3)
// _SafeStr_7206 = "_-9A" (String#7183, DoABC#3)
// _SafeStr_7207 = "_-v1A" (String#10380, DoABC#3)


