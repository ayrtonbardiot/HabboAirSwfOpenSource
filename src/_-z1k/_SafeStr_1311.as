// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1311

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1311 implements IMessageParser 
    {

        private var _SafeStr_3820:int;
        private var _status:int;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get status():int
        {
            return (_status);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = -1;
            _status = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_3820 = _arg_1.readInteger();
            _status = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1311 = "_-tb" (String#10290, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


