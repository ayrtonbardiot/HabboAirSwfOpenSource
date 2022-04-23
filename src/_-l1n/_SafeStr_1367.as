// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1n._SafeStr_1367

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1367 implements IMessageParser 
    {

        private var _flatId:int = 0;


        public function get flatId():int
        {
            return (_flatId);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _flatId = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-l1n

// _SafeStr_1367 = "_-oC" (String#9947, DoABC#3)


