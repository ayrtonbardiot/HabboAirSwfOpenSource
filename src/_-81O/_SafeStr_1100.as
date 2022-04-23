// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81O._SafeStr_1100

package _-81O
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1100 implements IMessageParser 
    {

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_4790:int = -1;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get expressionType():int
        {
            return (_SafeStr_4790);
        }

        public function flush():Boolean
        {
            _SafeStr_4128 = 0;
            _SafeStr_4790 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_4790 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-81O

// _SafeStr_1100 = "_-ru" (String#10171, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4790 = "_-52" (String#6902, DoABC#3)


