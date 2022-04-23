// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-k1x._SafeStr_1473

package _-k1x
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1473 implements IMessageParser 
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
            this._flatId = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-k1x

// _SafeStr_1473 = "_-FK" (String#7564, DoABC#3)


