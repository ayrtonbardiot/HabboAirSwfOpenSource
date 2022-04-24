// by nota

//_-TT._SafeStr_1322

package _-TT
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1322 implements IMessageParser 
    {

        private var _SafeStr_4320:String;
        private var _SafeStr_4862:int;


        public function flush():Boolean
        {
            _SafeStr_4320 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4320 = _arg_1.readString();
            _SafeStr_4862 = _arg_1.readInteger();
            return (true);
        }

        public function get contentType():String
        {
            return (_SafeStr_4320);
        }

        public function get classId():int
        {
            return (_SafeStr_4862);
        }


    }
}//package _-TT

// _SafeStr_1322 = "_-z1D" (String#10655, DoABC#3)
// _SafeStr_4320 = "_-i17" (String#9521, DoABC#3)
// _SafeStr_4862 = "_-Q1H" (String#8290, DoABC#3)


