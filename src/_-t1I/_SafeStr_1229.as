// by nota

//_-t1I._SafeStr_1229

package _-t1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1229 implements IMessageParser 
    {

        private var _SafeStr_7533:String;
        private var _SafeStr_3623:int;
        private var _SafeStr_6073:int;


        public function flush():Boolean
        {
            _SafeStr_7533 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7533 = _arg_1.readString();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_6073 = _arg_1.readInteger();
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

        public function get maxLevel():int
        {
            return (_SafeStr_6073);
        }


    }
}//package _-t1I

// _SafeStr_1229 = "_-J1x" (String#7788, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_6073 = "_-Ga" (String#7636, DoABC#3)
// _SafeStr_7533 = "_-q1G" (String#10043, DoABC#3)


