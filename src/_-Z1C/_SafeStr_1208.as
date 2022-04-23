// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1208

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1208 implements IMessageParser 
    {

        private var _flatId:int;
        private var _SafeStr_4128:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._flatId = _arg_1.readInteger();
            this._SafeStr_4128 = _arg_1.readInteger();
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }


    }
}//package _-Z1C

// _SafeStr_1208 = "_-w1j" (String#10462, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


