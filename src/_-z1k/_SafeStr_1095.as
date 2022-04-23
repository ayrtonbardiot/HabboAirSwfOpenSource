// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1095

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1095 implements IMessageParser 
    {

        private var _SafeStr_4157:int = 0;
        private var _nameValidationStatus:int = 0;
        private var _nameValidationInfo:String = null;


        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get nameValidationStatus():int
        {
            return (_nameValidationStatus);
        }

        public function get nameValidationInfo():String
        {
            return (_nameValidationInfo);
        }

        public function flush():Boolean
        {
            _SafeStr_4157 = 0;
            _nameValidationStatus = 0;
            _nameValidationInfo = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4157 = _arg_1.readInteger();
            _nameValidationStatus = _arg_1.readInteger();
            _nameValidationInfo = _arg_1.readString();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1095 = "_-8D" (String#7118, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)


