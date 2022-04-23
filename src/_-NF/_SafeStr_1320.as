// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1320

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1320 implements IMessageParser 
    {

        private var _SafeStr_4128:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            return (true);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }


    }
}//package _-NF

// _SafeStr_1320 = "_-yY" (String#10637, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


