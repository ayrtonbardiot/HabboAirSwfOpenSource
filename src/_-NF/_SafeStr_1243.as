// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1243

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1243 implements IMessageParser 
    {

        private var _SafeStr_4258:int;
        private var _nameValidationInfo:String;


        public function get result():int
        {
            return (_SafeStr_4258);
        }

        public function get nameValidationInfo():String
        {
            return (_nameValidationInfo);
        }

        public function flush():Boolean
        {
            _SafeStr_4258 = -1;
            _nameValidationInfo = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4258 = _arg_1.readInteger();
            _nameValidationInfo = _arg_1.readString();
            return (true);
        }


    }
}//package _-NF

// _SafeStr_1243 = "_-v1n" (String#10395, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)


