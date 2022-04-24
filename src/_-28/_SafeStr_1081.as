// by nota

//_-28._SafeStr_1081

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1081 implements IMessageParser 
    {

        private var _SafeStr_4320:String;
        private var _SafeStr_4862:int;
        private var _name:String;
        private var _description:String;


        public function flush():Boolean
        {
            _SafeStr_4320 = null;
            _SafeStr_4862 = 0;
            _name = null;
            _description = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4320 = _arg_1.readString();
            _SafeStr_4862 = _arg_1.readInteger();
            _name = _arg_1.readString();
            _description = _arg_1.readString();
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

        public function get name():String
        {
            return (_name);
        }

        public function get description():String
        {
            return (_description);
        }


    }
}//package _-28

// _SafeStr_1081 = "_-a1V" (String#8976, DoABC#3)
// _SafeStr_4320 = "_-i17" (String#9521, DoABC#3)
// _SafeStr_4862 = "_-Q1H" (String#8290, DoABC#3)


