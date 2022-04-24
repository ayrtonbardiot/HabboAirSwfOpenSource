// by nota

//_-g1G._SafeStr_1442

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1442 implements IMessageParser 
    {

        private var _SafeStr_6218:Boolean;
        private var _SafeStr_7244:String;
        private var _SafeStr_7245:String;
        private var _SafeStr_7246:int;


        public function flush():Boolean
        {
            _SafeStr_6218 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7244 = _arg_1.readString();
            if (_SafeStr_7244 != "")
            {
                _SafeStr_6218 = true;
            };
            _SafeStr_7245 = _arg_1.readString();
            _SafeStr_7246 = _arg_1.readInteger();
            return (true);
        }

        public function get available():Boolean
        {
            return (_SafeStr_6218);
        }

        public function get pricePointUrl():String
        {
            return (_SafeStr_7244);
        }

        public function get market():String
        {
            return (_SafeStr_7245);
        }

        public function get lengthInDays():int
        {
            return (_SafeStr_7246);
        }


    }
}//package _-g1G

// _SafeStr_1442 = "_-c1Y" (String#9117, DoABC#3)
// _SafeStr_6218 = "_-j1z" (String#9613, DoABC#3)
// _SafeStr_7244 = "_-GH" (String#7626, DoABC#3)
// _SafeStr_7245 = "_-i5" (String#9544, DoABC#3)
// _SafeStr_7246 = "_-a8" (String#9008, DoABC#3)


