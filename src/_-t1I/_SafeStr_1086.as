// by nota

//_-t1I._SafeStr_1086

package _-t1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1086 implements IMessageParser 
    {

        private var _SafeStr_7533:String;
        private var _SafeStr_3623:int;
        private var _SafeStr_7534:Vector.<_SafeStr_1646>;
        private var _SafeStr_7535:Vector.<_SafeStr_1591>;


        public function flush():Boolean
        {
            _SafeStr_7533 = null;
            _SafeStr_7534 = null;
            _SafeStr_7535 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7533 = _arg_1.readString();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_7534 = new Vector.<_SafeStr_1646>();
            var _local_4:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _SafeStr_7534.push(new _SafeStr_1646(_arg_1));
                _local_3++;
            };
            _SafeStr_7535 = new Vector.<_SafeStr_1591>();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7535.push(new _SafeStr_1591(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get talentTrackName():String
        {
            return (_SafeStr_7533);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get rewardPerks():Vector.<_SafeStr_1646>
        {
            return (_SafeStr_7534);
        }

        public function get rewardProducts():Vector.<_SafeStr_1591>
        {
            return (_SafeStr_7535);
        }


    }
}//package _-t1I

// _SafeStr_1086 = "_-Z1y" (String#8916, DoABC#3)
// _SafeStr_1591 = "_-e1N" (String#9272, DoABC#3)
// _SafeStr_1646 = "_-o1n" (String#9936, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_7533 = "_-q1G" (String#10043, DoABC#3)
// _SafeStr_7534 = "_-4O" (String#6850, DoABC#3)
// _SafeStr_7535 = "_-G1w" (String#7612, DoABC#3)


