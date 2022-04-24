// by nota

//_-T1I._SafeStr_1449

package _-T1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1449 implements IMessageParser 
    {

        private var _SafeStr_7281:int;
        private var _SafeStr_4259:String;
        private var _SafeStr_7058:int;
        private var _SafeStr_7560:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7281 = _arg_1.readInteger();
            _SafeStr_4259 = _arg_1.readString();
            _SafeStr_7058 = _arg_1.readInteger();
            _SafeStr_7560 = _arg_1.readInteger();
            return (true);
        }

        public function get goalId():int
        {
            return (_SafeStr_7281);
        }

        public function get goalCode():String
        {
            return (_SafeStr_4259);
        }

        public function get isVotingAllowedForUser():Boolean
        {
            return (_SafeStr_7058 == 0);
        }

        public function get votesRemaining():int
        {
            return (_SafeStr_7560);
        }

        public function get resultCode():int
        {
            return (_SafeStr_7058);
        }


    }
}//package _-T1I

// _SafeStr_1449 = "_-g3" (String#9418, DoABC#3)
// _SafeStr_4259 = "_-Y1y" (String#8856, DoABC#3)
// _SafeStr_7058 = "_-t1u" (String#10267, DoABC#3)
// _SafeStr_7281 = "_-O1q" (String#8161, DoABC#3)
// _SafeStr_7560 = "_-R1E" (String#8341, DoABC#3)


