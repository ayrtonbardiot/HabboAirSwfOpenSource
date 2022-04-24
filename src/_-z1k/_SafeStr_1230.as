// by nota

//_-z1k._SafeStr_1230

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1230 implements IMessageParser 
    {

        private var _SafeStr_4318:int;
        private var _SafeStr_7870:String;
        private var _SafeStr_7871:int;
        private var _SafeStr_7872:int;
        private var _SafeStr_3734:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4318 = _arg_1.readInteger();
            _SafeStr_7870 = _arg_1.readString();
            _SafeStr_7871 = _arg_1.readInteger();
            _SafeStr_7872 = _arg_1.readInteger();
            _SafeStr_3734 = _arg_1.readInteger();
            return (true);
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }

        public function get videoId():String
        {
            return (_SafeStr_7870);
        }

        public function get startAtSeconds():int
        {
            return (_SafeStr_7871);
        }

        public function get endAtSeconds():int
        {
            return (_SafeStr_7872);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }


    }
}//package _-z1k

// _SafeStr_1230 = "_-6m" (String#6999, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_4318 = "_-9J" (String#7188, DoABC#3)
// _SafeStr_7870 = "_-s1m" (String#10198, DoABC#3)
// _SafeStr_7871 = "_-rV" (String#10159, DoABC#3)
// _SafeStr_7872 = "_-F1V" (String#7543, DoABC#3)


